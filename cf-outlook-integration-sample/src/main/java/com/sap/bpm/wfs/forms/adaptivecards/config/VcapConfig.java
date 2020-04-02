package com.sap.bpm.wfs.forms.adaptivecards.config;

import java.io.IOException;
import java.util.Base64;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Configuration
public class VcapConfig {

    String vcapApp = System.getenv("VCAP_APPLICATION");
    String vcapServices = System.getenv("VCAP_SERVICES");

    @Bean
    public ObjectNode vcapApplication() {
        String vcapApp = System.getenv("VCAP_APPLICATION");
        if (vcapApp == null) vcapApp = "{}";

        ObjectMapper mapper = new ObjectMapper();
        try {
            return (ObjectNode) mapper.readTree(vcapApp);
        } catch (IOException e) {
            e.printStackTrace();
            throw new IllegalStateException("Unable to get VCAP_APPLICATION environment variables.");
        }
    }

    @Bean
    public ObjectNode vcapServices() {
        String vcapServices = System.getenv("VCAP_SERVICES");
        if (vcapServices == null) vcapServices = "{}";

        ObjectMapper mapper = new ObjectMapper();
        try {
            return (ObjectNode) mapper.readTree(vcapServices);
        } catch (IOException e) {
            throw new IllegalStateException("Unable to get VCAP_SERVICES environment variables.");
        }
    }

    // Workflow

    public String getWorkflowRestUrl() {
        return vcapServices().path("workflow").path(0).path("credentials").path("endpoints").path("workflow_rest_url").asText();
    }

    public String getWorkflowUaaTokenEndpoint() {
        return vcapServices().path("workflow").path(0).path("credentials").path("uaa").path("url").asText() + "/oauth/token";
    }

    public String getWorkflowUaaClientId() {
        return vcapServices().path("workflow").path(0).path("credentials").path("uaa").path("clientid").asText();
    }

    public String getWorkflowUaaClientSecret() {
        return vcapServices().path("workflow").path(0).path("credentials").path("uaa").path("clientsecret").asText();
    }

    public String getWorkflowUaaCredentials() {
        String clientId = getWorkflowUaaClientId();
        String clientSecret = getWorkflowUaaClientSecret();
        return getCredentials(clientId, clientSecret);
    }

    // Destination

    public String getDestinationRestUrl() {
        return vcapServices().path("destination").path(0).path("credentials").path("uri").asText();
    }

    public String getDestinationUaaTokenEndpoint() {
        return vcapServices().path("destination").path(0).path("credentials").path("url").asText() + "/oauth/token";
    }

    public String getDestinationUaaClientId() {
        return vcapServices().path("destination").path(0).path("credentials").path("clientid").asText();
    }

    public String getDestinationUaaClientSecret() {
        return vcapServices().path("destination").path(0).path("credentials").path("clientsecret").asText();
    }

    public String getDestinationUaaCredentials() {
        String clientId = getDestinationUaaClientId();
        String clientSecret = getDestinationUaaClientSecret();
        return getCredentials(clientId, clientSecret);
    }

    /*
     * Returns a base64-encoded BASIC Authorization header value using client ID and secret.
     */
    private String getCredentials(String clientId, String clientSecret) {
        String clientIdAndSecret = clientId + ":" + clientSecret;
        return new String("Basic " + Base64.getEncoder().encodeToString(clientIdAndSecret.getBytes()));
    }
}