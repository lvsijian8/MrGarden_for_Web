package pot.servlet.android;

import pot.dao.android.setWaterDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
@WebServlet("/setWaterAndroid")
public class setWaterAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        int pot_id=Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        int num_water_day=Integer.parseInt(request.getParameter("num_water_day"));
        int num_water_time=Integer.parseInt(request.getParameter("num_water_time"));
        int num_water_ml=Integer.parseInt(request.getParameter("num_water_ml"));
        setWaterDaoAndroid setWaterDao =new setWaterDaoAndroid();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(setWaterDao.setWater(user_id,pot_id,num_water_day,num_water_time,num_water_ml));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
