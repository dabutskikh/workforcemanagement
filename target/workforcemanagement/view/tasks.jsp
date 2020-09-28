<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="ru.workforcemanagement.model.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tasks</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile" class="back">←</a>
    <%SimpleDateFormat formater = new SimpleDateFormat("dd.MM.yyyy HH:mm");%>
    <div class="container">
        <h1>Задачи</h1>
        <a href="/profile/tasks/add" class="a-add">Добавить задачу</a>
        <table>
            <th>№</th>
            <th>Название</th>
            <th>Краткое описание</th>
            <th>Начало</th>
            <th>Окончание</th>
            <th>Действия</th>
            <%User user = (User) session.getAttribute("user");%>
            <%for (Task task : user.getTasks()) {%>
            <tr>
                <td><%=task.getId()%></td>
                <td><%=task.getName()%></td>
                <td><%=task.getDescription()%></td>
                <td><%=formater.format(task.getDateBegin())%></td>
                <td><%=formater.format(task.getDateEnd())%></td>
                <td>
                    <%if (task.getDateBegin().after(new Date())) {%>
                    <a href="/profile/tasks/edit?task-id=<%=task.getId()%>">Редактировать</a><br>
                    <%}%>
                    <a href="/profile/tasks/delete?task-id=<%=task.getId()%>">Удалить</a><br>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</body>
</html>
