package io.mahesh.api.data.entity;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

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
    private String _id;

    @NonNull
    private String pathId;

    private boolean status;

    @NonNull
    private Date dateCompleted;

    @NonNull
    private String userId;

    /**
     * Converts Task Model ==> TasksEntity
     */
    public TasksEntity(Tasks task) {
        this._id = task.get_id();
        this.pathId = task.getPathId();
        this.status = task.isStatus();
        this.dateCompleted = task.getDateCompleted();
        this.userId = task.getUserId();
    }
}
