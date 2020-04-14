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

import java.util.ArrayList;
import java.util.List;

/**
 * Result from token validation.
 *
 * Original source at: https://github.com/OfficeDev/outlook-actionable-messages-java-token-validation
 */
public class ActionableMessageTokenValidationResult {

    private String sender;
    private String actionPerformer;
    private String tenantIdentifier;
    private Exception exception;
    private List<String> errors;

    public ActionableMessageTokenValidationResult() {
        sender = "";
        actionPerformer = "";
        tenantIdentifier = "";
        exception = null;
        errors = new ArrayList<String>();
    }

    /**
     * Gets the flag that indicates if the validation succeeded.
     *
     * @return Boolean true if the validation succeeded; else false.
     */
    public Boolean getValidationSucceeded() {
        return errors.isEmpty() && exception == null;
    }

    /**
     * Gets the email address of the sender of the actionable message.
     *
     * @return String The email address of the sender of the actionable message.
     */
    public String getSender() {
        return sender;
    }

    /**
     * Sets the value of the sender.
     *
     * @param value The value of the sender.
     */
    public void setSender(String value) {
        sender = value;
    }

    /**
     * Gets the email address of the person who performed the action. In some cases,
     * it will be a GUID if the receiver email address is a distribution list.
     *
     * @return String The value of the action performer.
     */
    public String getActionPerformer() {
        return actionPerformer;
    }

    /**
     * Sets the value of the action performer.
     *
     * @param value The value of the action performer.
     */
    public void setActionPerformer(String value) {
        actionPerformer = value;
    }

    public String getTenantIdentifier() {
        return tenantIdentifier;
    }

    public void setTenantIdentifier(String value) {
        tenantIdentifier = value;
    }

    /**
     * Adds an error to the list of validation errors.
     *
     * @param error The error to add
     */
    public void addError(String error) {
        errors.add(error);
    }

    /**
     * Retrieves a list of errors that occurred during validation.
     *
     * @return The list of errors
     */
    public List<String> getErrors() {
        return errors;
    }

    /**
     * Returns the exception that occurred during validation (if any).
     */
    public Exception getException() {
        return exception;
    }

    /**
     * Sets the exception object.
     */
    public void setException(Exception value) {
        exception = value;
    }
}