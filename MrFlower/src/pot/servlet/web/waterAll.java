package pot.servlet.web;

import pot.dao.android.wateringDaoAndroid;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * Created by lvsijian8 on 2017/5/11.
 */
@WebServlet("/waterAll")
public class waterAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Findipid.finduser_id(request.getCookies());
        wateringDaoAndroid wateringDao = new wateringDaoAndroid();
        Enumeration paramNames = request.getParameterNames();
        while(paramNames.hasMoreElements()) {
            int pot_id = Integer.parseInt((String)paramNames.nextElement());
            wateringDao.watering(user_id, pot_id,"web");
        }

        /*fertilizeringDaoAndroid fertilizeringDao =new fertilizeringDaoAndroid();
        paramNames.hasMoreElements();
        while(paramNames.hasMoreElements()) {
            int pot_id = Integer.parseInt((String)paramNames.nextElement());
            fertilizeringDao.fertilizering(user_id, pot_id,"web");
        }*/

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
