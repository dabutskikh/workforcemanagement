<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <%SimpleDateFormat formater = new SimpleDateFormat("dd.MM.yyyy HH:mm");%>
    <div class="container">
        <%User user = (User) session.getAttribute("user");%>
        <h1>Профиль</h1>
        <div class="menu">
            <a class="menu-item" href="/profile/edit">Редактировать профиль</a>
            <a class="menu-item" href="/profile/tasks">Задачи</a>
            <%if (user.getAdmin()) {%>
            <a class="menu-item" href="/profile/admin">Профиль администратора</a>
            <%}%>
            <a class="menu-item" href="/profile/logout">Выйти</a>
        </div>
<%--        <hr>--%>
        <%if (user.getAdmin()) {%>
        <h2>Администратор</h2>
        <%}%>
        <h2>Логин: <%=user.getLogin()%></h2>
        <h2>ФИО: <%=user.getSurname() + " " + user.getName() + " " + user.getPatronymic()%></h2>
        <h2>Должность: <%=user.getSpecialization()%></h2>
        <h2>Дата регистрации: <%=formater.format(user.getDateBegin())%></h2>
    </div>
</body>
</html>
