package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.validation.Valid;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.model.Users;
import io.mahesh.api.service.SecurityService;
import io.mahesh.api.service.UserService;
import io.mahesh.api.util.DatabaseException;

@RestController
public class UserController {
    // @Autowired
    // private SecurityService security;
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/add")
    public UserEntity addUser(
            @Valid @RequestBody UserEntity userEntity) {
        return userRepository.save(userEntity);
    }

    // Register a new user
    @PostMapping("/register")
    public ResponseEntity<Users> register(@RequestBody Users user) {
        System.out.println("In Register");
        try {
            System.out.println("\tsuccess with user info of " + user);
            userService.registerUser(user);
            return ResponseEntity.ok().build();
        } catch (DatabaseException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // Login user
    @GetMapping("/login/success")
    public ResponseEntity<Users> login(@RequestParam String id) {
        System.out.println("In login success controller");
        try {
            Users user = userService.findUser(id);
            if (user != null) {
                // Successful login
                return ResponseEntity.ok(user);
            } else {
                // Invalid credentials
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
// @PostMapping("/register")
// public Users Register(@RequestBody Users user) {
// System.out.println("success with user info of " + user);
// return userRepository.save(user);
// }

// @GetMapping("/login")
// public Users Login(@RequestBody Users user) {
// Users returningUser =
// userRepository.validateWithUserNameAndPassword(user.getUserName(),
// user.getPassword());
// // if (returningUser == null) {
// // System.out.println("frick");
// // return null;
// // }
// System.out.println("success with user: " + user.getUserName());
// return returningUser;
// }
