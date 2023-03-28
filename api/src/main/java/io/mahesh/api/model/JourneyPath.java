package io.mahesh.api.model;

import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document("JourneyPath")
public class JourneyPath {
    private String journeyName;
    private Tasks tasks;

    public JourneyPath(String journeyName, Tasks tasks) {
        this.journeyName = journeyName;
        this.tasks = tasks;
    }
}
