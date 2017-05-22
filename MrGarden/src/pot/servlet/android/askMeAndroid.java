package pot.servlet.android;

import pot.dao.android.askMeDaoAndroid;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/4/20.
 */
@WebServlet("/askMeAndroid")
public class askMeAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        String opinion = new String(request.getParameter("opinion").getBytes("ISO8859-1"), "UTF-8");
        String phone = new String(request.getParameter("phone").getBytes("ISO8859-1"), "UTF-8");
        askMeDaoAndroid askMeDao = new askMeDaoAndroid();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(askMeDao.askMe(user_id, opinion, phone, Findipid.getRemoteAddress(request)));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}