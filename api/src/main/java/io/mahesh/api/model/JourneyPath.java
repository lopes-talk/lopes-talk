package io.mahesh.api.model;

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
    private String name;

    @NonNull
    private String taskId;

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
        this.name = user.getName();
        this.taskId = user.getTaskId();
    }
}
