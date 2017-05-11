package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.web.getManageAllDaoWeb;
import pot.dao.web.potDataDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
@WebServlet("/getManageAll")
public class getManageAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Findipid.finduser_id(request.getCookies());
        getManageAllDaoWeb getManageAllDao = new getManageAllDaoWeb();
        JSONArray array;
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        array = getManageAllDao.findAllPot(user_id);
        request.setAttribute("getManage", array);
        request.getRequestDispatcher("manage_all.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
