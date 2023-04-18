package io.mahesh.api.controller;

import java.util.ArrayList;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.service.JourneyPathService;
import io.mahesh.api.response.ReponseObject;
import io.mahesh.api.service.TaskService;
import io.mahesh.api.service.UserService;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;

import jakarta.validation.Valid;

@RestController
@RequestMapping("api")
@CrossOrigin(origins = {"http://localhost:8080", "https://your-api-domain.com"})
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private JourneyPathService journeyService;
    @Autowired
    private TaskService taskService;

    // TODO  - Separate into credentials mdoel
    @PostMapping("/login")
    private ResponseEntity<ReponseObject<Object>> loginUser(@RequestBody Users user) throws AuthenticationException {
        Users uModel;
        uModel = userService.getUser(user);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "User logged in successfully", uModel));   
     }

    // TODO  - Separate into credentials mdoel
    @PostMapping("/register")
    private ResponseEntity<ReponseObject<Object>> registerUser(@Valid @RequestBody Users user) {
        Users uModel = userService.registerUser(user);
        autoGeneratePaths(uModel);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "User registered successfully", uModel));   

    }

    @GetMapping("/user/{id}")
    private ResponseEntity<ReponseObject<Object>> getUserById(@PathVariable("id") String id) {
        Users uModel = userService.findUserById(id);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "User retrieved sucessfully", uModel)); 
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