package pot.servlet.android;

import pot.dao.android.wateringDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/5/12.
 */
@WebServlet("/waterAllAndroid")
public class waterAllAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        String pot_ids=new String(request.getParameter("pot_ids").getBytes("ISO8859-1"), "UTF-8");
        String pot_id[]=pot_ids.split("&");
        String pot_unids="";
        wateringDaoAndroid wateringDao = new wateringDaoAndroid();
        for(int i=0;i<pot_id.length;i++){
            if(-1==wateringDao.watering(user_id, Integer.parseInt(pot_id[i]), "android")){
                pot_unids+=pot_id[i]+"&";
            }
        }
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(pot_unids);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}