package pot.servlet.web;

import pot.dao.web.setTimeDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
@WebServlet("/setTimeMl")
public class setTimeMl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pot_id = new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8");
        String type = new String(request.getParameter("type").getBytes("ISO8859-1"), "UTF-8");
        String day = new String(request.getParameter("day").getBytes("ISO8859-1"), "UTF-8");
        String time = new String(request.getParameter("time").getBytes("ISO8859-1"), "UTF-8");
        String ml = new String(request.getParameter("ml").getBytes("ISO8859-1"), "UTF-8");
        int user_id = Findipid.finduser_id(request.getCookies());
        setTimeDaoWeb setTimeDao = new setTimeDaoWeb();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("type", type);
        request.setAttribute("speak", setTimeDao.setTime(user_id, Integer.parseInt(pot_id), type, Integer.parseInt(day), Integer.parseInt(time), Integer.parseInt(ml)));
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
