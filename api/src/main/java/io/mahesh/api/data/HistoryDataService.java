package io.mahesh.api.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.mahesh.api.data.repository.HistoryRepository;
import io.mahesh.api.model.History;

@Service
public class HistoryDataService {
    @Autowired
    private HistoryRepository historyRepository;

    /**
     * Get full history finished by a specific user
     * @param uid
     * @return All tasks completed by user
     */
    public List<History> findAllByUser(String uid) {
        List<History> completedTasks = new ArrayList<History>();
        try {
            //  Get all the history models
            Iterable<History> historyIterable = historyRepository.findByUserId(uid);

            //Convert to a list and return the list
            completedTasks = new ArrayList<History>();
            historyIterable.forEach(completedTasks::add);
        } catch (Exception e) {
            // Log stack trace & throw custom exception to caller
            e.printStackTrace();
            //throw new DatabaseException(e, "Database Exeption");
        }
        return completedTasks;
    }
}
