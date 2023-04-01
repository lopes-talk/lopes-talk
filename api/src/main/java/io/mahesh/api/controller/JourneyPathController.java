package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.mahesh.api.data.entity.JourneyPathEntity;
import io.mahesh.api.service.JourneyPathService;

@RestController
@RequestMapping("/journeyPath/api")
public class JourneyPathController {
    @Autowired
    private JourneyPathService journeyPathService;

    private final Logger logger = LoggerFactory.getLogger(JourneyPathController.class);

    // POST
    @PostMapping("/addJourneyPath")
    public JourneyPathEntity addJourneyPath(@RequestBody JourneyPathEntity journeyPath) {
        logger.info("JourneyPathEntity object {}", journeyPath.toString());
        return journeyPathService.saveJourneyPath(journeyPath);
    }

    @PostMapping("/addJourneyPaths")
    public List<JourneyPathEntity> addJourneyPaths(@RequestBody List<JourneyPathEntity> journeyPaths) {
        logger.info("JourneyPath Controller of addJourneyPaths()\nAdd multiple journey paths {}", journeyPaths.toString());
        return journeyPathService.saveJourneyPaths(journeyPaths);
    }


    // GET
    @GetMapping("/journeyPaths")
    public List<JourneyPathEntity> getAllJourneyPaths() {
        logger.info("JourneyPath Controller of getAllJourneyPaths()\nRetrieving all journey paths {}", journeyPathService.getJourneyPaths().toString());
        return journeyPathService.getJourneyPaths();
    }

    @GetMapping("/journeyPathsById/{id}")
    public JourneyPathEntity findJourneyPathById(@PathVariable String id) {
        logger.info("JourneyPath Controller of findJourneyPathById()\nFinding journey path by String id of {}", id.toString());
        return journeyPathService.getJourneyPathById(id);
    }

    @GetMapping("/journeyPathByName/{task}")
    public JourneyPathEntity findJourneyPathByTask(@PathVariable String task) {
        logger.info("JourneyPath Controller of findJourneyPathByTask()\nFinding journey path by String task of {}", task.toString());
        return journeyPathService.getJourneyPathByTask(task);
    }

    @GetMapping("/listJourneyPathByUsername/{username}")
    public List<JourneyPathEntity> findJourneyPathsByUsername(@PathVariable String username) {
        logger.info("JourneyPath Controller of findJourneyPathsByUsername()\nFinding journey path(s) by String username of {}", username.toString());
        return journeyPathService.getJourneyPathsForUser(username);
    }


    // PUT
    @PutMapping("/update")
    public JourneyPathEntity updateJourneyPath(@RequestBody JourneyPathEntity journeyPath) {
        System.out.println("UPDATED");
        return journeyPathService.updateJourneyPath(journeyPath);
    }


    // DELETE
    @DeleteMapping("/delete/{id}")
    public String deleteJourneyPath(@PathVariable("id") String id) {
        logger.info("JourneyPath Controller of deleteJourneyPath()\nString id of {}", id.toString());
        return journeyPathService.deleteJourneyPath(id);
    }
}
