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
            <span class="mdl-layout-title">Task list</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <c:url var="adminUrl" value="/admin"/>
                <c:if test="${currentUser.unit.id eq 1}">
                    <a class="mdl-navigation__link" href="${adminUrl}">Admin console</a>
                </c:if>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                  mdl-textfield--floating-label mdl-textfield--align-right">
                    <label class="mdl-button mdl-js-button mdl-button--icon"
                           for="fixed-header-drawer-exp">
                        <i class="material-icons">search</i>
                    </label>
                    <div class="mdl-textfield__expandable-holder">
                        <input class="mdl-textfield__input" type="text" name="sample"
                               id="fixed-header-drawer-exp" />
                    </div>
                </div>

                <c:url var="logoutUrl" value="/logout"/>


                <a class="mdl-navigation__link" href="${logoutUrl}">Logout [<sec:authentication property="principal.username" />]</a>
            </nav>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Task Manager</span>
        <nav class="mdl-navigation">
            <c:url var="tasksUrl" value="/tasks" />
            <c:url var="unitTasksUrl" value="/unit_tasks" />
            <a class="mdl-navigation__link" href="${tasksUrl}">My tasks</a>
            <a class="mdl-navigation__link" href="${unitTasksUrl}">My Unit tasks</a>

        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--1-col"></div>
                <div align="center" class="mdl-cell mdl-cell--10-col">

                        <form action="${tasksUrl}">
                            <div class="mdl-textfield mdl-js-textfield textfield-demo">
                                <select class="mdl-textfield__input" name="status" id="sel">
                                    <c:forEach items="${statusList}" var="status">
                                        <option value="${status.status}">${status.status}</option>
                                    </c:forEach>
                                </select>
                                <label class="mdl-textfield__label" for="sel"></label>
                            </div>
                            <button class="mdl-button mdl-js-button mdl-button--primary" type="submit">show</button>
                        </form>

                    <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                        <thead>
                        <tr>
                            <th class="mdl-data-table__cell--non-numeric">Description</th>
                            <th class="mdl-data-table__cell--non-numeric">Deadline</th>
                            <th class="mdl-data-table__cell--non-numeric">Status</th>
                            <th class="mdl-data-table__cell--non-numeric">Created by</th>
                            <th class="mdl-data-table__cell--non-numeric">Created</th>
                            <th class="mdl-data-table__cell--non-numeric">Assigned to</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${taskList}" var="task">
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric">
                                    <a href="/task?id=${task.id}">${task.description}</a>
                                </td>
                                <td>${task.deadlineDate}</td>
                                <td class="mdl-data-table__cell--non-numeric">${task.status.status}</td>
                                <td class="mdl-data-table__cell--non-numeric">${task.creator.username}</td>
                                <td>${task.creationDate}</td>
                                <td class="mdl-data-table__cell--non-numeric">
                                        ${task.performerUnit.name}
                                    <c:if test="${(task.performerUnit ne null) and (task.performer ne null)}">
                                        ,
                                    </c:if>
                                        ${task.performer.username}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div align="center" class="mdl-cell mdl-cell--1-col">
                    <c:url var="addNewUrl" value="/addtask" />
                    <a href="${addNewUrl}" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                        <i class="material-icons">add</i>
                    </a>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
