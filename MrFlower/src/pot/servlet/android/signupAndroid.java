package pot.servlet.android;

import pot.dao.android.signupDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/3/27.
 */
@WebServlet("/signupAndroid")
public class signupAndroid extends HttpServlet {
    public String getRemoteAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getHeader("Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown"))
            ip = request.getHeader("WL-Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getRemoteAddr();
        return ip;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = new String(request.getParameter("user_name").getBytes("ISO8859-1"), "UTF-8");
        String user_pwd = new String(request.getParameter("user_pwd").getBytes("ISO8859-1"), "UTF-8");
        String user_phone = new String(request.getParameter("user_phone").getBytes("ISO8859-1"), "UTF-8");
        signupDao signupDao = new signupDao();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(signupDao.writeUser(user_name, user_pwd, user_phone, getRemoteAddress(request), "android"));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
