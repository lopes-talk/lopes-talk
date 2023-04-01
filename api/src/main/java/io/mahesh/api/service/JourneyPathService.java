package io.mahesh.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.data.repository.JourneyPathRepository;

/*
 * Service: JourneyPath Operations
 */
@Service
public class JourneyPathService {
    @Autowired
    private JourneyPathRepository journeyPathRepository;

    // POST
    public JourneyPathEntity saveJourneyPath(JourneyPathEntity journeyPath) {
        System.out.println(journeyPath.toString());
        return journeyPathRepository.save(journeyPath);
    }

    // Optional!
    public List<JourneyPathEntity> saveJourneyPaths(List<JourneyPathEntity> journeyPath) {
        return journeyPathRepository.saveAll(journeyPath);
    }

    // GET
    public List<JourneyPathEntity> getJourneyPaths() {
        return journeyPathRepository.findAll();
    }

    public JourneyPathEntity getJourneyPathById(String id) {
        return journeyPathRepository.findById(id).orElse(null);
    }

    public JourneyPathEntity getJourneyPathByTask(String task) {
        return journeyPathRepository.findByTask(task);
    }

    public List<JourneyPathEntity> getJourneyPathsForUser(String username) {
        return journeyPathRepository.findAllByUsername(username);
    }

    // PUT
    public JourneyPathEntity updateJourneyPath(JourneyPathEntity journeyPath) {
        System.out.println("updates");
        JourneyPathEntity existing_course = journeyPathRepository.findById(journeyPath.get_id()).orElse(null);
        existing_course.setName(journeyPath.getName());
        // existing_course.setDateCompleted(course.getDateCompleted());
        // existing_course.setStatus(course.isStatus());
        return journeyPathRepository.save(existing_course);
    }

    // DELETE
    public String deleteJourneyPath(String id) {
        journeyPathRepository.deleteById(id);
        return id + " id -> course removed/completed";
    }
}
