package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.Task;
import ru.workforcemanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AdminEditTask", urlPatterns = "/profile/admin/tasks/edit")
public class AdminEditTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../../../view/admin-edit-task.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date dateNow = null;
        Date dateBegin = null;
        Date dateEnd = null;
        try {
            dateNow = formatter.parse(formatter.format(new Date()));
            dateBegin = formatter.parse(req.getParameter("date-begin"));
            dateEnd = formatter.parse(req.getParameter("date-end"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Long taskId = Long.parseLong(req.getParameter("task-id"));
        if ((dateBegin.equals(dateNow) || dateBegin.after(dateNow)) && dateEnd.after(dateBegin) &&
                req.getParameter("user-id") != null
        ) {
            Long userId = Long.parseLong(req.getParameter("user-id"));
            Task task = new Task(name, description, dateBegin, dateEnd);
            task.setUserId(userId);
            DataAccess.getTaskDao().update(taskId, task);
            HttpSession session = req.getSession();
            Long curUserId = ((User) session.getAttribute("user")).getId();
            session.setAttribute("user", DataAccess.getUserDao().get(curUserId));
            resp.sendRedirect("/profile/admin/tasks");
        } else {
            resp.sendRedirect("/profile/admin/tasks/edit?task-id=" + taskId);
        }
    }
}
