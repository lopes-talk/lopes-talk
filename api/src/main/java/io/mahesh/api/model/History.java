package io.mahesh.api.model;

import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document("History")
public class History {
    private Tasks[] completedTasks;

    public History(Tasks[] completedTasks) {
        this.completedTasks = completedTasks;
    }
}
