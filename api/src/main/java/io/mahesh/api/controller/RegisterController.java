package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.model.UserModel;

@RestController
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    //private SecurityService security;

    @PostMapping("/")
    public UserModel Register(@RequestBody UserModel user) {
        /**ERROR: userRepository cannot be resolvedJava(570425394) */
        //return userRepository.save(user);
        return null;
    }
}