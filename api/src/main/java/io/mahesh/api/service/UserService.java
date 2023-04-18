package io.mahesh.api.service;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.naming.AuthenticationException;
import io.micrometer.common.util.StringUtils;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.exception.DataAccessException;
import io.mahesh.api.exception.DuplicateKeyException;
import io.mahesh.api.exception.FieldValidationException;
import io.mahesh.api.exception.ResourceNotFoundException;
import io.mahesh.api.model.Users;

/*
 * Service: User Operations
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public Users getUser(Users user) throws AuthenticationException { 
        //TODO move to credentials model - when make spring security
        String username = user.getUserName();
        String password = user.getPassword();
        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            // TODO: Log that field exception
            throw new FieldValidationException(username, "Username and password required");
        }
        try {
            Optional<UserEntity> uEntity = userRepository.findByUsernameAndPassword(username,password);
            if (!uEntity.isPresent()) {
                // TODO: Log login failed
                throw new AuthenticationException("Failed to login user");
            }
            return new Users(uEntity.get());
        } catch (DataAccessException ex) {
            // TODO: Log the exception
        }
        return null;
    }

    public Users registerUser(Users user) {    
        try {
            Optional<UserEntity> existingUser  = userRepository.findTopByUsername(user.getUserName());
            if (existingUser.isPresent()) {
                // TODO log that user already exists
                throw new DuplicateKeyException("Username already exists: " + user.getUserName());
            }
            UserEntity uEntity = new UserEntity(user);
            uEntity = userRepository.save(uEntity);
            return new Users(uEntity);
        } catch (DataAccessException e) {
            // TODO: Log the exception
            return null;
        }
    }

    public Users findUserById(String id) {
        if(StringUtils.isBlank(id)) {
            // TODO: Log that field exception
            throw new FieldValidationException(id, "Id is required");
        }
        try {
            Optional<UserEntity> uEntity = userRepository.findById(id);
            if (!uEntity.isPresent()) {
                //TODO: Log the user not found
                throw new ResourceNotFoundException("User not found with id " + id);
            }
            return new Users(uEntity.get());
        } catch (DataAccessException e) {
            // TODO: Log the exception
        }
        return null;
    }
}
