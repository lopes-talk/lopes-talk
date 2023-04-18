package io.mahesh.api.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReponseObject<T> {
    private final String status;
    private final int code; 
    private String message;
    private T data;

}