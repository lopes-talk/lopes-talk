package io.mahesh.api.service;

import java.time.LocalDateTime;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class HistoryService {
    @Autowired 
    private HistoryRepository historyRepository;
    @Autowired 
    private UserRepository userRepository;

    private final Logger logger = LoggerFactory.getLogger(HistoryService.class);

    public ArrayList<History> findHistoryByUser (Users user) {
        ArrayList<History> historyModels = new ArrayList<>();
        if(StringUtils.isBlank(user.getId())) {
            throw new FieldValidationException(user.getId(), "User id is required");
        }
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<HistoryEntity> historyTasks = historyRepository.findByUser(UEntity);
            if(historyTasks.isEmpty()) {
                logger.warn("findHistoryByUser - Did not find history for user: " + user.getId());
                throw new ResourceNotFoundException("Did not find history for user: " + user.getId());
            }
            for (HistoryEntity history : historyTasks) {
                History historyModel = new History(history);
                historyModels.add(historyModel);
            }
        } catch (DataAccessException e) {
            logger.error("findHistoryByUser database error: {}", e.getMessage());
        } 
        return historyModels;
    }

    public History createHistory (Tasks task) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(task.getUserId());
            if (!uEntity.isPresent()) {
                logger.warn("createHistory - User not found with id " + task.getUserId());
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
            logger.error("createHistory database error: {}", e.getMessage());
            return null;
        }
    }

}

