<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit password</title>
    <style>
        <%@ include file="../resources/css/style.css"%>
    </style>
</head>
<body>
    <a href="/profile/edit" class="back">←</a>
    <form method="post" action="/profile/edit/password">
        <div class="container">
            <h1>Смена пароля</h1>
            <p>Пожалуйста, заполните эту форму, чтобы сменить пароль</p>
            <hr>

            <label for="password"><b>Новый пароль</b></label>
            <input id="password" type="password" placeholder="Enter Password" name="password" required>

            <label for="confirm-password"><b>Новый пароль</b></label>
            <input id="confirm-password" type="password" placeholder="Repeat Password" name="confirm-password" required>

            <hr>

            <button type="submit" class="registerbtn">Сменить пароль</button>
        </div>
    </form>
</body>
</html>
