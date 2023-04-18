package io.mahesh.api.data.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
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
    private String id;

    @NonNull
    private String name;

    @NonNull 
    private boolean isActive;

    @DBRef
    private UserEntity user;

    /**
     * Id-only contructor
     * 
     * @param id JourneyPath ID
     */
    public JourneyPathEntity(String id) {
        this.id = id;
    }

    /*
     * Converts JourneyPath Model ==> JourneyPathEntity
     */
    public JourneyPathEntity(JourneyPath journey) {
        this.id = journey.getId();
        this.name = journey.getName();
        this.isActive = journey.isActive();
        this.user = new UserEntity(journey.getUserId());
    }
}
