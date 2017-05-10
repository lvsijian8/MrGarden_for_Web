package pot.servlet.android;

import pot.dao.web.changeUserDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/5/9.
 */
@WebServlet("/changeUserAndroid")
public class changeUserAndroid extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("oldpsw").getBytes("ISO8859-1"), "UTF-8");
        String user_newpwd = new String(request.getParameter("newpsw").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("phone").getBytes("ISO8859-1"), "UTF-8");
        int user_id =Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        changeUserDaoWeb changeUser = new changeUserDaoWeb();
        int state = changeUser.changeUser(user_id, user_name, user_pwd, user_newpwd, user_phone, Findipid.getRemoteAddress(request), "android");
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(state);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
