package com.sap.bpm.wfs.forms.adaptivecards;


import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sap.bpm.wfs.forms.adaptivecards.config.VcapConfig;
import com.sap.bpm.wfs.forms.adaptivecards.util.HttpUtils;
import com.sap.bpm.wfs.forms.adaptivecards.util.Task;
import com.sap.bpm.wfs.forms.adaptivecards.util.UaaUtils;

/**
 * Retrieves a single task by id and returns basic task information along with relevant context data and form data.
 */
@Configuration
public class TaskRetriever {

    private static final Logger LOG = LoggerFactory.getLogger(TaskRetriever.class);

    @Autowired
    private VcapConfig vcapConfig;

    @Bean
    public TaskRetriever getTaskRetriever() {
        return this;
    }

    public Task retrieveTask(ObjectNode taskNode) throws IllegalStateException, RemoteAccessException {
        LOG.info("Retrieving task {}...", taskNode.path("id").asText());

        String taskId = taskNode.path("id").asText();

        String accessToken = UaaUtils.getWorkflowAccessToken(vcapConfig);
        String workflowAPI = vcapConfig.getWorkflowRestUrl();

        String taskInstanceContext = getTaskInstanceContext(taskId, accessToken, workflowAPI);

        String taskInstanceForm = getTaskInstanceForm(taskId, accessToken, workflowAPI);

        ObjectMapper mapper = new ObjectMapper();
        try {
            return new Task(taskNode,
                    (ObjectNode) mapper.readTree(taskInstanceContext),
                    (ObjectNode) mapper.readTree(taskInstanceForm));
        } catch (IOException e) {
            throw new RemoteAccessException("Error while processing task " + taskId, e);
        }
    }

    private String getTaskInstanceContext(String taskId, String accessToken, String workflowAPI) throws RemoteAccessException {
        String taskInstanceContext = "{}";
        String taskInstanceContextUrl = workflowAPI + "/v1/task-instances/" + taskId + "/context";
        LOG.info("Task instance context endpoint: {}", taskInstanceContextUrl);
        HttpGet httpGet = new HttpGet(taskInstanceContextUrl);
        httpGet.setHeader("Authorization", "Bearer " + accessToken);

        try (CloseableHttpClient httpclient = HttpClients.createDefault();
                CloseableHttpResponse response = httpclient.execute(httpGet);
                InputStream content = HttpUtils.getContent(response, "{}");
                Scanner scanner = new Scanner(content, "utf-8")) {
            taskInstanceContext = scanner.useDelimiter("\\A").next();
        } catch (IOException e) {
            throw new RemoteAccessException("Error while retrieving context for task " + taskId, e);
        }
        return taskInstanceContext;
    }

    private String getTaskInstanceForm(String taskId, String accessToken, String workflowAPI) throws RemoteAccessException {
        String taskInstanceForm = "{}";
        String taskInstanceFormUrl = workflowAPI + "/internal/v1/task-instances/" + taskId + "/form/model";
        LOG.info("Task instance form endpoint: {}", taskInstanceFormUrl);
        HttpGet httpGet = new HttpGet(taskInstanceFormUrl);
        httpGet.setHeader("Authorization", "Bearer " + accessToken);

        try (CloseableHttpClient httpclient = HttpClients.createDefault();
                CloseableHttpResponse response = httpclient.execute(httpGet);
                InputStream content = HttpUtils.getContent(response, "{}");
                Scanner scanner = new Scanner(content, "utf-8")) {
            taskInstanceForm = scanner.useDelimiter("\\A").next();
        } catch (IOException e) {
            throw new RemoteAccessException("Error while retrieving form for task " + taskId, e);
        }
        return taskInstanceForm;
    }

}