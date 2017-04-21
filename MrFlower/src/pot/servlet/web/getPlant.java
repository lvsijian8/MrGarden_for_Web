package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.getPlantDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/18.
 */
@WebServlet("/getPlant")
public class getPlant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getPlantDaoWeb getPlantDaoWeb = new getPlantDaoWeb();
        JSONArray array = getPlantDaoWeb.findPlant();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("PlantList", array);
        request.getRequestDispatcher("addPot.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
