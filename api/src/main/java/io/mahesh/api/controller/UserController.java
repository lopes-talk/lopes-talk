package io.mahesh.api.controller;
import java.util.HashMap;
import java.util.Map;

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

    @PostMapping("/login")
    private ResponseEntity<ReponseObject<Object>> loginUser(@RequestBody Users user) throws AuthenticationException {
        Users uModel;
        uModel = userService.getUser(user);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "User logged in successfully", uModel));   
     }

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
        Map<String, String[]> taskMap = new HashMap<>();
        // add tasks to the map

        String[] emotional = {"Mediate - 30 Minutes", "Read - 20 mins", "Practice journaling", "Reflect on your day - 5 mins before bed", "NO screentime - 10 mins", "Take a deep breathe and take a walk when feeling overwhelmed"};
        String[] mental = {"Listen to a podcast", "Speak affirmations: \"I am capable of achieving my goals\"", "Laugh or smile once today :D", "Listen to an upbeat playlist", "Practice a new skill", "Play a brain game"};
        String[] physical = {"Go for a walk", "Take a relaxing bath/shower", "Drink a glass of water", "Complete nightly routine", "Take a nap", "Morning stretch - 5 mins"};
        String[] practical = {"Make bed", "Clean up email inbox", "Do that thing you've been putting off", "Put on sunscreen before leaving!", "Make to do list for the day", "Focus on the present moment"};
        String[] social = {"Call a friend", "Meet with a friend for a walk and talk", "Write a letter", "Host a game night for friends", "Positive social media - avoid the negatives", "Reflect on boundaries with friends"};

        // Add arrays to the map
        taskMap.put("Emotional", emotional);
        taskMap.put("Mental", mental);
        taskMap.put("Physical", physical);
        taskMap.put("Practical", practical);
        taskMap.put("Social", social);

        // Arrays to grab all 
        // ArrayList<String> setJourneyPaths = new ArrayList<String>() {{
        //     add("Physical");
        //     add("Emotional");
        //     add("Practical");
        //     add("Mental");
        //     add("Social");
        // }};

        // get the keys as an array
        String[] journeyKeys = taskMap.keySet().toArray(new String[0]);

         // Create a journey for user
        for (String journeyString : journeyKeys ) {
            String jName = journeyString;
            boolean isActive = false;
            String userId = user.getId();
            JourneyPath jModel = new JourneyPath(jName, isActive, userId);
            jModel = journeyService.createJourneyPath(jModel);
           
            String[] tasks = taskMap.get(journeyString);

            for (String task : tasks) {
                //Create tasks for users that belong to the created journey
                boolean status = false;
                Tasks tModel = new Tasks(task, status, userId, jModel.getId());
                taskService.createTask(tModel);
            }
        }
    }
}