package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import jakarta.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.mahesh.api.model.JourneyPath;
import io.mahesh.api.model.Users;
import io.mahesh.api.response.ReponseObject;
import io.mahesh.api.service.JourneyPathService;

@RestController
@RequestMapping("api")
@CrossOrigin(origins = {"http://localhost:8080", "https://your-api-domain.com"})
public class JourneyPathController {
    @Autowired
    private JourneyPathService journeyPathService;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathController.class);

    @GetMapping("/journey/{id}")
    public ResponseEntity<ReponseObject<Object>> findJourneyPathById(@PathVariable String id) {
        logger.info("JourneyPath Controller of findJourneyPathById()\nFinding journey path by String id of {}", id.toString());
        JourneyPath jModel = journeyPathService.getJourneyPathById(id);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Journey retrieved successfully", jModel));
    }

    @PostMapping("/journey")
    public ResponseEntity<ReponseObject<Object>> createJourneyPath(@Valid @RequestBody JourneyPath journeyPath) {
        logger.info("JourneyPathEntity object {}", journeyPath.toString());
        JourneyPath jModel = journeyPathService.createJourneyPath(journeyPath);
        return ResponseEntity.status(HttpStatus.CREATED).body(new ReponseObject<>("Success", HttpStatus.CREATED.value(), "Created journey successfully", jModel)); 
    }

    @PostMapping("/journey/user")
    public ResponseEntity<ReponseObject<Object>> findJourneyPathsByUser(@RequestBody Users user) {
        logger.info("JourneyPath Controller of findJourneyPathsByUsername()\nFinding journey path(s) by user id of {}", user.getId());
        ArrayList<JourneyPath> journeys = journeyPathService.findJourneyPathsByUser(user);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Journies retrieved successfully", journeys));
    }

    @PutMapping("/journey")
    public ResponseEntity<ReponseObject<Object>> updateJourneyPath(@Valid @RequestBody JourneyPath journeyPath) {
        logger.info("JourneyPath object {}", journeyPath.toString());
        JourneyPath jModel = journeyPathService.updateJourneyPath(journeyPath);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "Journey updated successfully", jModel));
    }

    @PutMapping("/journies")
    public ResponseEntity<ReponseObject<Object>> updateAllJourneyPaths(@Valid @RequestBody ArrayList<JourneyPath> journeyList) {
        logger.info("JourneyPath List object {}", journeyList.toString());
        ArrayList<JourneyPath> jUpdatedMList = journeyPathService.updateJourneyPaths(journeyList);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<> ("Success", HttpStatus.OK.value(), "Journies updated successfully", jUpdatedMList));
    }

}
