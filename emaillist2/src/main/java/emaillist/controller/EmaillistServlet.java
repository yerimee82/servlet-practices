package emaillist.controller;

import emaillist.dao.EmailListDao;
import emaillist.vo.EmailListVo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmaillistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a");
        if("form".equals(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/form.jsp");
            rd.forward(request, response);
        } else if("add".equals(action)) {
            String firstName = request.getParameter("fn");
            String lastName = request.getParameter("ln");
            String email = request.getParameter("email");

            EmailListVo vo = new EmailListVo();
            vo.setFirstName(firstName);
            vo.setLastName(lastName);
            vo.setEmail(email);

            new EmailListDao().insert(vo);
            response.sendRedirect(request.getContextPath() + "/el");
        } else {
            /* default action (list) */
            List<EmailListVo> list = new EmailListDao().findAll();
            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
