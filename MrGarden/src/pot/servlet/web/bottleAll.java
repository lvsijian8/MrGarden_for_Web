package pot.servlet.web;

import net.sf.json.JSONArray;
import pot.dao.android.fertilizeringDaoAndroid;
import pot.dao.web.getManageAllDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

/**
 * Created by lvsijian8 on 2017/5/12.
 */
@WebServlet("/bottleAll")
public class bottleAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Findipid.finduser_id(request.getCookies());
        String key = "speak";
        String speak = "操作成功";
        Enumeration paramNames = request.getParameterNames();
        fertilizeringDaoAndroid fertilizeringDao = new fertilizeringDaoAndroid();
        ArrayList<Integer> pot_unids = new ArrayList<Integer>();
        paramNames.hasMoreElements();
        while (paramNames.hasMoreElements()) {
            int pot_id = Integer.parseInt((String) paramNames.nextElement());
            if (-1 == fertilizeringDao.fertilizering(user_id, pot_id, "web")) {
                speak = "no";
                pot_unids.add(pot_id);
            }
        }
        getManageAllDaoWeb getManageAllDao = new getManageAllDaoWeb();
        JSONArray array;
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        array = getManageAllDao.findAllPot(user_id);
        request.setAttribute("getManage", array);
        if (speak.equals("no"))
            request.setAttribute("pot_unids", pot_unids);
        request.setAttribute(key, speak);
        request.setAttribute("type", "b");
        request.getRequestDispatcher("manage_all.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
