package com.sap.bpm.wfs.forms.adaptivecards.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sap.bpm.wfs.forms.adaptivecards.RemoteAccessException;
import com.sap.bpm.wfs.forms.adaptivecards.config.VcapConfig;

public class UaaUtils {

    private static final Logger LOG = LoggerFactory.getLogger(UaaUtils.class);

    /*
     * Returns a valid access token to call CP Workflow.
     *
     * @throws IllegalStateException If the token is null or empty
     * @throws RemoteAccessException If the authorization server could not be reached
     */
    public static String getWorkflowAccessToken(VcapConfig vcapConfig) throws IllegalStateException, RemoteAccessException {
        String credentials = vcapConfig.getWorkflowUaaCredentials();
        String oauthTokenEndpoint = vcapConfig.getWorkflowUaaTokenEndpoint() + "?grant_type=client_credentials";
        return getServiceAccessToken(credentials, oauthTokenEndpoint);
    }

    /*
     * Returns a valid access token to call the destination service.
     *
     * @throws IllegalStateException If the token is null or empty
     * @throws RemoteAccessException If the authorization server could not be reached
     */
    public static String getDestinationAccessToken(VcapConfig vcapConfig) throws IllegalStateException, RemoteAccessException {
        String credentials = vcapConfig.getDestinationUaaCredentials();
        String oauthTokenEndpoint = vcapConfig.getDestinationUaaTokenEndpoint() + "?grant_type=client_credentials";
        return getServiceAccessToken(credentials, oauthTokenEndpoint);
    }

    private static String getServiceAccessToken(String credentials, String oauthTokenEndpoint) throws IllegalStateException, RemoteAccessException {
        HttpPost httpPost = new HttpPost(oauthTokenEndpoint);
        httpPost.setHeader("Authorization", credentials);

        LOG.debug("Retrieving access token from {}", oauthTokenEndpoint);

        String accessToken = null;
        try (CloseableHttpClient httpclient = HttpClients.createDefault();
                CloseableHttpResponse response = httpclient.execute(httpPost);
                InputStream content = HttpUtils.getContent(response, "{}")) {
            ObjectNode node = (ObjectNode) new ObjectMapper().readTree(content);
            accessToken = node.path("access_token").asText();
        } catch (IOException e) {
            throw new RemoteAccessException("Error while obtaining access token", e);
        }

        if (accessToken == null || accessToken.isEmpty()) {
            throw new IllegalStateException("Access token is invalid");
        }

        return accessToken;
    }

}
