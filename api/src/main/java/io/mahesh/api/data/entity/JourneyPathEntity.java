package io.mahesh.api.data.entity;

import java.sql.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import com.mongodb.lang.NonNull;

import io.mahesh.api.model.JourneyPath;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Journey Path Entity: Represent the Journey_Path table in the database
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("Journey_Path")
public class JourneyPathEntity {
    @Id
    private String _id;

    @NonNull
    private String task;

    @NonNull
    private Date dateCompleted;

    @NonNull
    private boolean status;

    @NonNull
    @Field(name = "userName")
    private String userName;

    /*
     * Converts JourneyPath Model ==> JourneyPathEntity
     */
    public JourneyPathEntity(JourneyPath user) {
        this._id = user.get_id();
        this.task = user.getTask();
        this.dateCompleted = user.getDateCompleted();
        this.status = user.isStatus();
        this.userName = user.getUserName();
    }
}
