<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <form method="post" action="/sign-in">
        <div class="container">
            <h1>Вход</h1>
            <p>Пожалуйста, заполните эту форму, чтобы войти в систему</p>
            <hr>

            <label for="login"><b>Логин</b></label>
            <input id="login" type="text" placeholder="Enter Login" name="login" required>

            <label for="password"><b>Пароль</b></label>
            <input id="password" type="password" placeholder="Enter Password" name="password" required>

            <hr>

            <button type="submit" class="registerbtn">Войти</button>
        </div>

        <div class="container sub">
            <p><a href="/sign-up">Зарегистрироваться</a></p>
        </div>
    </form>
</body>
</html>
