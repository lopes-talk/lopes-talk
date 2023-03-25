package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.model.Users;


@RestController
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @PostMapping("/register")
    public Users Register(@RequestBody Users user) {
        System.out.println("success with user info of " + user);
        return userRepository.save(user);
    }

    @GetMapping("/login")
    public Users Login(@RequestBody Users user) {
        Users returningUser = userRepository.validateWithUserNameAndPassword(user.getUserName(), user.getPassword());
        // if (returningUser == null) {
        //     System.out.println("fuck");
        //     return null;
        // }
        System.out.println("success with user: " + user.getUserName());
        return returningUser;
    }
}
