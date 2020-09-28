package ru.workforcemanagement.model.dao.implementation;

import org.hibernate.Session;
import org.hibernate.query.Query;
import ru.workforcemanagement.model.User;
import ru.workforcemanagement.model.dao.UserDao;

import java.util.Comparator;
import java.util.List;

public class HibernateUserDao implements UserDao {

    SessionProvider sessionProvider = new SessionProvider();

    @Override
    public User get(Long id) {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from User where id = :id");
        query.setParameter("id", id);
        User user = (User) query.getSingleResult();
        sessionProvider.closeSessionWithTransaction();
        return user;
    }

    @Override
    public List<User> getAll() {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from User");
        List<User> userList = query.list();
        userList.sort(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getId().compareTo(o2.getId());
            }
        });
        sessionProvider.closeSessionWithTransaction();
        return userList;
    }

    @Override
    public void add(User user) {
        Session session = sessionProvider.openSessionWithTransaction();
        session.persist(user);
        sessionProvider.closeSessionWithTransaction();
    }

    @Override
    public void update(Long id, User user) {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from User where id = :id");
        query.setParameter("id", id);
        User curUser = (User) query.getSingleResult();
        curUser.setLogin(user.getLogin());
        curUser.setSurname(user.getSurname());
        curUser.setName(user.getName());
        curUser.setPatronymic(user.getPatronymic());
        curUser.setPassword(user.getPassword());
        curUser.setAdmin(user.getAdmin());
        curUser.setSpecialization(user.getSpecialization());

        sessionProvider.closeSessionWithTransaction();
    }

    @Override
    public void delete(Long id) {
        Session session = sessionProvider.openSessionWithTransaction();
        session.createQuery("delete from Task where userId = :userId")
                .setParameter("userId", id)
                .executeUpdate();
        session.createQuery("delete from User where id = :id")
                .setParameter("id", id)
                .executeUpdate();
        sessionProvider.closeSessionWithTransaction();
    }
}
