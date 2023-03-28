package io.mahesh.api.model;

//import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;
import lombok.NonNull;

@Data
@Document("Tasks")
public class Tasks {
    @Id
    private String _id;

    @NonNull
    private String toDo;

    @NonNull
    private String dateCompleted;

    private boolean status;

    public boolean getStatus() {
        return this.status;
    }
}
