package com.poscodx.helloweb;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello")
public class HelloServlet extends HttpServlet {
    private String message;
    private static final long serialVersionUID = 1L;
    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        response.setContentType("text/html; charset=utf-8");

        // Hello®
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>안녕 " + id + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}