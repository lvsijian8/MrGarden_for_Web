package pot.filters;

import pot.dao.web.checkLoginDaoWeb;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * Created by lvsijian8 on 2017/3/31.
 */
@WebFilter({"/addPot.jsp", "/chart.jsp", "/equipment.jsp", "/history.jsp", "/manage.jsp", "/editInfo.jsp", "/manage_all.jsp", "/append", "/changeUser", "/chart", "/deletepot", "/deviceState", "/equipment", "/getManageAll", "/getPlant", "/getUser", "/history", "/setTimeMl", "/wateringWeb"})
public class checkLogin implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String user_name = "";
        boolean isLogin = false;
        int user_id = 0;
        Cookie cookie = null;
        Cookie[] cookies = null;
        // 获取cookies的数据,是一个数组
        cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {//从cookie中获取当前已登陆用户
                cookie = cookies[i];
                if (user_id != 0 && !user_name.equals(""))
                    break;
                if (cookie.getName().equals("user_name") && (cookie.getValue() != null)) {
                    user_name = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } else if (cookie.getName().equals("user_id") && (cookie.getValue() != null)) {
                    user_id = Integer.parseInt(URLDecoder.decode(cookie.getValue(), "UTF-8"));
                }
            }
        }
        checkLoginDaoWeb checkLogin = new checkLoginDaoWeb();
        isLogin = checkLogin.checkLogin(user_id, user_name);
        if (!isLogin) {
            cookie = new Cookie("user_id", null);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            cookie = new Cookie("user_name", null);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            request.setAttribute("error", "alert(\"请先登录\");");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else
            chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
