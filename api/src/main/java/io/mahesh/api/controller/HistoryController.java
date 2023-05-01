package io.mahesh.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

import io.mahesh.api.model.History;
import io.mahesh.api.model.Users;
import io.mahesh.api.response.ReponseObject;
import io.mahesh.api.service.HistoryService;

@RestController
@RequestMapping("api")
@CrossOrigin(origins = {"http://localhost:8080", "https://your-api-domain.com"})
public class HistoryController {
    @Autowired
    private HistoryService historyService; 

    @PostMapping("/history/user")
    private ResponseEntity<ReponseObject<Object>> getHistoryByUser(@RequestBody Users user) {
        ArrayList<History> historyTasks = historyService.findHistoryByUser(user);
        return ResponseEntity.status(HttpStatus.OK).body(new ReponseObject<>("Success", HttpStatus.OK.value(), "History retrieved successfully", historyTasks));
    }
}
