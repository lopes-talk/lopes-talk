package io.mahesh.api.data.entity;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import io.mahesh.api.model.Tasks;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * User Entity: Represent the User table in the database
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("Task")
public class TasksEntity {
    @Id
    private String id;

    @NonNull
    private String pathId;

    @NonNull
    private String name;

    private boolean status;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date dateCompleted;

    @NonNull
    @DBRef
    private UserEntity user;

    /**
     * Converts Task Model ==> TasksEntity
     */
    public TasksEntity(Tasks task) {
        this.id = task.getId();
        this.pathId = task.getPathId();
        this.status = task.isStatus();
        this.dateCompleted = task.getDateCompleted();
    }
}
