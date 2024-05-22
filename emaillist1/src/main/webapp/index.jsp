<%@ page import="emaillist.dao.EmailListDao" %>
<%@ page import="emaillist.vo.EmailListVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
	List< EmailListVo> list = EmailListDao.findAll();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메일 리스트에 가입되었습니다.</h1>
	<p>입력한 정보 내역입니다.</p>
	<%
		for (EmailListVo vo : list) {
	%>
	<!-- 메일정보 리스트 -->
	<table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<td align=right>First name: </td>
			<td><%=vo.getFirstName() %></td>
		</tr>
		<tr>
			<td align=right width="110">Last name: </td>
			<td width="110"><%=vo.getLastName() %></td>
		</tr>
		<tr>
			<td align=right>Email address: </td>
			<td><%=vo.getEmail() %></td>
		</tr>
	</table>
	<br>
	<%
		}
	%>
	<p>
		<a href="form.jsp">추가메일 등록</a>
	</p>
	<br>
</body>
</html>