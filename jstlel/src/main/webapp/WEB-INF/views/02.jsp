<%@ page import="jstlel.UserVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    UserVo vo4 = new UserVo();
    vo4.setNo(4L);
    vo4.setName("둘리4");
    pageContext.setAttribute("vo", vo4);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>scope(객체의 존속 범위)</h4>
${vo.no} <br>
${vo.name} <br>

== request scope ====================<br>
${requestScope.vo.no} <br>
${requestScope.vo.name} <br>

== session scope =====================<br>
${applicationScope.vo.no} <br>
${applicationScope.vo.name} <br>


== application scope ====================<br>
${applicationScope.vo.no} <br>
${applicationScope.vo.name} <br>

</body>
</html>
