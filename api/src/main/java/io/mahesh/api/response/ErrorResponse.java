package io.mahesh.api.response;

import java.util.List;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ErrorResponse {
    private final String status; 
    private final int code; 
    private String message; 
    private List<String> errors; 

    public ErrorResponse(String status, String message) {
        this(status, 0, message, null);
    }

    public ErrorResponse(String status, List<String> errors) {
        this(status, HttpStatus.BAD_REQUEST.value(), "Validation failed", errors);
    }

    public ErrorResponse(String status, int code, String message) {
        this.status = status;
        this.code = code; 
        this.message = message;
    }

    public ErrorResponse(String status, int code, List<String> errors) {
        this.status = status;
        this.code = code;
        this.errors = errors;
    }
}
