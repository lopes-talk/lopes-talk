package io.mahesh.api.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.JourneyPathEntity;

/*
 * Interface: JourneyPathRepository 
 */
@Repository
public interface JourneyPathRepository extends MongoRepository<JourneyPathEntity, String> {
    @Query("{task:'?0'}")
    JourneyPathEntity findByTask(String task);

    @Query(value= "{username:'?0'}") 
    List<JourneyPathEntity> findAllByUsername(String username);
}