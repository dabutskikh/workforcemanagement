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

@WebServlet(name = "AdminEditProfile", urlPatterns = "/profile/admin/profiles/edit")
public class AdminEditProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../../../view/admin-edit-profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = DataAccess.getUserDao().get(Long.parseLong(req.getParameter("user-id")));
        String oldLogin = user.getLogin();
        String login = req.getParameter("login");
        String password = user.getPassword();
        Date dateBegin = user.getDateBegin();
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String patronymic = req.getParameter("patronymic");
        Boolean isAdmin = Boolean.parseBoolean(req.getParameter("is-admin"));
        String specialization = req.getParameter("specialization");
        boolean isFreeLogin = true;
        if (!oldLogin.equals(login)) {
            for (User temp : DataAccess.getUserDao().getAll()) {
                if (temp.getLogin().equals(login)) {
                    isFreeLogin = false;
                    break;
                }
            }
        }
        if (isFreeLogin) {
            DataAccess.getUserDao().update(user.getId(),
                    new User(login, password, dateBegin,
                            surname, name, patronymic,
                            isAdmin, specialization
                    )
            );
            HttpSession session = req.getSession();
            Long userId = ((User) session.getAttribute("user")).getId();
            session.setAttribute("user", DataAccess.getUserDao().get(userId));
            resp.sendRedirect("/profile/admin/profiles");
        } else {
            resp.sendRedirect("/profile/admin/profiles/edit?user-id=" + user.getId());
        }
    }
}
