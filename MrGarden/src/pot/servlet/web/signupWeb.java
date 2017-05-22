package pot.servlet.web;

import pot.dao.android.signupDao;
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
 * Created by lvsijian8 on 2017/3/30.
 */
@WebServlet("/signupWeb")
public class signupWeb extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("user_name").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("user_phone").getBytes("ISO8859-1"), "UTF-8");
        String user_id = "";
        signupDao signupDao = new signupDao();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if ((user_id = signupDao.writeUser(user_name, user_pwd, user_phone, Findipid.getRemoteAddress(request), "web")) == "-1") {
            request.setAttribute("error", "alert(\"用户名已存在.\")");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Cookie user_idCo = new Cookie("user_id", URLEncoder.encode(user_id, "UTF-8"));
            Cookie user_nameCo = new Cookie("user_name", URLEncoder.encode(user_name, "UTF-8"));
            response.addCookie(user_idCo);
            response.addCookie(user_nameCo);//保存用户名以及ID
            request.setAttribute("error", "window.location.href=\"addPot.jsp\";");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
