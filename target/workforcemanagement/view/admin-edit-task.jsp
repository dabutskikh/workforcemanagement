<%@ page import="ru.workforcemanagement.model.Task" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit task</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <%Long taskId = Long.parseLong(request.getParameter("task-id"));%>
    <%Task task = DataAccess.getTaskDao().get(taskId);%>
    <form method="post" action="/profile/admin/tasks/edit?task-id=<%=task.getId()%>">
        <div class="container">
            <h1>Редактировать задачу</h1>
            <p>Пожалуйста, заполните эту форму, чтобы отредактировать задачу.</p>
            <hr>

            <label for="name"><b>Название</b></label>
            <input id="name" type="text" placeholder="Enter Name" name="name" value="<%=task.getName()%>" required>

            <label for="description"><b>Краткое описание</b></label>
            <input id="description" type="text" placeholder="Enter Description" name="description" value="<%=task.getDescription()%>" required>

            <label for="date-begin">Начало</label>
            <input id="date-begin" name="date-begin" type="datetime-local">

            <label for="date-end">Окончание</label>
            <input id="date-end" name="date-end" type="datetime-local">

            <label for="user-id">Исполнитель</label>
            <select id="user-id" name="user-id">
                <%for (User user : DataAccess.getUserDao().getAll()) {%>
                <option value="<%=user.getId()%>"><%=user.getSurname() + " " + user.getName()
                        + " " + user.getPatronymic()%></option>
                <%}%>
            </select>

            <hr>

            <button type="submit" class="registerbtn">Редактировать</button>
        </div>
    </form>
</body>
</html>
