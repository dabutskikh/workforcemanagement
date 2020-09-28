package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "EditPassword", urlPatterns = "/profile/edit/password")
public class EditPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../../view/edit-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");
        if (confirmPassword.equals(password)) {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            String login = user.getLogin();
            Date dateBegin = user.getDateBegin();
            String surname = user.getSurname();
            String name = user.getName();
            String patronymic = user.getPatronymic();
            Boolean isAdmin = false;
            String specialization = user.getSpecialization();
            DataAccess.getUserDao().update(user.getId(),
                    new User(login, password, dateBegin,
                            surname, name, patronymic,
                            isAdmin, specialization
                    )
            );
            session.setAttribute("user", DataAccess.getUserDao().get(user.getId()));
            resp.sendRedirect("/profile");
        } else {
            resp.sendRedirect("/profile/edit/password");
        }
    }
}
