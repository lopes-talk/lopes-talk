package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

import jakarta.validation.Valid;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;
import io.mahesh.api.response.ReponseObject;
import io.mahesh.api.service.HistoryService;
import io.mahesh.api.service.TaskService;

@RestController
@RequestMapping("api")
@CrossOrigin(origins = {"http://localhost:8080", "https://your-api-domain.com"})
public class TasksController {
    @Autowired
    private TaskService taskService;
    @Autowired 
    private HistoryService historyService;

    @GetMapping("/task/{id}") 
    private ResponseEntity<ReponseObject<Object>> getTaskById(@PathVariable("id") String id) {
       Tasks tModel = taskService.findTaskById(id);
       return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Task retrieved successfully", tModel));
    }
    
    @PostMapping("/task")
    private ResponseEntity<ReponseObject<Object>> createTask(@Valid @RequestBody Tasks task) {
        Tasks taskModel = taskService.createTask(task);
        return ResponseEntity.status(HttpStatus.CREATED).body(new ReponseObject<>("Success", HttpStatus.CREATED.value(), "Created task successfully", taskModel));   
    }

    @PostMapping("/task/user")
    private ResponseEntity<ReponseObject<Object>> getTasksByUser(@RequestBody Users user) {
        ArrayList<Tasks> tasks = taskService.findTasksByUser(user);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Tasks retrieved successfully", tasks));
    }

    @PostMapping("/task/journey")
    private ResponseEntity<ReponseObject<Object>> getTaskByJourney(@RequestBody JourneyPath journey) {
        ArrayList<Tasks> tasks = taskService.findTasksByJourney(journey);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Tasks retrieved successfully", tasks));
    }

    @PostMapping("/task/complete")
    private ResponseEntity<ReponseObject<Object>> getTaskByJourney(@RequestBody Tasks task) {
        // First complete the task
        Tasks tasks = taskService.completeTask(task);
        // Next create history of task for history view
        historyService.createHistory(task);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Tasks completed successfully", tasks));
    }

    @PutMapping("/task")
    private ResponseEntity<ReponseObject<Object>> updateTask(@Valid @RequestBody Tasks task) {
        Tasks taskModel = taskService.updateTask(task);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Task updated successfully", taskModel));
    }

    @DeleteMapping("/task")
    private ResponseEntity<ReponseObject<Object>> deleteTask(@Valid @RequestBody Tasks task) {
        taskService.deleteTask(task);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<> ("Success", HttpStatus.OK.value(), "Task deleted successfully", null));
    }
}