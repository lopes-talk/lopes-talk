package io.mahesh.api.data.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import io.mahesh.api.model.Users;

public interface UserRepository extends MongoRepository<Users, String> {
    @Query("{userName:'?0', password:'?1'}")  
    Users validateWithUserNameAndPassword(String userName, String password);
    
    @Query("{firstName:'?0'}")
    Users findUserByFirstName(String firstName);
}
