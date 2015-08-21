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
        margin: auto">
    <h5>Registration form</h5>

    <c:url value="/adduser" var="addUserUrl" />
    <form action="${addUserUrl}" method="post">
        <div class="mdl-textfield mdl-js-textfield textfield-demo">
            <input class="mdl-textfield__input" type="text" name="name" id="name" required>
            <label class="mdl-textfield__label" for="name">username</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield textfield-demo">
            <input class="mdl-textfield__input" type="password" name="pass" id="pass" required>
            <label class="mdl-textfield__label" for="pass">password</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield textfield-demo">
            <select class="mdl-textfield__input" name="unit" id="sel" required>
                <option selected disabled>Select unit</option>
                <c:forEach items="${unitList}" var="unit">
                    <c:if test="${unit.id ne 1}">
                        <option value="${unit.id}">${unit.name}</option>
                    </c:if>
                </c:forEach>
            </select>
            <label class="mdl-textfield__label" for="sel">Select unit</label>
        </div>
        <button class="mdl-button mdl-js-button mdl-button--primary" type="submit">register</button>
    </form>
</div>
</body>
</html>
