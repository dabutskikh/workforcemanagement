package ru.workforcemanagement.model.dao;

import java.util.List;

public interface Dao<T> {
    T get(Long id);
    List<T> getAll();
    void add(T t);
    void update(Long id, T t);
    void delete(Long id);
}
