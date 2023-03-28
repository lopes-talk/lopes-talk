package io.mahesh.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.UsersDataService;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.model.Users;
import io.mahesh.api.util.DatabaseException;
import io.mahesh.api.util.UnknownUserException;

/*
 * Service: User Operations
 */
@Service
public class UserService {
    @Autowired
    UsersDataService usersDataService;

    /**
     * Register a User
     * @return 
     */
    public Users registerUser(Users user) {
        try {
            System.out.println(String.format("Encoded password %s : %s", user.getPassword(),
                    new BCryptPasswordEncoder().encode(user.getPassword())));
            // encrypt password
            user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
            usersDataService.create(new UserEntity(user));
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database exception");
        }
        return user;
    }

    /**
     * Get a user by their ID
     * @return Users Model for the requested user
     */
    public Users findUser(String id) throws UnknownUserException {
        try {
            // Get user from database
            UserEntity user = usersDataService.findById(id);
            // Ensure user exists
            if(user == null) throw new UnknownUserException();
            return new Users(user);
        } catch (UnknownUserException e) {
            throw e;
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database exception");
        }
    }
}
