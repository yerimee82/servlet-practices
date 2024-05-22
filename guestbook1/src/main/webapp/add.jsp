<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="guestbook.vo.GuestbookVo" %>
<%@ page import="guestbook.dao.GuestbookDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  String name = request.getParameter("name");
  String password = request.getParameter("password");
  String contents = request.getParameter("contents");

  if (name != null && password != null && contents != null) {
    GuestbookVo vo = new GuestbookVo();
    vo.setName(name);
    vo.setPassword(password);
    vo.setContents(contents);

    GuestbookDao dao = new GuestbookDao();
    dao.insert(vo);

    // 글 등록 후 메인 페이지로 리다이렉트
    response.sendRedirect("/guestbook1");
  }
%>