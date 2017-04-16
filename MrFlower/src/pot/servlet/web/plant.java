package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.plantDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/3/25.
 */
@WebServlet("/plant")
public class plant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {//来自Web的fid,返回第二层植物信息.
            String plant_id = new String(request.getParameter("plant_id").getBytes("ISO8859-1"), "UTF-8");
            plantDaoWeb plantDao = new plantDaoWeb();
            JSONArray array = plantDao.findSecond(Integer.parseInt(plant_id));
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            request.setAttribute("SecondPlant", array);
            request.getRequestDispatcher("huahui.jsp").forward(request, response);
        } catch (NullPointerException e) {//来自web,无输入参数.返回第一层植物信息.
            String page = null;
            try {
                page = new String(request.getParameter("page").getBytes("ISO8859-1"), "UTF-8");
            } catch (NullPointerException e1) {
                page = "1";
            }
            plantDaoWeb plantDao = new plantDaoWeb();
            JSONArray array = plantDao.findFirst(Integer.parseInt(page), 4);
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            request.setAttribute("page", Integer.parseInt(page));
            request.setAttribute("FirstPlant", array);
            request.getRequestDispatcher("plant.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
