package io.mahesh.api.model;

import java.util.Date;

import io.mahesh.api.data.entity.TasksEntity;
import lombok.Data;
import lombok.NonNull;

@Data
public class Tasks {
    @NonNull
    private String id;

    @NonNull
    private String name;

    private boolean status;

    private Date dateCompleted;

    @NonNull
    private String userId;
    
    @NonNull
    private String pathId;

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
        this.dateCompleted = task.getDateCompleted();
        this.pathId = task.getPathId();
        this.userId = task.getUser().getId();
    }
}
