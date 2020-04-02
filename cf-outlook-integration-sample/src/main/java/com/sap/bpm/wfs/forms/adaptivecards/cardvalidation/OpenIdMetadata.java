//------------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//------------------------------------------------------------------------------

package com.sap.bpm.wfs.forms.adaptivecards.cardvalidation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Represents an OpenID configuration.
 *
 * Original source at: https://github.com/OfficeDev/outlook-actionable-messages-java-token-validation
 */
public class OpenIdMetadata {

    private JsonNode config;

    /**
     * Constructor.
     *
     * @param url The URL to the Open ID configuration.
     */
    public OpenIdMetadata(String url) throws IOException {
        getOpenIdConfiguration(url);
    }

    /**
     * Gets the URL of the JSON web key set in the configuration.
     *
     * @return String The URL of the JSON web key set.
     */
    public String getJsonWebKeyUrl() {
        return config.path("jwks_uri").asText();
    }

    /**
     * Gets the Open ID configuration.
     *
     * @param url The URL of the Open ID configuration.
     */
    private void getOpenIdConfiguration(String url) throws IOException {
        config = getJsonFromUrl(url);
    }

    /**
     * Reads the JSON returned by the URL.
     *
     * @param url The URL to read the JSON from.
     * @return JsonNode The JSON object.
     */
    private JsonNode getJsonFromUrl(String url) throws IOException {
        try (BufferedReader rd = new BufferedReader(new InputStreamReader(new URL(url).openStream()))) {
            StringBuilder sb = new StringBuilder();
            int cp;

            while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
            }

            ObjectMapper mapper = new ObjectMapper();
            JsonNode json = mapper.readTree(sb.toString());

            return json;
        }
    }
}