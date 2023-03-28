package io.mahesh.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.UsersDataService;
import io.mahesh.api.model.Users;

@Service
public class SecurityService {
    @Autowired
    private UsersDataService usersDataService;

    /**
     * Get Spring Security authenticated user as a Users Model
     * 
     * @return Users Model of current authenticated user
     */
    public Users getAuthenticatedUser() {
        // leverage SecurityContextHolder to get the currently authenticated user
        return new Users(
                usersDataService
                        .findByUsername(
                                SecurityContextHolder
                                        .getContext()
                                        .getAuthentication()
                                        .getName()));
    }
}
