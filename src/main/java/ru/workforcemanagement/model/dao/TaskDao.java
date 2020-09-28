package ru.workforcemanagement.model.dao;

import ru.workforcemanagement.model.Task;

import java.util.List;

public interface TaskDao extends Dao<Task> {
    List<Task> getAllEmployeeTasks(Long employeeId);
}
