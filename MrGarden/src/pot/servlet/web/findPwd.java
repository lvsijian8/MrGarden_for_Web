package pot.servlet.web;

import pot.dao.androidWeb.findPwdDao;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/6/4.
 */
@WebServlet("/findPwd")
public class findPwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("user_name").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("user_phone").getBytes("ISO8859-1"), "UTF-8");
        findPwdDao findPwd=new findPwdDao();
        int state = findPwd.findPwd(user_name,user_pwd,user_phone, Findipid.getRemoteAddress(request), "web");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
