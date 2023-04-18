package io.mahesh.api.exception;

import java.util.List;
import java.util.stream.Collectors;

import javax.naming.AuthenticationException;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import io.mahesh.api.response.ErrorResponse;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(FieldValidationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorResponse handleFieldValidationException(FieldValidationException ex) {
    return new ErrorResponse("Field validation failed", HttpStatus.BAD_REQUEST.value(), ex.getMessage());
}

    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ErrorResponse handleResourceNotFoundException(ResourceNotFoundException ex) {
        return new ErrorResponse("Resource not found", HttpStatus.NOT_FOUND.value(), ex.getMessage());
    }

    @ExceptionHandler(DataAccessException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResponse handleDatabaseException(DataAccessException ex) {
        return new ErrorResponse("Database error", HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.getMessage());
    }

    @ExceptionHandler(DuplicateKeyException.class) 
    @ResponseStatus(HttpStatus.CONFLICT) 
    public ErrorResponse handleDuplicateKeyException(DuplicateKeyException ex) {
        return new ErrorResponse("Duplicate key", HttpStatus.CONFLICT.value(), ex.getMessage());
    }

    @ExceptionHandler(AuthenticationException.class) 
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ErrorResponse handleAuthentionException(AuthenticationException ex) {
        return new ErrorResponse("Unauthorized", HttpStatus.UNAUTHORIZED.value(), ex.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorResponse handleValidationException(MethodArgumentNotValidException ex) {
        List<String> errors = ex.getBindingResult()
                                .getFieldErrors()
                                .stream()
                                .map(error -> error.getField() + " " + error.getDefaultMessage())
                                .collect(Collectors.toList());
        return new ErrorResponse("Validation failed", HttpStatus.BAD_REQUEST.value(), errors);
    }

    @ExceptionHandler(MissingPathVariableException.class)
    public ErrorResponse handleMissingPathVariableException(MissingPathVariableException ex) {
        String errorMessage = String.format("Missing path variable: %s", ex.getMessage());
        return new ErrorResponse(errorMessage, HttpStatus.BAD_REQUEST.value(), ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResponse handleException(Exception ex) {
        return new ErrorResponse("Internal Server errror", HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.getMessage());
    }
}