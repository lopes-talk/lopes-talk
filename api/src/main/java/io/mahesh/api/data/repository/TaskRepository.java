package io.mahesh.api.data.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.TasksEntity;

@Repository
public interface TaskRepository extends MongoRepository<TasksEntity, String> {
    TasksEntity insert(TasksEntity task);

    Optional<TasksEntity> findById(String _id);
}
