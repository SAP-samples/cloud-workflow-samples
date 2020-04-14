package com.sap.bpm.wfs.forms.adaptivecards;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sap.bpm.wfs.forms.adaptivecards.cardvalidation.ActionableMessageTokenValidationResult;
import com.sap.bpm.wfs.forms.adaptivecards.cardvalidation.ActionableMessageTokenValidator;
import com.sap.bpm.wfs.forms.adaptivecards.config.MailConfig;
import com.sap.bpm.wfs.forms.adaptivecards.config.VcapConfig;
import com.sap.bpm.wfs.forms.adaptivecards.util.HttpUtils;
import com.sap.bpm.wfs.forms.adaptivecards.util.UaaUtils;

/**
 * Handles actions on Microsoft Adaptive Cards triggered by users in Microsoft
 * Outlook and completes tasks in CP Workflow.
 */
@RestController
public class CardSubmissionController {

    private static final Logger LOG = LoggerFactory.getLogger(CardSubmissionController.class);

    // The Organization Info in the Actionable Email Developer Dashboard
    // https://outlook.office.com/connectors/oam/publish
    @Value("${organization.id}")
    private String orgId;

    @Autowired
    private VcapConfig vcapConfig;

    @Autowired
    private MailConfig mailConfig;

    @Value("${card.submission.url}")
    private String cardSubmissionUrl;

    @RequestMapping(value = "/submit-card/{taskId}/action/{actionId}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<String> submitCard(@PathVariable String taskId, @PathVariable String actionId,
            @RequestHeader(value = "Authorization") String auth, @RequestBody String body) {
        LOG.info("Submitting card for task {} with action {} and body {}...", taskId, actionId, body);

        // The email address used to send the Adaptive Card
        try {
            mailConfig.updateCredentialsFromDestination();
        } catch (IllegalStateException | RemoteAccessException e) {
            LOG.error("Mail configuration could not be retrieved");
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        String sender = mailConfig.getMailUser();

        ActionableMessageTokenValidator validator = new ActionableMessageTokenValidator();
        ActionableMessageTokenValidationResult result = validator.validateToken(auth, cardSubmissionUrl, orgId, sender);
        if (!result.getValidationSucceeded()) {
            if (result.getException() != null) {
                LOG.error("Error occurred while submitting card for task " + taskId, result.getException());
            }
            if (!result.getErrors().isEmpty()) {
                for (String error : result.getErrors()) {
                    LOG.error("Validation of token failed while submitting card {}: {}", taskId, error);
                }
            }

            HttpHeaders headers = new HttpHeaders();
            headers.add("CARD-ACTION-STATUS", "Authentication failed. Please contact your help desk.");
            return new ResponseEntity<>(null, headers, HttpStatus.UNAUTHORIZED);
        }

        // TODO: Check the task performer also was assigned to the task
        // in the workflow by querying the task instance REST API
        // and returning HTTP 403 if this was not the case

        // TODO: Propagate the principal signed into Outlook 365 to this API call
        // and complete the task on the principal's behalf

        String accessToken = null;
        try {
            accessToken = UaaUtils.getWorkflowAccessToken(vcapConfig);
        } catch (IllegalStateException e) {
            LOG.error("Access token for task {} is invalid", taskId);
            HttpHeaders headers = new HttpHeaders();
            headers.add("CARD-ACTION-STATUS", "Authentication failed. Please contact your help desk.");
            return new ResponseEntity<>(null, headers, HttpStatus.UNAUTHORIZED);
        } catch (RemoteAccessException e) {
            LOG.error("Access token for task {} could not be obtained", taskId);
            HttpHeaders headers = new HttpHeaders();
            headers.add("CARD-ACTION-STATUS", "There was an error processing your request.");
            return new ResponseEntity<>(null, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return submitCardToWorkflow(taskId, actionId, accessToken);
    }

    /*
     * Processes the card and submits the user's action to CP Workflow.
     */
    private ResponseEntity<String> submitCardToWorkflow(String taskId, String actionId, String accessToken) {
        String workflowAPI = vcapConfig.getWorkflowRestUrl();
        String taskInstanceUrl = workflowAPI + "/v1/task-instances/" + taskId;
        HttpPatch httpPatch = new HttpPatch(taskInstanceUrl);
        httpPatch.setHeader("Authorization", "Bearer " + accessToken);
        httpPatch.setHeader("Content-Type", "application/json");
        httpPatch.setHeader("Accept", "application/json");
        String json = "{\"context\": {\"result\": \"" + actionId + "\"}, \"status\": \"COMPLETED\"}";
        StringEntity entity;
        try {
            entity = new StringEntity(json);
        } catch (UnsupportedEncodingException e) {
            LOG.error("Server does not support the default HTTP charset", e);
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        httpPatch.setEntity(entity);

        try (CloseableHttpClient httpclient = HttpClients.createDefault();
                CloseableHttpResponse response = httpclient.execute(httpPatch);
                InputStream content = HttpUtils.getContent(response, "{}");
                Scanner scanner = new Scanner(content, "utf-8")) {
            ObjectNode responseNode = (ObjectNode) new ObjectMapper().readTree(scanner.useDelimiter("\\A").next());

            int status = response.getStatusLine().getStatusCode();
            HttpHeaders headers = new HttpHeaders();
            switch (status) {
                case 204:
                    headers.add("CARD-ACTION-STATUS", "The task was completed.");
                    return new ResponseEntity<>(null, headers, HttpStatus.OK);
                case 400:
                    if ("bpm.workflowruntime.rest.task.final.status"
                            .equalsIgnoreCase(responseNode.path("error").path("code").asText())) {
                        headers.add("CARD-ACTION-STATUS", "The task was already completed.");
                        return new ResponseEntity<>(null, headers, HttpStatus.OK);
                    }
                    // fall through here...
                default:
                    headers.add("CARD-ACTION-STATUS", "There was an error processing your request.");
                    LOG.error("Error while completing task {} with action {}: {}", taskId, actionId,
                            responseNode.asText());
                    return new ResponseEntity<>(null, headers, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (IOException e) {
            LOG.error("Error while completing task " + taskId + " with action " + actionId, e);

            HttpHeaders headers = new HttpHeaders();
            headers.add("CARD-ACTION-STATUS", "There was an error processing your request.");
            return new ResponseEntity<>(null, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
