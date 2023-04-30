package io.mahesh.api.model;

import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import io.mahesh.api.data.entity.HistoryEntity;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class History {
    private String id;

    @NotNull
    @NotBlank
    private String name;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime dateCompleted;

    @NotBlank
    @NotNull
    private String userId;
    

    /**
     * Id-only contructor
     * 
     * @param _id History ID
     */
    public History(String id) {
        this.id = id;
    }

    /*
     * Converts TaskEntity obj ==> Task Model obj
     */
    public History(HistoryEntity history) {
        this.id = history.getId();
        this.name = history.getName();
        this.dateCompleted = history.getDateCompleted();
        this.userId = history.getUser().getId();
    }

	public History(String name, String userId, LocalDateTime dateCompleted) {
        this.name = name;
        this.userId = userId;
        this.dateCompleted = dateCompleted;
	}
}
