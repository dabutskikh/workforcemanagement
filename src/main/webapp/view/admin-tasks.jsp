<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="ru.workforcemanagement.model.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All tasks</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile/admin" class="back">←</a>
    <%SimpleDateFormat formater = new SimpleDateFormat("dd.MM.yyyy HH:mm");%>
    <div class="container">
        <h1>Задачи</h1>
        <a class="a-add" href="/profile/admin/tasks/add">Создать задачу</a>
        <table>
            <th>№</th>
            <th>Исполнитель</th>
            <th>Название</th>
            <th>Краткое описание</th>
            <th>Начало</th>
            <th>Окончание</th>
            <th>Действия</th>
            <%for (Task task : DataAccess.getTaskDao().getAll()) {%>
            <%User user = DataAccess.getUserDao().get(task.getUserId());%>
            <tr>
                <td><%=task.getId()%></td>
                <td><%=user.getSurname() + " " + user.getName().charAt(0) + "." + user.getPatronymic().charAt(0)
                        + "., " + user.getSpecialization()%></td>
                <td><%=task.getName()%></td>
                <td><%=task.getDescription()%></td>
                <td><%=formater.format(task.getDateBegin())%></td>
                <td><%=formater.format(task.getDateEnd())%></td>
                <td>
                    <%if (task.getDateBegin().after(new Date())) {%>
                    <a href="/profile/admin/tasks/edit?task-id=<%=task.getId()%>">Редактировать</a><br>
                    <%}%>
                    <a href="/profile/admin/tasks/delete?task-id=<%=task.getId()%>">Удалить</a><br>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</body>
</html>
