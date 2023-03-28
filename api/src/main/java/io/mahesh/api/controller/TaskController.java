package io.mahesh.api.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PatchMapping;
// import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

//import io.mahesh.api.data.repository.TaskRepository;
import io.mahesh.api.model.Tasks;
//import io.mahesh.api.service.TasksService;

@RestController
public class TaskController {
    // @Autowired
    // private TaskRepository taskRepository;

    // // @Autowired
    // // private TasksService tasksService;

    // List<Tasks> tasksList = new ArrayList<Tasks>();

    // // CRUD OPERATIONS

    // // CREATE
    // @PostMapping("/createTask")
    // public Tasks Create(@RequestBody Tasks task) {
    //     task.setDateCompleted(LocalDate.now().toString());
    //     System.out.println("\nThis is the Date Completed: " + task.getDateCompleted());
    //     System.out.println("success with task info of " + task);
    //     return taskRepository.save(task);
    // }

    // // READ
    // @GetMapping("/getTasks")
    // public Tasks Retrieve(@RequestBody Tasks task) {
    //     tasksList = taskRepository.findAll();

    //     tasksList.forEach(tasks -> System.out.println(task));

    //     return task;
    // }

    // UPDATE
    // @PatchMapping("/updateTask/{taskId}")
    // public ResponseEntity<Tasks> Update(@RequestBody Tasks request, @PathVariable
    // String taskId) {
    // return ResponseEntity.ok(tasksService.updateTask(taskId, request));
    // }

    // DELETE
    // @DeleteMapping("/deleteTask/{taskId}")
    // public ResponseEntity<Void> deleteTask(@PathVariable String taskId) {
    // taskRepository.deleteById(taskId);
    // return ResponseEntity.ok().build();
    // }

    // @DeleteMapping("/deleteTask/{taskId}")
    // public ResponseEntity<String> deleteTask(@PathVariable(value = "_id") String taskId) {
    //     return ResponseEntity.ok(taskId);
    // }

    // @DeleteMapping("/deleteTask/{taskId}")
    // public Boolean deleteTask(@PathVariable(value = "_id") String taskId) {

    // return true;
    // }
}
