<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="guestbook.dao.GuestbookDao" %>
<%
    String noStr = request.getParameter("no");
    String password = request.getParameter("password");

    if (noStr != null && password != null) {
        Long no = Long.parseLong(noStr);
        GuestbookDao dao = new GuestbookDao();

        boolean isDeleted = dao.delete(no, password);

        if (!isDeleted) {
%>
<script>
    alert('비밀번호가 틀렸습니다.');
    history.back();
</script>
<%
            return;
        }
        response.sendRedirect("/guestbook1");
    }
%>
