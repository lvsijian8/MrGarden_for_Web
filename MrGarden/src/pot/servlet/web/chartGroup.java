package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.chartGroupDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/6/6.
 */
@WebServlet("/chartGroup")
public class chartGroup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int group_id = -1;
        try {
            group_id = Integer.parseInt(new String(request.getParameter("group_id").getBytes("ISO8859-1"), "UTF-8"));
        } catch (NullPointerException e) {
            group_id = -1;
        }
        int user_id = Findipid.finduser_id(request.getCookies());
        chartGroupDaoWeb chartGroup=new chartGroupDaoWeb();
        JSONArray array;
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        array = chartGroup.findchartGroup(user_id, group_id);
        request.setAttribute("Groupchart", array);
        request.getRequestDispatcher("chart.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
