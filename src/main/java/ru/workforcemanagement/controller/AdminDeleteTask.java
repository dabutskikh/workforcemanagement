package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminDeleteTask", urlPatterns = "/profile/admin/tasks/delete")
public class AdminDeleteTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long taskId = Long.parseLong(req.getParameter("task-id"));
        DataAccess.getTaskDao().delete(taskId);
        HttpSession session = req.getSession();
        Long userId = ((User) session.getAttribute("user")).getId();
        session.setAttribute("user", DataAccess.getUserDao().get(userId));
        resp.sendRedirect("/profile/admin/tasks");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
