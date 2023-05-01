package io.mahesh.api.data.entity;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
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
    private String id;

    @DBRef
    private JourneyPathEntity journey;

    @NonNull
    private String name;

    private boolean status;

    @NonNull
    @DBRef
    private UserEntity user;

    /**
     * Converts Task Model ==> TasksEntity
     */
    public TasksEntity(Tasks task) {
        this.id = task.getId();
        this.name = task.getName();
        this.journey = new JourneyPathEntity(task.getJourneyId());
        this.status = task.isStatus();
        this.user = new UserEntity(task.getUserId());
    }
}
