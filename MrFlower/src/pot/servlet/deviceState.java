package pot.servlet;

import pot.dao.deviceStateDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/4/14.
 */
@WebServlet("/deviceState")
public class deviceState extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = -1;
        try {
            pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        } catch (NullPointerException e) {
            pot_id = -1;
        }
        deviceStateDaoWeb deviceStateDao = new deviceStateDaoWeb();
        response.setContentType("text/html;charset=utf-8");//打印至HTML页面
        PrintWriter out = response.getWriter();
        out.print(deviceStateDao.findState(pot_id));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
