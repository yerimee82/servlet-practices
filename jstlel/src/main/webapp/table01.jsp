<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String row = request.getParameter("r");
    String col = request.getParameter("c");

    int nRow = Integer.parseInt(row);
    int nCol = Integer.parseInt(col);


%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<table border="1" cellspacing="0">
    <%
        for(int i = 0; i < nRow; i++) {
    %>
    <tr>
        <%
            for(int j = 0; j < nCol; j++) {
        %>
        <td>Cell(<%=i %>, <%=j %>)</td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>