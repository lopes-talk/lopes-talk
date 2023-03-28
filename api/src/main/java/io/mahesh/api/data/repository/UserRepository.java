package io.mahesh.api.data.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import io.mahesh.api.data.entity.UserEntity;

/*
 * Interface: UserRepository 
 */
public interface UserRepository extends MongoRepository<UserEntity, String> {
    @Query("{userName:'?0'}")  
    public UserEntity findByUsername(String username);
}
