package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.potDataDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/13.
 */
@WebServlet("/equipment")
public class equipment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = -1;
        try {
            pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        } catch (NullPointerException e) {
            pot_id = -1;
        }
        int user_id = Findipid.finduser_id(request.getCookies());
        potDataDaoWeb deviceDao = new potDataDaoWeb();
        JSONArray array;
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        array = deviceDao.findPotData(pot_id, user_id);
        request.setAttribute("Potdevic", array);
        request.getRequestDispatcher("equipment.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
