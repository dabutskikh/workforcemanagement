<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <form method="post" action="/sign-up">
        <div class="container">
            <h1>Вход</h1>
            <p>Пожалуйста, заполните эту форму, чтобы создать учетную запись</p>
            <hr>

            <label for="login"><b>Логин</b></label>
            <input id="login" type="text" placeholder="Enter Login" name="login" autocomplete="off" required>

            <label for="password"><b>Пароль</b></label>
            <input id="password" type="password" placeholder="Enter Password" name="password" required>

            <label for="confirm-password"><b>Повторите пароль</b></label>
            <input id="confirm-password" name="confirm-password" type="password" placeholder="Repeate password" required>

            <label for="surname"><b>Фамилия</b></label>
            <input id="surname" name="surname" type="text" placeholder="Enter Surname" autocomplete="off" required>

            <label for="name"><b>Имя</b></label>
            <input id="name" name="name" type="text" placeholder="Enter Name" autocomplete="off" required>

            <label for="patronymic"><b>Отчество</b></label>
            <input id="patronymic" name="patronymic" type="text" placeholder="Enter Patronymic" autocomplete="off" required>

            <label for="specialization"><b>Должность</b></label>
            <input id="specialization" name="specialization" type="text" placeholder="Enter Specialization" autocomplete="off" required>

            <hr>

            <button type="submit" class="registerbtn">Зарегистрироваться</button>
        </div>
    </form>
</body>
</html>
