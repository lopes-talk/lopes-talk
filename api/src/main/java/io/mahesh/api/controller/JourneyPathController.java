package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Users;
import io.mahesh.api.service.JourneyPathService;

@RestController
@RequestMapping("api")
public class JourneyPathController {
    @Autowired
    private JourneyPathService journeyPathService;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathController.class);

    @GetMapping("/journey/{id}")
    public ResponseEntity<Object> findJourneyPathById(@PathVariable String id) {
        logger.info("JourneyPath Controller of findJourneyPathById()\nFinding journey path by String id of {}", id.toString());
        JourneyPath jModel = journeyPathService.getJourneyPathById(id);
        if (jModel != null) {
            return ResponseEntity.ok(jModel);
        }
        String message = "Journey with ID " + id + " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }

    @PostMapping("/journey")
    public ResponseEntity<Object> createJourneyPath(@RequestBody JourneyPath journeyPath) {
        logger.info("JourneyPathEntity object {}", journeyPath.toString());
        JourneyPath jModel = journeyPathService.createJourneyPath(journeyPath);
        if (!Objects.isNull(jModel)) {
            return ResponseEntity.ok(jModel);
        }
        String message = "Error creating journey";
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }

    @PostMapping("/journey/user")
    public ResponseEntity<Object> findJourneyPathsByUser(@RequestBody Users user) {
        logger.info("JourneyPath Controller of findJourneyPathsByUsername()\nFinding journey path(s) by user id of {}", user.getId());
        ArrayList<JourneyPath> journeys = journeyPathService.findJourneyPathsByUser(user);
        if(!journeys.isEmpty()) {
            return ResponseEntity.ok(journeys);
        }
        String message = "Journeys for user  " + user.getId()+ " not found";
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
    }

    @PutMapping("/journey")
    public ResponseEntity<Object> updateJourneyPath(@RequestBody JourneyPath journeyPath) {
        logger.info("JourneyPath object {}", journeyPath.toString());
        JourneyPath jModel = journeyPathService.updateJourneyPath(journeyPath);
        if(jModel != null) {
            return ResponseEntity.ok(jModel);
        }
        String message = "Error updating journey " + journeyPath.getId();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }

    @PutMapping("/journies")
    public ResponseEntity<Object> updateAllJourneyPaths(@RequestBody ArrayList<JourneyPath> journeyList) {
        logger.info("JourneyPath List object {}", journeyList.toString());
        ArrayList<JourneyPath> jUpdatedMList = journeyPathService.updateJourneyPaths(journeyList);
        if (!jUpdatedMList.isEmpty()) {
            return ResponseEntity.ok(jUpdatedMList);
        }
        String message = "Error updating all journies ";
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
    }

}
