package io.mahesh.api.data.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import io.mahesh.api.model.JourneyPath;

public interface JourneyPathRepository extends MongoRepository<JourneyPath, String> {
    
}
