package io.mahesh.api.data.entity;

import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import io.mahesh.api.model.History;
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
@Document("History")
public class HistoryEntity {
    @Id
    private String id;

    @NonNull
    private String name;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime dateCompleted;

    @NonNull
    @DBRef
    private UserEntity user;

    /**
     * Converts History Model ==> TasksEntity
     */
    public HistoryEntity(History history) {
        this.id = history.getId();
        this.name = history.getName();
        this.dateCompleted = history.getDateCompleted();
        this.user = new UserEntity(history.getUserId());
    }

    public HistoryEntity(String name, UserEntity user) {
        this.name = name;
        this.user = user;
    }
}