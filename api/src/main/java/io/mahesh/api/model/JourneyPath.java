package io.mahesh.api.model;

import java.sql.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import io.mahesh.api.data.entity.JourneyPathEntity;
import lombok.Data;
import lombok.NonNull;

@Data
@Document("Journey_Path")
public class JourneyPath {
    @Id
    private String _id;

    @NonNull
    private String task;

    @NonNull
    private Date dateCompleted;

    private boolean status;

    @NonNull
    private String userName;

    /**
     * Id-only contructor
     * 
     * @param _id JourneyPath ID
     */
    public JourneyPath(String _id) {
        this._id = _id;
    }

    /*
     * Converts JourneyPathEntity obj ==> JourneyPath Model obj
     */
    public JourneyPath(JourneyPathEntity user) {
        this._id = user.get_id();
        this.task = user.getTask();
        this.dateCompleted = user.getDateCompleted();
        this.status = user.isStatus();
        this.userName = user.getUserName();
    }
}
