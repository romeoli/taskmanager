<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>

    <title></title>
</head>
<body>
hello
<c:set var="us" value="${user}" />
<table border="1">
    <thead>
    <tr>
        <td>info</td>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>${us.username}</td>
        <td>${us.password}</td>
        <td>${us.unit.name}</td>


    </tr>

    </tbody>
</table>



<br>
<a href="/login">log in</a>

</body>
</html>
