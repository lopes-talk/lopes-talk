package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.UserRepository;
import io.mahesh.api.model.UserModel;
import io.mahesh.api.service.SecurityService;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserRepository userRepository;
    //not utilzed yet: private SecurityService security;

    @PostMapping("/")
    public UserModel Login(@RequestBody UserModel user) {
        //ERROR: The method UserName() is undefined for the type UserModelJava(67108964)
        //UserModel oldUser = userRepository.findByEmailAndPassword(user.UserName(), user.Password);
        // line 23 error— cannot: return oldUser;
        return null;
    }
}
