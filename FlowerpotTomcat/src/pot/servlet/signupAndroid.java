package pot.servlet;

import pot.dao.signupDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/3/27.
 */
@WebServlet("/signupAndroid")
public class signupAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
        String password = new String(request.getParameter("password").getBytes("ISO8859-1"), "UTF-8");
        String phone = new String(request.getParameter("phone").getBytes("ISO8859-1"), "UTF-8");
        signupDaoAndroid signupDao = new signupDaoAndroid();
        Map wai = signupDao.findUser(username,password,phone);
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(wai.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
