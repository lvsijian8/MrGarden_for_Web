package pot.servlet.web;

import pot.dao.web.changeUserDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by lvsijian8 on 2017/5/6.
 */
@WebServlet("/changeUser")
public class changeUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("user_name").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String user_newpwd = new String(request.getParameter("user_newpwd").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("user_phone").getBytes("ISO8859-1"), "UTF-8");
        int user_id = Findipid.finduser_id(request.getCookies());
        changeUserDaoWeb changeUser = new changeUserDaoWeb();
        int state = changeUser.changeUser(user_id, user_name, user_pwd, user_newpwd, user_phone, Findipid.getRemoteAddress(request), "web");
        if (state == -3)
            request.setAttribute("error", "alert(\"原密码错误.\")");
        else if (state == -1)
            request.setAttribute("error", "alert(\"用户名已存在.\")");
        else if (state == -4)
            request.setAttribute("error", "alert(\"网络错误请重试.\")");
        else if (state > 0) {
            try {
                Cookie[] cookies = request.getCookies();
                Cookie cookie = null;
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {//从cookie中获取当前已登陆用户
                        cookie = cookies[i];
                        if (cookie.getName().equals("user_name") && (cookie.getValue() != null)) {
                            cookie.setValue(URLEncoder.encode(user_name, "UTF-8"));
                            break;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("未登陆时删除cookie错误");
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        if (state <= 0) {
            request.getRequestDispatcher("editInfo.jsp").forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
