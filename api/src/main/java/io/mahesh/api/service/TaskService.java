package io.mahesh.api.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.MongoException;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.TasksEntity;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.TaskRepository;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;

    public Tasks createTask (Tasks task) {
        try {
            TasksEntity tEntity = new TasksEntity(task);
            tEntity = taskRepository.save(tEntity);
            return new Tasks(tEntity);
        } catch (MongoException e) {
            //Log statement
            return null;
        }
    }

    public Tasks findTaskById (String id) {
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(id);
            if(tEntity.isPresent()) {
                return new Tasks(tEntity.get());
            }
        } catch (MongoException e) {
            // Log statement
        }
        return null; 
    }
    
    public ArrayList<Tasks> findTasksByUser (Users user) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<TasksEntity> tasks = taskRepository.findByUser(UEntity);
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (MongoException e) {
            //Log statement
        }
        return taskModels;
    }

    public ArrayList<Tasks> findTasksByJourney (JourneyPath journey) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        try {
            JourneyPathEntity jEntity = new JourneyPathEntity(journey);
            List<TasksEntity> tasks = taskRepository.findByJourney(jEntity);
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (MongoException e) {
            //Log statement
        }
        return taskModels;
    }

    public Tasks updateTask (Tasks taskModel) {
        Tasks updatedTaskModel = null;
        try {
            TasksEntity tEntity = new TasksEntity(taskModel);
            TasksEntity updatedTaskEntity = taskRepository.save(tEntity);
            if (updatedTaskEntity != null) {
                updatedTaskModel = new Tasks(updatedTaskEntity);
            }
        } catch (MongoException e) {
            // Log statement
        }
        return updatedTaskModel;
    }

    public boolean deleteTask (Tasks taskModel) {
        try {
            TasksEntity tEntity = new TasksEntity(taskModel);
            taskRepository.delete(tEntity);
            return true;
        } catch (MongoException e) {
            // Log statement
            return false;
        }
    }
}
