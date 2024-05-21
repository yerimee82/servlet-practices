<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String birthYear = request.getParameter("birthYear");
    String gender = request.getParameter("gender");
    String profile = request.getParameter("profile");
    String[] hobbies = request.getParameterValues("hobby");
%>
<html>
<head>
    <title>Title</title>
</head>
    <body>
    <%=email%>
    <br>
    <%=password%>
    <br>
    <%=birthYear%>
    <br>
    <%=gender%>
    <br>
    <p>
        <%=profile%>
    </p>
    <%
        for(String hobby: hobbies) {
    %>
    <span><%=hobby%></span>
    <%
        }
    %>
</body>
</html>
