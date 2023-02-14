package io.mahesh.api.data;

import java.util.List;

import org.springframework.stereotype.Service;

import io.mahesh.api.data.entity.UserEntity;

@Service
public class UsersDataService implements DataAccessInterface<UserEntity> {

    @Override
    public List<UserEntity> findAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public UserEntity findById(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void create(UserEntity t) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void update(UserEntity t) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void delete(UserEntity t) {
        // TODO Auto-generated method stub
        
    }
    
}
