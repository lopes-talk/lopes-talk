package io.mahesh.api.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import io.mahesh.api.data.HistoryDataService;
import io.mahesh.api.data.repository.HistoryRepository;
import io.mahesh.api.model.History;
public class HistoryService {
    @Autowired
    private HistoryRepository historyRepository;

    /**
     * Retrieve a collection of all listings created by a specific user
     * @return Collection of all listings created by a specific user
     */
    // public List<History> getUserHistory(String uid) {
    //     List<History> completeHistory = new ArrayList<History>();
    //     try {
    //         // retrieve history from db, construct model objects, and add to array
    //         for(History historyEntity : HistoryDataService.findAllByUser(uid)) {
    //             History history = new History(historyEntity);
    //             history.setSeller(new UserModel(usersDataService.findById(historyEntity.getSeller_id())));
    //             history.setCard(pokemonService.getPokemonCard(historyEntity.getCard_id()));
    //             completeHistory.add(history);
    //         }
    //     } catch (Exception e) {
    //         // Log stack trace & throw custom exception to caller
    //         e.printStackTrace();
    //         throw new DatabaseException(e, "Database exception");
    //     }
    //     return completeHistory;
    // }
}
