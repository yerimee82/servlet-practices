<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${param.color == 'red'}">
        <h1 style="color: #ff0000">Hello World</h1>
    </c:when>
    <c:when test="${param.color == 'green'}">
        <h1 style="color: #00ff00">Hello World</h1>
    </c:when>
    <c:when test="${param.color == 'blue'}">
        <h1 style="color: #0000ff">Hello World</h1>
    </c:when>
    <c:otherwise>
        <h1 style="color: #000000">Hello World</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
