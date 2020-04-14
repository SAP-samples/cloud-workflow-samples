package com.sap.bpm.wfs.forms.adaptivecards;

import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.TextNode;
import com.sap.bpm.wfs.forms.adaptivecards.config.VcapConfig;
import com.sap.bpm.wfs.forms.adaptivecards.util.Task;
import com.schibsted.spt.data.jslt.Expression;
import com.schibsted.spt.data.jslt.Parser;

/**
 * Builds a Microsoft Adaptive Card out of of a CP Workflow Task and Form.
 */
@Configuration
public class CardBuilder {

    private static final Logger LOG = LoggerFactory.getLogger(CardBuilder.class);

    @Bean
    public CardBuilder getCardBuilder() {
        return this;
    }

    @Autowired
    private VcapConfig vcapConfig;

    @Value("${card.submission.url}")
    private String cardSubmissionUrl;

    public String buildCard(Task task, String originator, String templateFileName) throws IllegalStateException {
        LOG.info("Building card for task {}", task.getInfo().path("id").asText());

        ObjectNode taskFormNode = task.getForm();
        LOG.info("Form: {}", taskFormNode.toString());

        JsonNode taskContextNode = task.getContext();
        taskFormNode.set("data", taskContextNode);

        taskFormNode.set("cardSubmissionUrl", new TextNode(cardSubmissionUrl + "/submit-card/" + task.getInfo().get("id").asText()));

        taskFormNode.set("originator", new TextNode(originator));

        String transformString;
        try (InputStream transformDocument = CardBuilder.class.getResourceAsStream(templateFileName);
                Scanner scanner = new Scanner(transformDocument, "utf-8")) {
            transformString = scanner.useDelimiter("\\A").next();
        } catch (IOException e) {
            throw new IllegalStateException("Could not read template file: " + templateFileName, e);
        }

        Expression jslt = Parser.compileString(transformString);
        JsonNode output = jslt.apply(taskFormNode);
        LOG.info("Adaptive Card: {}", output);

        return output.toString();
    }
}