package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminDeleteProfile", urlPatterns = "/profile/admin/profiles/delete")
public class AdminDeleteProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long userId = Long.parseLong(req.getParameter("user-id"));
        DataAccess.getUserDao().delete(userId);
        HttpSession session = req.getSession();
        Long curUserId = ((User) session.getAttribute("user")).getId();
        session.setAttribute("user", DataAccess.getUserDao().get(curUserId));
        resp.sendRedirect("/profile/admin/profiles");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
