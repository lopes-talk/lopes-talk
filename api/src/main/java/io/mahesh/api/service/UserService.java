package io.mahesh.api.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.MongoException;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.UserRepository;

/*
 * Service: User Operations
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public UserEntity getUser(UserEntity user) {
        System.out.println("Service GET *****");
        return userRepository.findByUsernameAndPassword(user.getUserName(), user.getPassword());
    }
    
    public boolean getUserByUsername(String userName, String password) {
        boolean username_present;
        boolean password_present;
        try {
            username_present = userRepository.findTopByUsername(userName) != null ? true : false;
            System.out.println("Username present: " + username_present);
            password_present = userRepository.findTopByPassword(password) != null ? true : false;
            System.out.println("Password present: " + password_present);
        } catch(MongoException nre) {
            return true;
        }
        return username_present && password_present;
    }

    public boolean findUserByUsername(String userName) {
        boolean username_present;
        try {
            username_present = userRepository.findTopByUsername(userName) != null ? true : false;
            System.out.println("userName present (U): " + username_present);
        } catch(MongoException nre) {
            return true;
        }
        return username_present;
    }

    public void registerUser(UserEntity user) {
        System.out.println("\tIn UserService of saveUser");
        System.out.println("\t\tCalling userRepository.save()");
        userRepository.save(user);
        System.out.println(user);
    }

    public Optional<UserEntity> findUserById(String _id) {
        System.out.println("User Service finding user with id: " + _id);
        try {
            return userRepository.findById(_id);
        } catch (MongoException e) {
            System.out.println("Error finding user");
            return null;
        }
    }
}
