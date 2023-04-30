package io.mahesh.api.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import io.micrometer.common.util.StringUtils;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.entity.HistoryEntity;
import io.mahesh.api.data.repository.HistoryRepository;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.exception.DataAccessException;
import io.mahesh.api.exception.FieldValidationException;
import io.mahesh.api.exception.ResourceNotFoundException;
import io.mahesh.api.model.History;
import io.mahesh.api.model.Tasks;
import io.mahesh.api.model.Users;

@Service
public class HistoryService {
    @Autowired 
    private HistoryRepository historyRepository;
    @Autowired 
    private UserRepository userRepository;

    public ArrayList<History> findHistoryByUser (Users user) {
        ArrayList<History> historyModels = new ArrayList<>();
        if(StringUtils.isBlank(user.getId())) {
            // TODO: Log that field exception
            throw new FieldValidationException(user.getId(), "User id is required");
        }
        //TODO: Add another catch for general exception to log
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<HistoryEntity> historyTasks = historyRepository.findByUser(UEntity);
            if(historyTasks.isEmpty()) {
                //TODO: Log the tasks not found
                throw new ResourceNotFoundException("Did not find tasks for user: " + user.getId());
            }
            for (HistoryEntity history : historyTasks) {
                History historyModel = new History(history);
                historyModels.add(historyModel);
            }
        } catch (DataAccessException e) {
             // TODO: Log the exception
        }
        return historyModels;
    }

    public History createHistory (Tasks task) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(task.getUserId());
            if (!uEntity.isPresent()) {
                //TODO: Log the user not found
                throw new ResourceNotFoundException("User not found with id " + task.getUserId());
            }
            HistoryEntity hEntity = new HistoryEntity(task.getName(), 
            uEntity.get());
            
            // Set the history entity with dateCompleted date 
            LocalDateTime dateCompleted = LocalDateTime.now();
            hEntity.setDateCompleted(dateCompleted);
            hEntity = historyRepository.save(hEntity);
            return new History(hEntity);
        } catch (DataAccessException e) {
             // TODO: Log the exception
            return null;
        }
    }

}

