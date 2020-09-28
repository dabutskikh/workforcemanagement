<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit profile</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile" class="back">←</a>
    <%User user = (User) session.getAttribute("user");%>
    <form method="post" action="/profile/edit">
        <div class="container">
            <h1>Редактирование учетной записи</h1>
            <p>Пожалуйста, заполните эту форму, чтобы отредактировать учетную запись</p>
            <hr>

            <label for="login"><b>Логин</b></label>
            <input id="login" type="text" placeholder="Enter Login" name="login" value="<%=user.getLogin()%>" required>

            <label for="surname"><b>Фамилия</b></label>
            <input id="surname" name="surname" type="text" placeholder="Enter Surname" value="<%=user.getSurname()%>" required>

            <label for="name"><b>Имя</b></label>
            <input id="name" name="name" type="text" placeholder="Enter Name" value="<%=user.getName()%>" required>

            <label for="patronymic"><b>Отчество</b></label>
            <input id="patronymic" name="patronymic" type="text" placeholder="Enter Patronymic" value="<%=user.getPatronymic()%>" required>

            <label for="specialization"><b>Должность</b></label>
            <input id="specialization" name="specialization" type="text" placeholder="Enter Specialization" value="<%=user.getSpecialization()%>" required>

            <hr>

            <button type="submit" class="registerbtn">Редактировать</button>
        </div>
        <div class="container sub">
            <p><a href="/profile/edit/password">Сменить пароль</a></p>
        </div>
    </form>
</body>
</html>
