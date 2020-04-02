package com.sap.bpm.wfs.forms.adaptivecards.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpResponse;

public class HttpUtils {

    /**
     * Retrieves the content of an HTTP response. Returns defaultContent as a fallback.
     */
    public static InputStream getContent(HttpResponse response, String defaultContent) throws IOException {
        if (response == null || response.getEntity() == null) {
            return new ByteArrayInputStream(defaultContent.getBytes());
        }

        return response.getEntity().getContent();
    }

}
