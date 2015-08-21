
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.indigo-orange.min.css" />
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <title>Task Manager</title>
</head>
<body>
<div style="
        width: 300px;
        margin: auto

        ">
    <h5>Please sign in:</h5>
    <c:url value="/j_spring_security_check" var="loginUrl" />
    <c:url value="/register" var="registerUrl" />
    <form action="${loginUrl}" method="post">
        <div class="mdl-grid mdl-grid--no-spacing">
            <div class="mdl-cell mdl-cell--6-col">
                <div class="mdl-textfield mdl-js-textfield textfield-demo">
                    <input class="mdl-textfield__input" type="text" name="j_username" id="name">
                    <label class="mdl-textfield__label" for="name">username</label>
                </div>
            </div>
            <div class="mdl-cell mdl-cell--6-col">
                <div class="mdl-textfield mdl-js-textfield textfield-demo">
                    <input class="mdl-textfield__input" type="password" name="j_password" id="pass">
                    <label class="mdl-textfield__label" for="pass">password</label>
                </div>
            </div>

        </div>
        <div class="mdl-grid mdl-grid--no-spacing">
            <div align="right" class="mdl-cell mdl-cell--5-col">
                <button class="mdl-button mdl-js-button mdl-button--primary" type="submit">Log in</button>
            </div>
            <div align="center" class="mdl-cell mdl-cell--2-col mdl-cell--middle">
                or
            </div>
            <div align="left" class="mdl-cell mdl-cell--5-col">
                <a class="mdl-button mdl-js-button mdl-button--primary" href="${registerUrl}">register</a>
            </div>
        </div>

    </form>
</div>
</body>
</html>
