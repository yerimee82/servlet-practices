<%@ page import="emaillist.dao.EmailListDao" %>
<%@ page import="emaillist.vo.EmailListVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String firstName = request.getParameter("fn");
    String lastName =  request.getParameter("ln");
    String email =  request.getParameter("email");

    EmailListVo vo = new EmailListVo();
    vo.setFirstName(firstName);
    vo.setLastName(lastName);
    vo.setEmail(email);

    new EmailListDao().insert(vo);

    response.sendRedirect("/emaillist1");
%>
