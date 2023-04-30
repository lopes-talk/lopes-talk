package io.mahesh.api.data.repository; 

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.HistoryEntity;
import io.mahesh.api.data.entity.UserEntity;

@Repository
public interface HistoryRepository extends MongoRepository<HistoryEntity, String> {
    List<HistoryEntity> findByUser(UserEntity user);
}