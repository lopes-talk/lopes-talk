package io.mahesh.api.model;

import io.mahesh.api.data.entity.JourneyPathEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JourneyPath {
    private String id;

    @NonNull
    private String name;

    private boolean isActive;

    @NonNull
    private String userId;

    /**
     * Id-only contructor
     * 
     * @param id JourneyPath ID
     */
    public JourneyPath(String id) {
        this.id = id;
    }

    /*
     * Converts JourneyPathEntity obj ==> JourneyPath Model obj
     */
    public JourneyPath(JourneyPathEntity journeyEntity) {
        this.id = journeyEntity.getId();
        this.name = journeyEntity.getName();
        this.isActive = journeyEntity.isActive();
        this.userId = journeyEntity.getUser().getId();
    }

    public JourneyPath(String name, boolean isActive, String userId) {
        this.name = name;
        this.isActive = isActive;
        this.userId = userId;
    }
}
