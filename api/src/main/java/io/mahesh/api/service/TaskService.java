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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JourneyPathRepository journeyPathRepository;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathService.class);

    public Tasks findTaskById (String id) {
        if(StringUtils.isBlank(id)) {
            throw new FieldValidationException(id, "Id is required");
        }
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(id);
            if (!tEntity.isPresent()) {
                logger.warn("findTaskById - Task not found with id " + id);
               throw new ResourceNotFoundException("Task not found with id " + id);
            }
            return new Tasks(tEntity.get());
        } catch (DataAccessException e) {
            logger.error("findTaskById database error: {}", e.getMessage());
        }
        return null; 
    }

    public Tasks createTask (Tasks task) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(task.getUserId());
            if (!uEntity.isPresent()) {
                logger.warn("createTask - User not found with id " + task.getUserId());
                throw new ResourceNotFoundException("User not found with id " + task.getUserId());
            }
            Optional<JourneyPathEntity> jEntity = journeyPathRepository.findById(task.getJourneyId());
            if (!jEntity.isPresent()) {
                logger.warn("createTask - Journey not found with id " + task.getJourneyId());
                throw new ResourceNotFoundException("Journey not found with id " + task.getJourneyId());
            }
            TasksEntity tEntity = new TasksEntity(task);
            tEntity = taskRepository.save(tEntity);
            return new Tasks(tEntity);
        } catch (DataAccessException e) {
            logger.error("createTask database error: {}", e.getMessage());
            return null;
        }
    }
    
    public ArrayList<Tasks> findTasksByUser (Users user) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        if(StringUtils.isBlank(user.getId())) {
            throw new FieldValidationException(user.getId(), "User id is required");
        }
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<TasksEntity> tasks = taskRepository.findByUser(UEntity);
            if(tasks.isEmpty()) {
                logger.warn("findTasksByUser - Did not find tasks for user: " + user.getId());
                throw new ResourceNotFoundException("Did not find tasks for user: " + user.getId());
            }
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (DataAccessException e) {
            logger.error("findTasksByUser database error: {}", e.getMessage());
        }
        return taskModels;
    }

    public ArrayList<Tasks> findTasksByJourney (JourneyPath journey) {
        ArrayList<Tasks> taskModels = new ArrayList<>();
        if(StringUtils.isBlank(journey.getId())) {
            throw new FieldValidationException(journey.getId(), "Journey id is required");
        }        
        try {
            JourneyPathEntity jEntity = new JourneyPathEntity(journey);
            List<TasksEntity> tasks = taskRepository.findByJourney(jEntity);
            if(tasks.isEmpty()) {
                logger.warn("findTasksByJourney - Did not find tasks for journey: " + journey.getId());
                throw new ResourceNotFoundException("Did not find tasks for journey: " + journey.getId());
            }
            for (TasksEntity task : tasks) {
                Tasks taskModel = new Tasks(task);
                taskModels.add(taskModel);
            }
        } catch (DataAccessException e) {
            logger.error("findTasksByJourney database error: {}", e.getMessage());
        }
        return taskModels;
    }

    public Tasks updateTask (Tasks taskModel) {
        Tasks updatedTaskModel = null;
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(taskModel.getId());
            if (!tEntity.isPresent()) {
                logger.warn("updateTask - Task not found with id " + taskModel.getId());
               throw new ResourceNotFoundException("Task not found with id " + taskModel.getId());
            }
            TasksEntity updatedTask = new TasksEntity(taskModel);
            TasksEntity updatedTaskEntity = taskRepository.save(updatedTask);
            if (Objects.nonNull(updatedTaskEntity)) {
                updatedTaskModel = new Tasks(updatedTaskEntity);
            }
        } catch (DataAccessException e) {
            logger.error("updateTask database error: {}", e.getMessage());
        }
        return updatedTaskModel;
    }

    public boolean deleteTask (Tasks taskModel) {
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(taskModel.getId());
            if (!tEntity.isPresent()) {
                logger.warn("deleteTask - Task not found with id " + taskModel.getId());
               throw new ResourceNotFoundException("Task not found with id " + taskModel.getId());
            }
            TasksEntity taskToDelete = new TasksEntity(taskModel);
            taskRepository.delete(taskToDelete);
            return true;
        } catch (DataAccessException e) {
            logger.error("deleteTask database error: {}", e.getMessage());
            return false;
        }
    }

    public Tasks completeTask (Tasks task) {
        Tasks updatedTaskModel = null;
        try {
            Optional<TasksEntity> tEntity = taskRepository.findById(task.getId());
            if (!tEntity.isPresent()) {
                logger.warn("completeTask - Task not found with id " + task.getId());
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
            logger.error("completeTask database error: {}", e.getMessage());
        }
        return updatedTaskModel;
    } 
}
