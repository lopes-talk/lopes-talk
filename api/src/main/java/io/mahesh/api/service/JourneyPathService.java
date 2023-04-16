package io.mahesh.api.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.MongoException;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.entity.UserEntity;
import io.mahesh.api.data.repository.JourneyPathRepository;
import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Users;

/*
 * Service: JourneyPath Operations
 */
@Service
public class JourneyPathService {
    @Autowired
    private JourneyPathRepository journeyPathRepository;

    public JourneyPath createJourneyPath(JourneyPath journeyPath) {
        try {
            JourneyPathEntity jEntity = new JourneyPathEntity(journeyPath);
            jEntity = journeyPathRepository.save(jEntity);
            return new JourneyPath(jEntity);
        } catch (MongoException e) {
            // Log Statement
            return null;
        }
    }

    public JourneyPath getJourneyPathById(String id) {
        try {
            Optional<JourneyPathEntity> jEntity = journeyPathRepository.findById(id);
            if(jEntity.isPresent()) {
                return new JourneyPath(jEntity.get());
            }
        } catch (MongoException e) {
            // Log statement
        }
        return null; 
    }

    public ArrayList<JourneyPath> findJourneyPathsByUser(Users user) {
        ArrayList<JourneyPath> jModels = new ArrayList<>();
        try {
            UserEntity UEntity = new UserEntity(user.getId());
            List<JourneyPathEntity> journeys = journeyPathRepository.findByUser(UEntity);
            for (JourneyPathEntity journey : journeys) {
                JourneyPath jModel = new JourneyPath(journey);
                jModels.add(jModel);
            }
        } catch (MongoException e) {
            //Log statement
        }
        return jModels;
    }

    public JourneyPath updateJourneyPath(JourneyPath journeyPath) {
        JourneyPath updatedJourneyModel = null;
        try {
            JourneyPathEntity jEntity = new JourneyPathEntity(journeyPath);
            JourneyPathEntity updatedJourneyEntity = journeyPathRepository.save(jEntity);
            if (updatedJourneyEntity != null) {
                updatedJourneyModel = new JourneyPath(updatedJourneyEntity);
            }
        } catch (MongoException e) {
            // Log statement
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
        } catch (MongoException e) { 
            //Log statement
        }
        return jModelList;    
    }
}
