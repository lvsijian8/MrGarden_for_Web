package pot.servlet.web;

import pot.dao.android.deletepotDaoAndroid;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/18.
 */
@WebServlet("/deletepot")
public class deletepot extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        int user_id = Findipid.finduser_id(request.getCookies());
        deletepotDaoAndroid wateringDao = new deletepotDaoAndroid();
        if (1 == wateringDao.deletepot(user_id, pot_id)) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "alert(\"删除失败,请重试.\");");
            request.getRequestDispatcher("manage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
