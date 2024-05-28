<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    pageContext.setAttribute("newline", "\n");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>JSTL Test: forEach</h1>
<c:set var="count" value="${fn:length(list)}"/>
<c:forEach items="${list}" var="vo" varStatus="status">
  <h4>${vo.no} : ${vo.name}</h4>
</c:forEach>
</body>
</html>
