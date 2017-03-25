package pot.servlet;

import pot.dao.plantDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/3/25.
 */
@WebServlet("/plant")
public class plant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fid=new String(request.getParameter("fid").getBytes("ISO8859-1"), "UTF-8");
        plantDao plantDao=new plantDao();
        Map wai=null;
        if((wai=plantDao.findById(Integer.parseInt(fid),7))!=null){
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println(wai.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
