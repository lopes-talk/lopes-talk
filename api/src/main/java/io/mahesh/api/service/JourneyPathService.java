package io.mahesh.api.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.JourneyPathRepository;
import io.mahesh.api.data.repository.UserRepository;
import io.mahesh.api.exception.DataAccessException;
import io.mahesh.api.exception.FieldValidationException;
import io.mahesh.api.exception.ResourceNotFoundException;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Users;
import io.micrometer.common.util.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * Service: JourneyPath Operations
 */
@Service
public class JourneyPathService {
    @Autowired
    private JourneyPathRepository journeyPathRepository;
    @Autowired
    private UserRepository userRepository;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathService.class);

    public JourneyPath createJourneyPath(JourneyPath journeyPath) {
        try {
            Optional<UserEntity> uEntity = userRepository.findById(journeyPath.getUserId());
            if (!uEntity.isPresent()) {
                logger.warn("createJourneyPath - User not found with id " + journeyPath.getUserId());
                throw new ResourceNotFoundException("User not found with id " + journeyPath.getUserId());
            }
            JourneyPathEntity jEntity = new JourneyPathEntity(journeyPath);
            jEntity = journeyPathRepository.save(jEntity);
            return new JourneyPath(jEntity);
        } catch (DataAccessException e) {
             logger.error("createJourneyPath database error: {}", e.getMessage());
             return null;
        }
    }

    public JourneyPath getJourneyPathById(String id) {
        if(StringUtils.isBlank(id)) {
            throw new FieldValidationException(id, "Id is required");
        }
        try {
            Optional<JourneyPathEntity> jEntity = journeyPathRepository.findById(id);
            if(!jEntity.isPresent()) {
                logger.warn("getJourneyPathById - Journey not found with id " + id);
               throw new ResourceNotFoundException("Journey not found with id " + id);
            }
            return new JourneyPath(jEntity.get());
        } catch (DataAccessException e) {
            logger.error("getJourneyPathById database error: {}", e.getMessage());
        }
        return null; 
    }

    public ArrayList<JourneyPath> findJourneyPathsByUser(Users user) {
        ArrayList<JourneyPath> jModels = new ArrayList<>();
        if(StringUtils.isBlank(user.getId())) {
            throw new FieldValidationException(user.getId(), "User id is required");
        }
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<JourneyPathEntity> journeys = journeyPathRepository.findByUser(UEntity);
            if(journeys.isEmpty()) {
                logger.warn("findJourneyPathsByUser - Did not find journies for user: " + user.getId());
                throw new ResourceNotFoundException("Did not find journies for user: " + user.getId());
            }
            for (JourneyPathEntity journey : journeys) {
                JourneyPath jModel = new JourneyPath(journey);
                jModels.add(jModel);
            }
        } catch (DataAccessException e) {
            logger.error("findJourneyPathsByUser database error: {}", e.getMessage());
        }
        return jModels;
    }

    public JourneyPath updateJourneyPath(JourneyPath journeyPath) {
        JourneyPath updatedJourneyModel = null;
        try {
            Optional<JourneyPathEntity> jEntity = journeyPathRepository.findById(journeyPath.getId());
            if (!jEntity.isPresent()) {
               logger.warn("Journey not found with id " + journeyPath.getId());
               throw new ResourceNotFoundException("Journey not found with id " + journeyPath.getId());
            }
            JourneyPathEntity updatedJourney = new JourneyPathEntity(journeyPath);
            JourneyPathEntity updatedJourneyEntity = journeyPathRepository.save(updatedJourney);
            if (Objects.nonNull(updatedJourneyEntity)) {
                updatedJourneyModel = new JourneyPath(updatedJourneyEntity);
            }
        } catch (DataAccessException e) {
            logger.error("updateJourneyPath database error: {}", e.getMessage());
        }
        return updatedJourneyModel;
    }

    public ArrayList<JourneyPath> updateJourneyPaths(ArrayList<JourneyPath> journeyPathList) {
        ArrayList<JourneyPathEntity> jEntityList = new ArrayList<>();
        ArrayList<JourneyPath> jModelList = new ArrayList<>();
        try {
            for (JourneyPath journey :journeyPathList) {
                jEntityList.add(new JourneyPathEntity(journey));
            }
            List<JourneyPathEntity> updatedJEntities = journeyPathRepository.saveAll(jEntityList);
            for (JourneyPathEntity jEntity : updatedJEntities) {
                jModelList.add(new JourneyPath(jEntity));
            }
        } catch (DataAccessException e) { 
            logger.error("updateJourneyPaths database error: {}", e.getMessage());
        }
        return jModelList;    
    }
}
