package io.mahesh.api.model;

import org.springframework.data.mongodb.core.mapping.Document;

import io.mahesh.api.data.entity.HistoryEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("History")
public class History {
    private String _id;

    private String name;

    private String taskId;

    /**
     * Id-only contructor
     * 
     * @param _id History ID
     */
    public History(String _id) {
        this._id = _id;
    }

    /**
     * Converts HistoryEntity obj ==> History Model obj
     */
    public History(HistoryEntity history) {
        this._id = history.get_id();
        this.name = history.getName();
        this.taskId = history.getTaskId();
    }
}
