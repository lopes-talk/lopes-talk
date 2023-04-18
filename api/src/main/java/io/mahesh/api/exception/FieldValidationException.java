package io.mahesh.api.exception;


public class FieldValidationException extends RuntimeException {
    private String field;
    private String message; 

    public FieldValidationException(String field, String message) {
        super(message);
        this.field = field;
        this.message = message;
    }

    public String getField() {
        return field;
    }

    public String getMessage() {
        return message;
    }
}