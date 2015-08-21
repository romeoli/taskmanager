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
                    <c:set value="${taskItem}" var="task" />
                    <table class="mdl-data-table">
                        <tr>
                            <td>Status:</td>
                            <td>${task.status.status}</td>
                        </tr>
                        <tbody>
                        <tr>
                            <td>ID:</td>
                            <td>${task.id}</td>
                        </tr>
                        <tr>
                            <td>Short:</td>
                            <td>${task.description}</td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td>${task.longDescription}</td>
                        </tr>
                        <tr>
                            <td>Deadline:</td>
                            <td>${task.deadlineDate}</td>
                        </tr>
                        <tr>
                            <td>Created:</td>
                            <td>${task.creator.username} on ${task.creationDate}</td>
                        </tr>
                        <tr>
                            <td>Assigned to:</td>
                            <td>${task.performerUnit.name}</td>
                        </tr>
                        </tbody>


                    </table>

                    <c:if test="${taskItem.performer.username ne currentUser.username}">
                        <c:if test="${taskItem.performerUnit.name eq currentUser.unit.name}">
                            <c:url var="takeTaskUrl" value="/take_task?id=${task.id}" />
                            <a class="mdl-button mdl-js-button mdl-button--primary" href="${takeTaskUrl}">take</a>
                        </c:if>
                    </c:if>

                    <c:if test="${task.performer.username eq currentUser.username}">
                        <c:url var="rejectTaskUrl" value="/reject_task?id=${task.id}" />
                        <c:url var="completeTaskUrl" value="/complete_task?id=${task.id}" />
                        <c:if test="${task.status.status eq 'in work'}">
                            <a class="mdl-button mdl-js-button mdl-button--primary" href="${rejectTaskUrl}">reject</a>
                            <a class="mdl-button mdl-js-button mdl-button--primary" href="${completeTaskUrl}">complete</a>
                        </c:if>
                    </c:if>

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
