package io.mahesh.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.TasksEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ScheduledJobs {
    @Autowired
    private MongoTemplate mongoTemplate;

    final Logger logger = LoggerFactory.getLogger(ScheduledJobs.class);

    @Scheduled(cron = "0 0 0 * * ?")
    public void resetTaskStatus() {
        logger.info("Running Scheduled Task: resetTaskStatus");
        try {
            Query query = new Query();
            Update update = new Update().set("status", false);
            mongoTemplate.updateMulti(query, update, TasksEntity.class); 
        } catch (Exception e) {
            logger.error("Running Scheduled Task: resetTaskStatus failed with error: {} ", e.getMessage());
        }
        logger.info("Completed Scheduled Task: resetTaskStatus");

    }
}