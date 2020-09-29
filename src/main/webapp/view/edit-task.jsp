<%@ page import="ru.workforcemanagement.model.Task" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit task</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile/tasks" class="back">←</a>
    <%Long taskId = Long.parseLong(request.getParameter("task-id"));%>
    <%Task task = DataAccess.getTaskDao().get(taskId);%>
    <form method="post" action="/profile/tasks/edit?task-id=<%=task.getId()%>">
        <div class="container">
            <h1>Редактирование задачи</h1>
            <p>Пожалуйста, заполните эту форму, чтобы отредактировать задачу</p>
            <hr>

            <label for="name"><b>Название</b></label>
            <input id="name" type="text" placeholder="Enter Name" name="name" value="<%=task.getName()%>" autocomplete="off" required>

            <label for="description"><b>Краткое описание</b></label>
            <input id="description" type="text" placeholder="Enter Description" name="description" value="<%=task.getDescription()%>" autocomplete="off" required>

            <label for="date-begin">Начало</label>
            <input id="date-begin" name="date-begin" type="datetime-local" required>

            <label for="date-end">Окончание</label>
            <input id="date-end" name="date-end" type="datetime-local" required>

            <hr>

            <button type="submit" class="registerbtn">Редактировать</button>
        </div>
    </form>
</body>
</html>
