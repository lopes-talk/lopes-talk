package io.mahesh.api.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.MongoException;

import io.mahesh.api.data.entity.TasksEntity;
import io.mahesh.api.data.repository.TaskRepository;
import io.mahesh.api.model.Tasks;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;

    public Tasks createTask (TasksEntity task) {
        System.out.println("Task Service creating Task");
        try {
            task = taskRepository.insert(task);
            // Convert to task model (to pass to front end app)
            Tasks taskModel = new Tasks(task);
            return taskModel;

        } catch (MongoException e) {
            System.out.println("Error creating task");
            return null;
        }
    }

    public Optional<TasksEntity> findTaskById (String id) {
        System.out.println("Task Service finding task with id: " + id);
        try {
            return taskRepository.findById(id);
        } catch (MongoException e) {
            System.out.println("Error finding task");
            return null;
        } 
    }
}
