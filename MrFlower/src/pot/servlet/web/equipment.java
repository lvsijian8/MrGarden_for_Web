package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.potDataDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/13.
 */
@WebServlet("/equipment")
public class equipment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = -1;
        try {
            pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        } catch (NullPointerException e) {
            pot_id = -1;
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
        potDataDaoWeb deviceDao = new potDataDaoWeb();
        JSONArray array;
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if ((array = deviceDao.findPotData(pot_id, user_id)) != null) {
            request.setAttribute("Potdevic", array);
            request.getRequestDispatcher("equipment.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "alert(\"您当前尚未添加花盆.请进入首页下方下载APP进行添加\");");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
