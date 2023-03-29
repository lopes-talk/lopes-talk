package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.service.UserService;

@RestController
@RequestMapping("/user/api")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    private UserEntity getCurrentUser(@RequestBody UserEntity user) {
        System.out.println("GET User by userName and password *****");
        return userService.getUser(user);
    }

    @GetMapping("/login/{userName}&{password}")
    private boolean findUserByUsername(@PathVariable String userName, @PathVariable String password) {
        System.out.println("GET User by userName and password *****");
        return userService.getUserByUsername(userName, password);
    }

    @PostMapping("/registerUser")
    private boolean registerUser(@RequestBody UserEntity user) {
        System.out.println("In UserController of registerUser");
        boolean user_exits = userService.findUserByUsername(user.getUserName());
        if(user_exits) {
            System.out.println("CANT CREATE USER!");
            return false;
        }
        System.out.println("\tCalling userService.saveUser()");
        userService.registerUser(user);
        return true;
    }
}