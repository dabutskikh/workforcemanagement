<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add task</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile/admin/tasks" class="back">←</a>
    <form method="post" action="/profile/admin/tasks/add">
        <div class="container">
            <h1>Создание задачи</h1>
            <p>Пожалуйста, заполните эту форму, чтобы создать задачу</p>
            <hr>

            <label for="name"><b>Название</b></label>
            <input id="name" type="text" placeholder="Enter Name" name="name" autocomplete="off" required>

            <label for="description"><b>Краткое описание</b></label>
            <input id="description" type="text" placeholder="Enter Description" name="description" autocomplete="off" required>

            <label for="date-begin">Начало</label>
            <input id="date-begin" name="date-begin" type="datetime-local" required>

            <label for="date-end">Окончание</label>
            <input id="date-end" name="date-end" type="datetime-local" required>

            <label for="user-id">Исполнитель</label>
            <select id="user-id" name="user-id">
                <%for (User user : DataAccess.getUserDao().getAll()) {%>
                <option value="<%=user.getId()%>"><%=user.getSurname() + " " + user.getName()
                        + " " + user.getPatronymic()%></option>
                <%}%>
            </select>

            <hr>

            <button type="submit" class="registerbtn">Добавить</button>
        </div>
    </form>
</body>
</html>
