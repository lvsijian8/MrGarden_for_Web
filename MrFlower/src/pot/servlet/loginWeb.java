package pot.servlet;

import pot.dao.loginDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

/**
 * Created by lvsijian8 on 2017/3/30.
 */
@WebServlet("/loginWeb")
public class loginWeb extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("user_name").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String remember = "";
        String user_id = "";
        try {
            remember = new String(request.getParameter("remember").getBytes("ISO8859-1"), "UTF-8");
        } catch (Exception e) {
            remember = "off";
        }
        loginDaoAndroid loginDao = new loginDaoAndroid();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String error = "";
        switch (user_id = loginDao.findUser(user_name, user_pwd)) {
            case "-3":
                error = "alert(\"密码错误,请重新登陆.\")";
                break;
            case "-2":
                error = "alert(\"用户名不存在.\")";
                break;
        }
        if (!error.equals("")) {//密码错误
            request.setAttribute("error", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {//密码正确
            Cookie user_idCo = new Cookie("user_id", URLEncoder.encode(user_id, "UTF-8"));
            Cookie user_nameCo = new Cookie("user_name", URLEncoder.encode(user_name, "UTF-8"));
            if (remember.equals("on")) {//记住密码
                user_idCo.setMaxAge(60 * 60 * 24 * 14);   //设置Cookie有效期为14天
                user_nameCo.setMaxAge(60 * 60 * 24 * 14);
            }
            response.addCookie(user_idCo);
            response.addCookie(user_nameCo);//保存用户名以及ID
            request.setAttribute("error", "alert(\"登录成功\");window.location.href=\"index.jsp\";");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
