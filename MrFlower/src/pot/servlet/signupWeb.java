package pot.servlet;

import pot.dao.signupDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/3/30.
 */
@WebServlet("/signupWeb")
public class signupWeb extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("user_name");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("user_phone").getBytes("ISO8859-1"), "UTF-8");
        String user_id = "";
        System.out.println(user_name+"________________--");
        signupDaoAndroid signupDao = new signupDaoAndroid();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if ((user_id = signupDao.writeUser(user_name, user_pwd, user_phone)) == "-1") {
            request.setAttribute("error", "alert(\"用户名已存在.\")");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Cookie user_idCo = new Cookie("user_id", user_id);
            Cookie user_nameCo = new Cookie("user_name", user_name);
            response.addCookie(user_idCo);
            response.addCookie(user_nameCo);//保存用户名以及ID
            request.setAttribute("error", "alert(\"注册成功.\");window.location.href=\"index.jsp\";");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
