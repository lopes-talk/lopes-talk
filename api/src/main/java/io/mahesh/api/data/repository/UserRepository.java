package io.mahesh.api.data.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import io.mahesh.api.data.entity.UserEntity;

/*
 * Interface: UserRepository 
 */
@Repository
public interface UserRepository extends MongoRepository<UserEntity, String> {
    @Query("{userName:'?0', password:'?1'}")  
    Optional<UserEntity> findByUsernameAndPassword(String userName, String password);

    @Query("{userName:'?0'}")  
    Optional<UserEntity> findTopByUsername(String userName);

    @Query("{password:'?0'}")  
    Optional<UserEntity> findTopByPassword(String password);

    Optional<UserEntity> findById(String id);
}