package io.mahesh.api.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.MongoException;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.UserRepository;

import io.mahesh.api.model.Users;

/*
 * Service: User Operations
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public Users getUser(Users user) { //TODO
        String username = user.getUserName();
        String password = user.getPassword();
        try {
            Optional<UserEntity> uEntity = userRepository.findByUsernameAndPassword(username,password);
            if (uEntity.isPresent()) {
                return new Users(uEntity.get());
            }
        } catch (MongoException e) {
            // Log Statement
        }
        return null;
    }

    public boolean findUserByUsername(String userName) { 
        boolean usernamePresent;
        try {
            usernamePresent = userRepository.findTopByUsername(userName) != null ? true : false;
        } catch(MongoException e) {
            //Log Statement
            return true;
        }
        return usernamePresent;
    }

    public Users registerUser(Users user) {
        try {
            UserEntity uEntity = new UserEntity(user);
            uEntity = userRepository.save(uEntity);
            return new Users(uEntity);
        } catch (MongoException e) {
            // Log Statement
            return null;
        }
    }

    public Users findUserById(String id) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(id);
            if (uEntity.isPresent()) {
                return new Users(uEntity.get());
            }
        } catch (MongoException e) {
            // Log Statement
        }
        return null;
    }
}
