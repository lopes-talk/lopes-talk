package io.mahesh.api.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;
import io.mahesh.api.service.JourneyPathService;
import io.mahesh.api.service.TaskService;
import io.mahesh.api.service.UserService;

@RestController
@RequestMapping("api")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private JourneyPathService journeyService;
    @Autowired
    private TaskService taskService;

    @PostMapping("/login")
    private ResponseEntity<Object> loginUser(@RequestBody Users user) {
        Users uModel = userService.getUser(user);
        if (uModel != null) {
            return ResponseEntity.ok(uModel);
        }
        String message = "Login failed for user " + user.getUserName();
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(message);
    }

    @PostMapping("/register")
    private ResponseEntity<Object> registerUser(@RequestBody Users user) {
        boolean userExits = userService.findUserByUsername(user.getUserName());
        if(userExits) {
            // Log Statement for user already exists
            return ResponseEntity.ok("Accout already exists with username");
        }
        Users uModel = userService.registerUser(user);
        autoGeneratePaths(uModel);
        return ResponseEntity.ok(uModel);
    }

    @GetMapping("/user/{id}")
    private ResponseEntity<Object> getUserById(@PathVariable("id") String id) {
        Users uModel = userService.findUserById(id);
        if (uModel != null) {
            return ResponseEntity.ok(uModel);
        }
        String message = "User with ID " + id + " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }

    /**
     * Helper Method to autogenerate the journeys and tasks for a user
     * @param user
     */
    public void autoGeneratePaths(Users user) {
        ArrayList<String> setJourneyPaths = new ArrayList<String>() {{
            add("Physical");
            add("Emotional");
            add("Practical");
            add("Mental");
            add("Social");
        }};
        for (String journeyString : setJourneyPaths ) {
            // Create a journey for user
            String jName = journeyString;
            boolean isActive = false;
            String userId = user.getId();
            JourneyPath jModel = new JourneyPath(jName, isActive, userId);

            jModel = journeyService.createJourneyPath(jModel);

            // Create the 4 tasks for each journey 
            for (int t = 0; t < 6; t++) {
                //Create tasks for users that belong to the created journey
                String tName = "Task " + t;
                boolean status = false;
                Tasks tModel = new Tasks(tName, status, userId, jModel.getId());
                taskService.createTask(tModel);
            }
        }
    }
}