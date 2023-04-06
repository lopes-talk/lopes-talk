package io.mahesh.api.data.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.mongodb.lang.NonNull;

import io.mahesh.api.model.History;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * History Entity: Represent the History table in the database
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("History")
public class HistoryEntity {
    @Id
    private String _id;

    @NonNull
    private String name;

    @NonNull
    private String taskId;

    /*
     * Converts History Model ==> HistoryEntity
     */
    public HistoryEntity(History history) {
        this._id = history.get_id();
        this.name = history.getName();
        this.taskId = history.getTaskId();
    }
}
