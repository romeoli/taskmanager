<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.indigo-orange.min.css"/>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <title>Task Manager</title>
</head>
<body>

<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Add new task</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <c:url var="logoutUrl" value="/logout"/>
                <c:url var="adminUrl" value="/admin"/>

                <a class="mdl-navigation__link" href="${logoutUrl}">Logout [<sec:authentication property="principal.username" />]</a>
            </nav>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Title</span>
        <nav class="mdl-navigation">
            <c:url var="tasksUrl" value="/tasks" />
            <a class="mdl-navigation__link" href="${tasksUrl}">My tasks</a>
            <a class="mdl-navigation__link" href="">My Unit tasks</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <c:url value="/newtask" var="newTaskUrl" />
            <form action="${newTaskUrl}" method="post">

                <div style="width: 400px;
                            margin: auto">
                    <h5 style="color: #1a237e">Input description:</h5>
                    <div class="mdl-textfield mdl-js-textfield textfield-demo">
                        <input class="mdl-textfield__input" type="text" id="dscr" required name="description"/>
                        <label class="mdl-textfield__label" for="dscr">Short description</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield textfield-demo">
                        <textarea class="mdl-textfield__input" rows="5" id="full_dscr" name="long_dscr"></textarea>
                        <label class="mdl-textfield__label" for="full_dscr">Description (optional)</label>
                    </div>
                    <h5 style="color: #1a237e">Select Unit:</h5>
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
                    <h5 style="color: #1a237e">Define deadline:</h5>

                    <div class="mdl-textfield mdl-js-textfield textfield-demo">
                        <input class="mdl-textfield__input" type="date" id="date" name="deadline" placeholder=""/>
                        <label class="mdl-textfield__label" for="date"></label>
                    </div>
                    <br>
                    <button class="mdl-button mdl-js-button mdl-button--primary" type="submit">Add task</button>
                </div>






            </form>

        </div>
    </main>
</div>

</body>
</html>
