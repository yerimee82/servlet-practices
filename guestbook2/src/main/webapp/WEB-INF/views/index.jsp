<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="guestbook.vo.GuestbookVo" %>
<%@ page import="guestbook.dao.GuestbookDao" %>
<%@ page import="java.util.List" %>
<%
	List<GuestbookVo> guestbookList = (List<GuestbookVo>) request.getAttribute("guestbookList");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>방명록</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/gb" method="post">
	<input type="hidden" name="a" value="add">
	<table border="1" width="500">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value=""></td>
			<td>비밀번호</td>
			<td><input type="password" name="password" value=""></td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="contents" cols="60" rows="5"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><input type="submit" value="확인"></td>
		</tr>
	</table>
</form>
<br>
<%
	int count = 1;
	for (GuestbookVo vo : guestbookList) { %>
<table width="510" border="1">
	<tr>
		<td>[<%= count++ %>]</td>
		<td><%= vo.getName() %></td>
		<td><%= vo.getRegDate() %></td>
		<td><a href="<%=request.getContextPath()%>/gb?a=deleteform&no=<%= vo.getNo() %>">삭제</a></td>
	</tr>
	<tr>
		<td colspan="4"><%= vo.getContents().replaceAll("\n", "<br>") %></td>
	</tr>
	<br>
	<% } %>
</table>
</body>
</html>
