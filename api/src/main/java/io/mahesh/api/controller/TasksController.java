package io.mahesh.api.controller;

import java.util.ArrayList;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;
import io.mahesh.api.service.TaskService;


@RestController
@RequestMapping("api")
public class TasksController {
    @Autowired
    private TaskService taskService;

    @GetMapping("/task/{id}") 
    private ResponseEntity<Object> getTaskById(@PathVariable("id") String id) {
       Tasks tModel = taskService.findTaskById(id);
        if(tModel != null) {
            return ResponseEntity.ok(tModel);
        }
        String message = "Task with ID " + id + " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }
    
    @PostMapping("/task")
    private ResponseEntity<Object> createTask(@RequestBody Tasks task) {
        Tasks taskModel = taskService.createTask(task);
        if(!Objects.isNull(taskModel)) {
            return ResponseEntity.ok(taskModel);
        }
        String message = "Error creating task";
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }

    @PostMapping("/task/user")
    private ResponseEntity<Object> getTasksByUser(@RequestBody Users user) {
        ArrayList<Tasks> tasks = taskService.findTasksByUser(user);
        if(!tasks.isEmpty()) {
            return ResponseEntity.ok(tasks);
        }
        String message = "Tasks for user  " + user.getId()+ " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }

    @PostMapping("/task/journey")
    private ResponseEntity<Object> getTaskByJourney(@RequestBody JourneyPath journey) {
        ArrayList<Tasks> tasks = taskService.findTasksByJourney(journey);
        if(!tasks.isEmpty()) {
            return ResponseEntity.ok(tasks);
        }
        String message = "Tasks for journey  " + journey.getId()+ " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }

    @PutMapping("/task")
    private ResponseEntity<Object> updateTask(@RequestBody Tasks task) {
        Tasks taskModel = taskService.updateTask(task);
        if(taskModel != null) {
            return ResponseEntity.ok(taskModel);
        }
        String message = "Error updating task " + task.getId();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }

    @DeleteMapping("/task")
    private ResponseEntity<String> deleteTask(@RequestBody Tasks task) {
        boolean deleted = taskService.deleteTask(task);
        if(deleted) {
            return ResponseEntity.ok("Successfullly deleted task with id: " + task.getId());
        }
        String message = "Error deleting task " + task.getId();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }
}