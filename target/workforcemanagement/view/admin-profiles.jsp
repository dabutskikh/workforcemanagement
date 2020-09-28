<%@ page import="ru.workforcemanagement.model.User" %>
<%@ page import="ru.workforcemanagement.controller.DataAccess" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All profiles</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <%SimpleDateFormat formater = new SimpleDateFormat("dd.MM.yyyy HH:mm");%>
    <div class="container">
        <h1>Список сотрудников</h1>
        <a class="a-add" href="/profile/admin/profiles/add">Создать профиль</a>
        <table>
            <th>№</th>
            <th>Логин</th>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Отчество</th>
            <th>Должность</th>
            <th>Админ</th>
            <th>Дата регистрации</th>
            <th>Действия</th>
            <%for (User user : DataAccess.getUserDao().getAll()) {%>
            <tr>
                <td><%=user.getId()%></td>
                <td><%=user.getLogin()%></td>
                <td><%=user.getSurname()%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getPatronymic()%></td>
                <td><%=user.getSpecialization()%></td>
                <td><%=(user.getAdmin()) ? "+" : ""%></td>
                <td><%=formater.format(user.getDateBegin())%></td>
                <td>
                    <a href="/profile/admin/profiles/edit?user-id=<%=user.getId()%>">Редактировать</a><br>
                    <a href="/profile/admin/profiles/delete?user-id=<%=user.getId()%>">Удалить</a><br>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</body>
</html>
