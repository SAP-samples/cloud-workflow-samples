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

import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.util.List;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.jwk.source.RemoteJWKSet;
import com.nimbusds.jose.proc.BadJOSEException;
import com.nimbusds.jose.proc.JWSKeySelector;
import com.nimbusds.jose.proc.JWSVerificationKeySelector;
import com.nimbusds.jwt.JWT;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.JWTParser;
import com.nimbusds.jwt.proc.ConfigurableJWTProcessor;
import com.nimbusds.jwt.proc.DefaultJWTProcessor;

/**
 * Token validator for actionable messages.
 *
 * Original source at: https://github.com/OfficeDev/outlook-actionable-messages-java-token-validation
 *
 * Check
 *
 * https://docs.microsoft.com/en-us/outlook/actionable-messages/security-requirements#signed-card-payloads
 * https://github.com/OfficeDev/outlook-actionable-messages-java-token-validation/
 *
 * for verification details.
 */
public class ActionableMessageTokenValidator {

    // The value of the "appid" claim in the token.
    private static final String O365_APP_ID = "48af08dc-f6d2-435f-b2a7-069abd99c086";
    // The URL of the O365 OpenID Connect metadata endpoint.
    private static final String O365_OPENID_METADATA_URL = "https://substrate.office.com/sts/common/.well-known/openid-configuration";
    // The value of the "iss" claim in the token.
    private static final String O365_TOKEN_ISSUER = "https://substrate.office.com/sts/";

    public ActionableMessageTokenValidator() {
    }

    /**
     * Validates an actionable message token.
     *
     * https://docs.microsoft.com/en-us/outlook/actionable-messages/security-requirements#signed-card-payloads
     *
     * @param authHeader    The authorization header containing the token issued by Microsoft.
     * @param targetUrl     The target service base URL expected in the token. For
     *                      example if the target service URL is
     *                      https://api.xyz.com/expense/approve, the target service base
     *                      URL is https://api.xyz.com.
     *
     * @return ActionableMessageTokenValidationResult The result of the validation.
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public ActionableMessageTokenValidationResult validateToken(String authHeader, String targetUrl, String orgId, String sender) {
        ActionableMessageTokenValidationResult result = new ActionableMessageTokenValidationResult();
        try {
            String[] tokens = authHeader.split(" ");
            String token = null;
            if (tokens.length != 2) {
                result.addError("Invalid token");
                return result;
            }
            token = tokens[1];

            OpenIdMetadata config = new OpenIdMetadata(O365_OPENID_METADATA_URL);

            JWT jwt = JWTParser.parse(token);
            JWSAlgorithm expectedJWSAlg = JWSAlgorithm.parse(jwt.getHeader().getAlgorithm().getName());

            JWKSource keySource = new RemoteJWKSet(new URL(config.getJsonWebKeyUrl()));
            JWSKeySelector keySelector = new JWSVerificationKeySelector(expectedJWSAlg, keySource);

            // JWT Processor / JWT Claims Verifier does default verification properly signed JWT and check of exp and nbf claims
            ConfigurableJWTProcessor jwtProcessor = new DefaultJWTProcessor();
            jwtProcessor.setJWSKeySelector(keySelector);

            JWTClaimsSet claimsSet = jwtProcessor.process(token, null);

            verifyAndPopulateClaims(result, claimsSet, targetUrl);
            verifyOrganizationAndSender(result, orgId, sender);
        } catch(IOException | ParseException | BadJOSEException | JOSEException e) {
            result.setException(e);
        }

        return result;
    }

    /*
     * Validates a set of claims in a JWT token and populates validation results.
     *
     * 1. The token is issued by Microsoft
     * 2. The URL of the audience claim is the one expected
     * 3. The application id corresponds to that of Office 365
     */
    private void verifyAndPopulateClaims(ActionableMessageTokenValidationResult result, JWTClaimsSet claims, String targetUrl) {
        try {
            if (!O365_TOKEN_ISSUER.equalsIgnoreCase(claims.getIssuer())) {
                result.addError("Invalid token issuer.");
            }

            List<String> audiences = claims.getAudience();
            if (audiences.size() != 1) {
                result.addError("Audience not found in the token.");
            }

            if (!targetUrl.equalsIgnoreCase(audiences.get(0))) {
                result.addError("Invalid token audience.");
            }

            if (!O365_APP_ID.equalsIgnoreCase(claims.getStringClaim("appid"))) {
                result.addError("Invalid token appid.");
            }

            result.setSender(claims.getStringClaim("sender"));
            result.setActionPerformer(claims.getSubject());
            result.setTenantIdentifier(claims.getStringClaim("tid"));
        } catch (ParseException e) {
            result.setException(e);
        }
    }

    /*
     * Performs additional semantic validation on the JWT token by checking organization ID and sender.
     */
    private void verifyOrganizationAndSender(ActionableMessageTokenValidationResult result, String orgId, String sender) {
        // We want to make sure the organization is yours
        if (!orgId.equalsIgnoreCase(result.getTenantIdentifier())) {
            result.addError("Invalid organization information.");
        }

        // Check the mail was sent from the right mail address
        if (!result.getSender().equalsIgnoreCase(sender)) {
            result.addError("Invalid sender.");
        }
    }
}