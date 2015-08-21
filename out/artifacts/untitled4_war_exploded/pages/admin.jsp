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
                <c:url var="tasksUrl" value="/tasks" />
                <c:if test="${currentUser.unit.id eq 1}">
                    <a class="mdl-navigation__link" href="${tasksUrl}">Task list</a>
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

            <c:url var="unitManUrl" value="/admin/units" />
            <c:url var="userManUrl" value="/admin/users" />
            <c:url var="statusManUrl" value="/admin/statuses" />
            <c:url var="taskManUrl" value="/admin/tasks" />

            <a class="mdl-navigation__link" href="${unitManUrl}">Units management</a>
            <a class="mdl-navigation__link" href="${userManUrl}">Users management</a>
            <a class="mdl-navigation__link" href="${statusManUrl}">Statuses management</a>
            <a class="mdl-navigation__link" href="${taskManUrl}">Tasks management</a>

        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--1-col"></div>
                <div align="center" class="mdl-cell mdl-cell--10-col">
                    <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                        <thead></thead>
                        <tbody>
                        <c:forEach items="${itemsList}" var="item">
                            <tr>
                                <td>${item}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div align="center" class="mdl-cell mdl-cell--1-col"></div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
