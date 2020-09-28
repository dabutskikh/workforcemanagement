package ru.workforcemanagement.model.dao;

public interface DaoFactory {
    UserDao createUserDao();
    TaskDao createTaskDao();
}
