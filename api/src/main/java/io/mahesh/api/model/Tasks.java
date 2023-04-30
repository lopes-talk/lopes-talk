package io.mahesh.api.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import io.mahesh.api.data.entity.TasksEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tasks {
    private String id;

    @NotNull
    @NotBlank
    private String name;

    private boolean status;

    @NotBlank
    @NotNull
    private String userId;
    
    @NotBlank
    @NotNull
    private String journeyId;

    /**
     * Id-only contructor
     * 
     * @param _id Task ID
     */
    public Tasks(String id) {
        this.id = id;
    }

    /*
     * Converts TaskEntity obj ==> Task Model obj
     */
    public Tasks(TasksEntity task) {
        this.id = task.getId();
        this.name = task.getName();
        this.status = task.isStatus();
        if(task.getJourney() != null) {
            this.journeyId = task.getJourney().getId();
        }
        this.userId = task.getUser().getId();
    }

	public Tasks(String name, boolean status, String userId, String journeyId) {
        this.name = name;
        this.status = status;
        this.userId = userId;
        this.journeyId = journeyId;
	}
}
