package ru.workforcemanagement.controller;

import ru.workforcemanagement.model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResp = (HttpServletResponse) servletResponse;
        HttpSession session = httpReq.getSession();
        Object objUser = session.getAttribute("user");
        if (objUser != null && ((User) objUser).getAdmin()) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            httpResp.sendRedirect("/sign-in");
        }
    }

    @Override
    public void destroy() {

    }
}
