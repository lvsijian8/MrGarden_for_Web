package pot.servlet.android;

import pot.dao.android.appendDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/4/6.
 */
@WebServlet("/appendAndroid")
public class appendAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id=Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        int fid=Integer.parseInt(new String(request.getParameter("fid").getBytes("ISO8859-1"), "UTF-8"));
        String flowername = new String(request.getParameter("flowername").getBytes("ISO8859-1"), "UTF-8");
        int num_bottle_day=Integer.parseInt(request.getParameter("num_bottle_day"));
        int num_bottle_time=Integer.parseInt(request.getParameter("num_bottle_time"));
        int num_bottle_ml=Integer.parseInt(request.getParameter("num_bottle_ml"));
        int num_water_day=Integer.parseInt(request.getParameter("num_water_day"));
        int num_water_time=Integer.parseInt(request.getParameter("num_water_time"));
        int num_water_ml=Integer.parseInt(request.getParameter("num_water_ml"));
        appendDaoAndroid appendDao =new appendDaoAndroid();
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(appendDao.append(user_id,fid, flowername, num_bottle_day,num_bottle_time,num_bottle_ml,num_water_day,num_water_time,num_water_ml));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}