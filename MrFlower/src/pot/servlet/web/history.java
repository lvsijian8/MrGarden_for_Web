package pot.servlet.web;

import pot.dao.web.historyDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/17.
 */
@WebServlet("/history")
public class history extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pot_id = new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8");
        String pot_device = new String(request.getParameter("pot_device").getBytes("ISO8859-1"), "UTF-8");
        String pot_handle = new String(request.getParameter("pot_handle").getBytes("ISO8859-1"), "UTF-8");
        int user_id = 0;
        Cookie cookie = null;
        Cookie[] cookies = null;
        // 获取cookies的数据,是一个数组
        cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {//从cookie中获取当前已登陆用户
                cookie = cookies[i];
                if (cookie.getName().equals("user_id") && (cookie.getValue() != null)) {
                    user_id = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }
        String page = null;
        try {
            page = new String(request.getParameter("page").getBytes("ISO8859-1"), "UTF-8");
        } catch (NullPointerException e1) {
            page = "1";
        }
        historyDaoWeb historyDao = new historyDaoWeb();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("History", historyDao.findHistory(user_id, pot_id, pot_device, pot_handle, Integer.parseInt(page), 8));
        request.setAttribute("pot_id1", pot_id);
        request.setAttribute("pot_device1", pot_device);
        request.setAttribute("pot_handle1", pot_handle);
        request.setAttribute("page", Integer.parseInt(page));
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
