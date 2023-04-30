package io.mahesh.api.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.TasksEntity;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.JourneyPathRepository;
import io.mahesh.api.data.repository.TaskRepository;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.exception.DataAccessException;
import io.mahesh.api.exception.FieldValidationException;
import io.mahesh.api.exception.ResourceNotFoundException;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;
import io.micrometer.common.util.StringUtils;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JourneyPathRepository journeyPathRepository;

    public Tasks findTaskById (String id) {
        if(StringUtils.isBlank(id)) {
            // TODO: Log that field exception
            throw new FieldValidationException(id, "Id is required");
        }
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(id);
            if (!tEntity.isPresent()) {
               //TODO: Log the user not found
               throw new ResourceNotFoundException("Task not found with id " + id);
            }
            return new Tasks(tEntity.get());
        } catch (DataAccessException e) {
            // TODO: Log the exception
        }
        return null; 
    }

    public Tasks createTask (Tasks task) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(task.getUserId());
            if (!uEntity.isPresent()) {
                //TODO: Log the user not found
                throw new ResourceNotFoundException("User not found with id " + task.getUserId());
            }
            Optional<JourneyPathEntity> jEntity = journeyPathRepository.findById(task.getJourneyId());
            if (!jEntity.isPresent()) {
                //TODO: Log the jEntity not found
                throw new ResourceNotFoundException("Journey not found with id " + task.getJourneyId());
            }
            TasksEntity tEntity = new TasksEntity(task);
            tEntity = taskRepository.save(tEntity);
            return new Tasks(tEntity);
        } catch (DataAccessException e) {
             // TODO: Log the exception
            return null;
        }
    }
    
    public ArrayList<Tasks> findTasksByUser (Users user) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        if(StringUtils.isBlank(user.getId())) {
            // TODO: Log that field exception
            throw new FieldValidationException(user.getId(), "User id is required");
        }
        //TODO: Add another catch for general exception to log
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<TasksEntity> tasks = taskRepository.findByUser(UEntity);
            if(tasks.isEmpty()) {
                //TODO: Log the tasks not found
                throw new ResourceNotFoundException("Did not find tasks for user: " + user.getId());
            }
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (DataAccessException e) {
             // TODO: Log the exception
        }
        return taskModels;
    }

    public ArrayList<Tasks> findTasksByJourney (JourneyPath journey) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        if(StringUtils.isBlank(journey.getId())) {
            // TODO: Log that field exception
            throw new FieldValidationException(journey.getId(), "Journey id is required");
        }        
        try {
            JourneyPathEntity jEntity = new JourneyPathEntity(journey);
            List<TasksEntity> tasks = taskRepository.findByJourney(jEntity);
            if(tasks.isEmpty()) {
                //TODO: Log the tasks not found
                throw new ResourceNotFoundException("Did not find tasks for journey: " + journey.getId());
            }
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (DataAccessException e) {
            // TODO: Log the exception
        }
        return taskModels;
    }

    public Tasks updateTask (Tasks taskModel) {
        Tasks updatedTaskModel = null;
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(taskModel.getId());
            if (!tEntity.isPresent()) {
               //TODO: Log the task not found
               throw new ResourceNotFoundException("Task not found with id " + taskModel.getId());
            }
            TasksEntity updatedTask = new TasksEntity(taskModel);
            TasksEntity updatedTaskEntity = taskRepository.save(updatedTask);
            if (Objects.nonNull(updatedTaskEntity)) {
                updatedTaskModel = new Tasks(updatedTaskEntity);
            }
        } catch (DataAccessException e) {
            // TODO: Log the exception
        }
        return updatedTaskModel;
    }

    public boolean deleteTask (Tasks taskModel) {
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(taskModel.getId());
            if (!tEntity.isPresent()) {
               //TODO: Log the task not found
               throw new ResourceNotFoundException("Task not found with id " + taskModel.getId());
            }
            TasksEntity taskToDelete = new TasksEntity(taskModel);
            taskRepository.delete(taskToDelete);
            return true;
        } catch (DataAccessException e) {
            // TODO: Log the exception
            return false;
        }
    }

    public Tasks completeTask (Tasks task) {
        Tasks updatedTaskModel = null;
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(task.getId());
            if (!tEntity.isPresent()) {
               //TODO: Log the task not found
               throw new ResourceNotFoundException("Task not found with id " + task.getId());
            }
            // Set the task model to completed status
            TasksEntity updatedTask = new TasksEntity(task);
            updatedTask.setStatus(true);
            TasksEntity updatedTaskEntity = taskRepository.save(updatedTask);
            if (Objects.nonNull(updatedTaskEntity)) {
                updatedTaskModel = new Tasks(updatedTaskEntity);
            }

        } catch (DataAccessException e) {
            // TODO: Log the exception
        }
        return updatedTaskModel;
    } 
}
