package com.sap.bpm.wfs.forms.adaptivecards;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sap.bpm.wfs.forms.adaptivecards.config.VcapConfig;
import com.sap.bpm.wfs.forms.adaptivecards.util.HttpUtils;
import com.sap.bpm.wfs.forms.adaptivecards.util.Task;
import com.sap.bpm.wfs.forms.adaptivecards.util.UaaUtils;

/**
 * Periodically running job that checks for task updates on CP Workflow and orchestrates sending E-Mails
 * to participants including Microsoft Adaptive Cards.
 */
@Configuration
@EnableAsync
@EnableScheduling
public class TaskChangeListenerJob {

    private static final Logger LOG = LoggerFactory.getLogger(TaskChangeListenerJob.class);

    // The Originator Info in the Actionable Email Developer Dashboard
    // https://outlook.office.com/connectors/oam/publish
    @Value("${originator.id}")
    private String originatorId;

    @Autowired
    private VcapConfig vcapConfig;

    @Autowired
    private TaskRetriever taskRetriever;

    @Autowired
    private CardBuilder cardBuilder;

    @Autowired
    private CardMailer cardMailer;

    // TODO: Properly persist this value so it survives application restarts
    // TODO: Properly deal with duplicate e-mails being sent when running multiple instances of this application
    // TODO: Properly deal with lost updates between subsequent runs, e.g. through a confidence interval and de-duping
    private static long lastSync = new Date().getTime();

    @Scheduled(fixedDelay = 30000)
    public void pullMessages() {
        LOG.info("Checking for new task updates...");

        long lastChangedFrom = lastSync;
        lastSync = new Date().getTime();

        try {
            String accessToken = UaaUtils.getWorkflowAccessToken(vcapConfig);

            String taskInstancesChanged = getTaskUpdates(lastChangedFrom, accessToken);

            processUpdatedTasks(taskInstancesChanged);
        } catch (IllegalStateException | RemoteAccessException e) {
            LOG.error(e.getMessage(), e);
        }
    }

    /*
     * Retrieves tasks updated since a certain point in time.
     */
    private String getTaskUpdates(long lastChangedFrom, String accessToken) throws RemoteAccessException {
        String workflowAPI = vcapConfig.getWorkflowRestUrl();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

        String taskInstancesUrl = workflowAPI + "/v1/task-instances?status=READY&lastChangedFrom=" + format.format(new Date(lastChangedFrom));
        LOG.info("Task instances query: {}", taskInstancesUrl);
        HttpGet httpGet = new HttpGet(taskInstancesUrl);
        httpGet.setHeader("Authorization", "Bearer " + accessToken);

        String taskInstancesChanged = "[]";
        try (CloseableHttpClient httpclient = HttpClients.createDefault();
                CloseableHttpResponse response = httpclient.execute(httpGet);
                InputStream content = HttpUtils.getContent(response, "{}");
                Scanner scanner = new Scanner(content, "utf-8")) {
            taskInstancesChanged = scanner.useDelimiter("\\A").next();
        } catch (IOException e) {
            throw new RemoteAccessException("Error while retrieving task updates", e);
        }
        return taskInstancesChanged;
    }

    /*
     * Retrieve updated tasks one by one and send notification e-mail with embedded adaptive card.
     */
    private void processUpdatedTasks(String taskInstancesChanged) throws RemoteAccessException {
        try {
            cardMailer.updateCredentialsFromDestination();

            ArrayNode tasksChanged = (ArrayNode) new ObjectMapper().readTree(taskInstancesChanged);

            List<String> taskIds = new ArrayList<>();
            for (JsonNode node : tasksChanged) {
                ObjectNode taskNode = (ObjectNode) node;
                taskIds.add(taskNode.path("id").asText());
            }
            LOG.info("New Tasks: {}", taskIds.size() > 0 ? String.join(", ", taskIds) : "(none)");

            for (JsonNode node : tasksChanged) {
                ObjectNode taskNode = (ObjectNode) node;

                Task task = taskRetriever.retrieveTask(taskNode);

                List<String> recipients = new ObjectMapper().convertValue(taskNode.path("recipientUsers"), new TypeReference<List<String>>() {});
                String card = cardBuilder.buildCard(task, originatorId, "transform.jslt");
                cardMailer.sendMail(recipients, task.getInfo().get("subject").asText(), card);
            }
        } catch (IOException | IllegalStateException | RemoteAccessException e) {
            throw new RemoteAccessException("Error while processing task updates", e);
        }
    }

}