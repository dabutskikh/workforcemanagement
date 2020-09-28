package ru.workforcemanagement.model.dao.implementation;

import ru.workforcemanagement.model.dao.DaoFactory;
import ru.workforcemanagement.model.dao.TaskDao;
import ru.workforcemanagement.model.dao.UserDao;

public class HibernateDaoFactory implements DaoFactory {
    @Override
    public UserDao createUserDao() {
        System.out.println("created user dao");
        return new HibernateUserDao();
    }

    @Override
    public TaskDao createTaskDao() {
        return new HibernateTaskDao();
    }
}
