package io.mahesh.api.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.TasksEntity;
import io.mahesh.api.data.entity.UserEntity;

@Repository
public interface TaskRepository extends MongoRepository<TasksEntity, String> {
    List<TasksEntity> findByUser(UserEntity user);
    List<TasksEntity> findByJourney(JourneyPathEntity journey);
}



