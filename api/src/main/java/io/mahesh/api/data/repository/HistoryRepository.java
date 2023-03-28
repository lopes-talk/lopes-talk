package io.mahesh.api.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import io.mahesh.api.model.History;

public interface HistoryRepository extends MongoRepository<History, String> {
    @Query("{id:'?0'}")  
    List<History> findByUserId(String id);
}
