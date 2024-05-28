package helloweb;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CookieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int visitCount = 0;

        // 쿠키 읽기
        Cookie[] cookies = req.getCookies();
        if(cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if("visitCount".equals(cookie.getName())) {
                    visitCount = Integer.parseInt(cookie.getValue());
                }
            }
        }
        visitCount++;
        // 쿠키 쓰기
        Cookie cookie = new Cookie("visitCount", String.valueOf(visitCount));
        cookie.setPath(req.getContextPath());
        cookie.setMaxAge(24 * 60 * 60);  // 1day
        resp.addCookie(cookie);

        // 출력
        resp.setContentType("text/html; charset=utf-8");
        resp.getWriter().print("<h1> 방문 횟수:" + visitCount +"</h1>");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
