package io.mahesh.api.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import io.mahesh.api.data.entity.TasksEntity;
import lombok.Data;
import lombok.NonNull;

@Data
@Document("Task")
public class Tasks {
    @Id
    private String _id;

    private String pathId;

    private boolean status;

    @NonNull
    private Date dateCompleted;

    @NonNull
    private String userId;

    /**
     * Id-only contructor
     * 
     * @param _id Task ID
     */
    public Tasks(String _id) {
        this._id = _id;
    }

    /*
     * Converts TaskEntity obj ==> Task Model obj
     */
    public Tasks(TasksEntity task) {
        this._id = task.get_id();
        this.pathId = task.getPathId();
        this.status = task.isStatus();
        this.dateCompleted = task.getDateCompleted();
        this.userId = task.getUserId();
    }
}
