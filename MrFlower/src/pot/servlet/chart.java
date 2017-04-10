package pot.servlet;

import net.sf.json.JSONArray;
import pot.dao.chartDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/4/8.
 */
@WebServlet("/chart")
public class chart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pot_id = "";
        try {
            pot_id = new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8");
        } catch (NullPointerException e) {
            pot_id = "-1";
        }
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
        chartDaoWeb chartDao = new chartDaoWeb();
        JSONArray array = chartDao.findchart(Integer.parseInt(pot_id), user_id);
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("Potchart", array);

        /*PrintWriter out = response.getWriter();
        out.println(array.toString());*/
        request.getRequestDispatcher("chart.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
