package ru.workforcemanagement.model.dao.implementation;

import org.hibernate.Session;
import ru.workforcemanagement.model.Task;
import ru.workforcemanagement.model.User;
import ru.workforcemanagement.model.dao.TaskDao;

import org.hibernate.query.Query;

import java.util.Comparator;
import java.util.List;

public class HibernateTaskDao implements TaskDao {

    SessionProvider sessionProvider = new SessionProvider();

    @Override
    public List<Task> getAllEmployeeTasks(Long employeeId) {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from Task where userId = :userId");
        List<Task> tasks = query.list();
        return null;
    }

    @Override
    public Task get(Long id) {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from Task where id = :id");
        query.setParameter("id", id);
        Task task = (Task) query.getSingleResult();
        sessionProvider.closeSessionWithTransaction();
        return task;
    }

    @Override
    public List<Task> getAll() {
        Session session = sessionProvider.openSessionWithTransaction();
        Query query = session.createQuery("from Task ");
        List<Task> taskList = query.list();
        taskList.sort(new Comparator<Task>() {
            @Override
            public int compare(Task o1, Task o2) {
                return o2.getDateBegin().compareTo(o1.getDateBegin());
            }
        });
        sessionProvider.closeSessionWithTransaction();
        return taskList;
    }

    @Override
    public void add(Task task) {
        Session session = sessionProvider.openSessionWithTransaction();
        session.persist(task);
        sessionProvider.closeSessionWithTransaction();
    }

    @Override
    public void update(Long id, Task task) {
        Session session = sessionProvider.openSessionWithTransaction();

        Query query = session.createQuery("from Task where id = :id");
        query.setParameter("id", id);
        Task curTask = (Task) query.getSingleResult();
        curTask.setName(task.getName());
        curTask.setDescription(task.getDescription());
        curTask.setDateBegin(task.getDateBegin());
        curTask.setDateEnd(task.getDateEnd());
        curTask.setUserId(task.getUserId());

        sessionProvider.closeSessionWithTransaction();
    }

    @Override
    public void delete(Long id) {
        Session session = sessionProvider.openSessionWithTransaction();
        System.out.println(id);
        Query query = session.createQuery("delete from Task where id = :id");
        query.setParameter("id", id).executeUpdate();
        sessionProvider.closeSessionWithTransaction();
    }
}
