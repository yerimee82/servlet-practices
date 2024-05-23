<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
	String no = request.getParameter("no");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>방명록</title>
</head>
<body>
<form method="post" name="df" action="<%=request.getContextPath() %>/gb">
	<input type="hidden" name="a" value="delete">
	<input type="hidden" name="no" value="<%= no %>">
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" value=""></td>
			<td><input type="submit" value="확인"></td>
		</tr>
	</table>
</form>
<br><br>
<a href="<%=request.getContextPath()%>/gb">메인으로 돌아가기</a>
</body>
</html>
