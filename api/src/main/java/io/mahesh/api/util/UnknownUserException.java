package io.mahesh.api.util;

/*
 * Custom UnknownUser Exception
 */
public class UnknownUserException extends Exception {
    public UnknownUserException() {
        super();
    }

    /**
     * Non-default constructor
     * @param e Wrapped exception
     * @param message Custom exception message
     */
    public UnknownUserException(Throwable e, String message) {
        super(message, e);
    }
}