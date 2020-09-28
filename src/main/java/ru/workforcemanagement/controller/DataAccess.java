package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.dao.DaoFactory;
import ru.workforcemanagement.model.dao.TaskDao;
import ru.workforcemanagement.model.dao.UserDao;
import ru.workforcemanagement.model.dao.implementation.HibernateDaoFactory;

public class DataAccess {

    private static final DaoFactory DAO_FACTORY = new HibernateDaoFactory();

    private static final UserDao USER_DAO = DAO_FACTORY.createUserDao();

    private static final TaskDao TASK_DAO = DAO_FACTORY.createTaskDao();

    public static UserDao getUserDao() {
        return USER_DAO;
    }

    public static TaskDao getTaskDao() {
        return TASK_DAO;
    }
}
