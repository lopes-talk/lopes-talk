package io.mahesh.api.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.UserEntity;

/*
 * Interface: JourneyPathRepository 
 */
@Repository
public interface JourneyPathRepository extends MongoRepository<JourneyPathEntity, String> {

    List<JourneyPathEntity> findByUser(UserEntity user);
}