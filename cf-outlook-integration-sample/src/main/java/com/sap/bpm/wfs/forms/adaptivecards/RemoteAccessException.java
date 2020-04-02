package com.sap.bpm.wfs.forms.adaptivecards;

/**
 * Common runtime exception used for issues when accessing remote endpoints.
 */
public class RemoteAccessException extends RuntimeException {

    private static final long serialVersionUID = -2753919087169368903L;

    public RemoteAccessException() {
    }

    public RemoteAccessException(String message) {
        super(message);
    }

    public RemoteAccessException(Throwable cause) {
        super(cause);
    }

    public RemoteAccessException(String message, Throwable cause) {
        super(message, cause);
    }

    public RemoteAccessException(String message, Throwable cause, boolean enableSuppression,
            boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
