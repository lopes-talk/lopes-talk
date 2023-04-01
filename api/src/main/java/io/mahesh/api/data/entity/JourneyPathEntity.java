package io.mahesh.api.data.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

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
    private String name;

    @NonNull
    private String taskId;

    /*
     * Converts JourneyPath Model ==> JourneyPathEntity
     */
    public JourneyPathEntity(JourneyPath user) {
        this._id = user.get_id();
        this.name = user.getName();
        this.taskId = user.getTaskId();
    }
}
