<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit profile</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile/admin/profiles" class="back">←</a>
    <%Long userId = Long.parseLong(request.getParameter("user-id"));%>
    <%User user = DataAccess.getUserDao().get(userId);%>
    <form method="post" action="/profile/admin/profiles/edit?user-id=<%=user.getId()%>">
        <div class="container">
            <h1>Редактирование учетной записи</h1>
            <p>Пожалуйста, заполните эту форму, чтобы отредактировать учетную запись</p>
            <hr>

            <label for="login"><b>Логин</b></label>
            <input id="login" type="text" placeholder="Enter Login" name="login" value="<%=user.getLogin()%>" autocomplete="off" required>

            <label for="surname"><b>Фамилия</b></label>
            <input id="surname" name="surname" type="text" placeholder="Enter Surname" value="<%=user.getSurname()%>" autocomplete="off" required>

            <label for="name"><b>Имя</b></label>
            <input id="name" name="name" type="text" placeholder="Enter Name" value="<%=user.getName()%>" autocomplete="off" required>

            <label for="patronymic"><b>Отчество</b></label>
            <input id="patronymic" name="patronymic" type="text" placeholder="Enter Patronymic" value="<%=user.getPatronymic()%>" autocomplete="off" required>

            <label for="specialization"><b>Должность</b></label>
            <input id="specialization" name="specialization" type="text" placeholder="Enter Specialization" value="<%=user.getSpecialization()%>" autocomplete="off" required>

            <input name="is-admin" type="checkbox" value="true" <%=(user.getAdmin()) ? "checked" : ""%>>is Admin

            <hr>

            <button type="submit" class="registerbtn">Редактировать</button>
        </div>
        <div class="container sub">
            <p><a href="/profile/admin/profiles/edit/password?user-id=<%=user.getId()%>">Сменить пароль</a></p>
        </div>
    </form>
</body>
</html>
