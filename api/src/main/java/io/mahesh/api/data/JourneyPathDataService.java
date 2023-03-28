package io.mahesh.api.data;

import java.util.List;

import org.springframework.stereotype.Service;

import io.mahesh.api.model.JourneyPath;

@Service
public class JourneyPathDataService implements DataAccessInterface<JourneyPath>{

    @Override
    public List<JourneyPath> findAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    @Override
    public JourneyPath findById(String id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public void create(JourneyPath t) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void update(JourneyPath t) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void delete(JourneyPath t) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }
    
}
