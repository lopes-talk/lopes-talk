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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * Service: User Operations
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathService.class);

    public Users getUser(Users user) throws AuthenticationException { 
        String username = user.getUserName();
        String password = user.getPassword();
        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            throw new FieldValidationException(username, "Username and password required");
        }
        try {
            Optional<UserEntity> uEntity = userRepository.findByUsernameAndPassword(username,password);
            if (!uEntity.isPresent()) {
                throw new AuthenticationException("Failed to login user");
            }
            return new Users(uEntity.get());
        } catch (DataAccessException e) {
            logger.error("getUser database error: {}", e.getMessage());
        }
        return null;
    }

    public Users registerUser(Users user) {    
        try {
            Optional<UserEntity> existingUser  = userRepository.findTopByUsername(user.getUserName());
            if (existingUser.isPresent()) {
                throw new DuplicateKeyException("Username already exists: " + user.getUserName());
            }
            UserEntity uEntity = new UserEntity(user);
            uEntity = userRepository.save(uEntity);
            return new Users(uEntity);
        } catch (DataAccessException e) {
            logger.error("registerUser database error: {}", e.getMessage());
            return null;
        }
    }

    public Users findUserById(String id) {
        if(StringUtils.isBlank(id)) {
            throw new FieldValidationException(id, "Id is required");
        }
        try {
            Optional<UserEntity> uEntity = userRepository.findById(id);
            if (!uEntity.isPresent()) {
                logger.warn("findUserById - User not found with id " + id);
                throw new ResourceNotFoundException("User not found with id " + id);
            }
            return new Users(uEntity.get());
        } catch (DataAccessException e) {
            logger.error("findUserById database error: {}", e.getMessage());
        }
        return null;
    }
}
