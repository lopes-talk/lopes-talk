package io.mahesh.api.controller;

import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.mahesh.api.data.entity.TasksEntity;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.service.TaskService;


@RestController
@RequestMapping("tasks/api")
public class TasksController {
    @Autowired
    private TaskService taskService;

    @PostMapping("createTask")
    private ResponseEntity<Tasks> createTask(@RequestBody TasksEntity task) {
        System.out.println("POST Create Task");
        Tasks taskModel = taskService.createTask(task);
        if(!Objects.isNull(taskModel)) {
            return ResponseEntity.ok(taskModel);
        }
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/tasks/{id}") 
    private ResponseEntity<TasksEntity> getTaskById(@PathVariable("id") String id) {
        Optional<TasksEntity> taskOptional = taskService.findTaskById(id);
        if(taskOptional.isPresent()) {
            return ResponseEntity.ok(taskOptional.get());
        }
        return ResponseEntity.notFound().build();
    }
}