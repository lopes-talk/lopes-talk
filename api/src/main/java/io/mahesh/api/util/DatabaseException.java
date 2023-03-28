package io.mahesh.api.util;

/*
 * Custom Database Exception
 */
public class DatabaseException extends RuntimeException {
    public DatabaseException() {
        super();
    }

    /**
     * Non-default constructor
     * @param e Wrapped exception
     * @param message Custom exception message
     */
    public DatabaseException(Throwable e, String message) {
        super(message, e);
    }
}
