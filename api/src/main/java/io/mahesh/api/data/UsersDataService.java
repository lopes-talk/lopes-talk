package io.mahesh.api.data;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.util.DatabaseException;

@Service
public class UsersDataService implements DataAccessInterface<UserEntity> {
    @Autowired
    private UserRepository usersRepository;

    /*
     * Constructor: Insert dataSource
     */
    public UsersDataService(UserRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    /*
     * Gets all Users
     */
    @Override
    public List<UserEntity> findAll() {
        List<UserEntity> users = new ArrayList<UserEntity>();
        try {
            // Get all entity users
            Iterable<UserEntity> usersIterable = usersRepository.findAll();

            // Convert to a list then return that list
            users = new ArrayList<UserEntity>();
            usersIterable.forEach(users::add);
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database Exeption");
        }
        return users;
    }

    /*
     * Gets a user by their ID
     */
    public UserEntity findById(String id) {
        UserEntity user = null;
        try {
            //  Get user by ID
            Optional<UserEntity> optionalUser = usersRepository.findById(id);
            if (optionalUser.isPresent()) {
                user = optionalUser.get();
            }
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database Exception");
        }
        return user;
    }

    /*
     * Gets a user from by their username
     */
    public UserEntity findByUsername(String username) {
        UserEntity user = null;
        try {
            // Get the user by username
            user = usersRepository.findByUsername(username);
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database Exeption");
        }
        return user;
    }

    /*
     * CREATE: new user
     */
    @Override
    public void create(UserEntity userEntity) {
        try {
            usersRepository.insert(userEntity);
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            throw new DatabaseException(e, "Database Exception");
        }
    }

    /*
     * DELETE a user - currently unsupported
     */
    @Override
    public void delete(UserEntity user) {
        throw new UnsupportedOperationException("This method is not yet supported");
    }

    /**
     * UPDATE a user - currently unsupported
     */
    @Override
    public void update(UserEntity user) {
        throw new UnsupportedOperationException("This method is not yet supported");
    }
}
