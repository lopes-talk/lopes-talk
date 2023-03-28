package io.mahesh.api.data;

import java.util.List;

/**
 * Data Access Interface: All Data Services will follow this 
 * @param <T>
 */
public interface DataAccessInterface<T> {
    public List<T> findAll();

    public T findById(String id);

    public void create(T t);

    public void update(T t);

    public void delete(T t);
}
