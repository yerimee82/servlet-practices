package guestbook.controller;

import guestbook.dao.GuestbookDao;
import guestbook.vo.GuestbookVo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GuestbookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("a");
        if ("deleteform".equals(action)) {
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
            rd.forward(req, resp);
        } else if ("delete".equals(action)) {
            String noStr = req.getParameter("no");
            String password = req.getParameter("password");

            if (noStr != null && password != null) {
                Long no = Long.parseLong(noStr);
                GuestbookDao dao = new GuestbookDao();

                boolean isDeleted = dao.delete(no, password);

                if (!isDeleted) {
                    resp.setContentType("text/html; charset=UTF-8");
                    resp.getWriter().println("<script>");
                    resp.getWriter().println("alert('비밀번호가 틀렸습니다.');");
                    resp.getWriter().println("history.back();");
                    resp.getWriter().println("</script>");
                    return;
                }
                resp.sendRedirect(req.getContextPath() + "/gb");
            }
        } else {
            List<GuestbookVo> guestbookList = GuestbookDao.findAll();
            req.setAttribute("guestbookList", guestbookList);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
            rd.forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("a");

        if ("add".equals(action)) {
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            String contents = req.getParameter("contents");

            if (name != null && password != null && contents != null) {
                GuestbookVo vo = new GuestbookVo();
                vo.setName(name);
                vo.setPassword(password);
                vo.setContents(contents);

                GuestbookDao dao = new GuestbookDao();
                dao.insert(vo);

                resp.sendRedirect(req.getContextPath() + "/gb");
            }
        } else {
            doGet(req, resp);
        }
    }
    @Override
    public void destroy() {
    }
}
