package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AdminAddProfile", urlPatterns = "/profile/admin/profiles/add")
public class AdminAddProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../../../view/admin-add-profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String patronymic = req.getParameter("patronymic");
        Boolean isAdmin = Boolean.parseBoolean(req.getParameter("is-admin"));
        String specialization = req.getParameter("specialization");
        boolean isFreeLogin = true;
        for (User user : DataAccess.getUserDao().getAll()) {
            if (user.getLogin().equals(login)) {
                isFreeLogin = false;
                break;
            }
        }
        if (password.equals(confirmPassword) && isFreeLogin) {
            DataAccess.getUserDao().add(
                    new User(login, password, new Date(),
                            surname, name, patronymic,
                            isAdmin, specialization
                    )
            );

            resp.sendRedirect("/profile/admin/profiles");
        } else {
            resp.sendRedirect("/profile/admin/profiles/add");
        }
    }
}
