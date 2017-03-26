package pot.servlet;

import net.sf.json.JSONArray;
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
        try {//来自安卓的fid,返回植物信息.
            String fid = new String(request.getParameter("fid").getBytes("ISO8859-1"), "UTF-8");
            if (fid != null) {
                plantDao plantDao = new plantDao();
                Map wai = null;
                if ((wai = plantDao.findFirstAnd(Integer.parseInt(fid), 7)) != null) {
                    response.setContentType("text/json;charset=UTF-8");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println(wai.toString());
                }
            }
        }catch (NullPointerException e){//来自web,无输入参数.
            String page=null;
            try {
                page = new String(request.getParameter("page").getBytes("ISO8859-1"), "UTF-8");
            }catch (NullPointerException e1){page="1";}
            plantDao plantDao = new plantDao();
            JSONArray array =plantDao.findFirstWeb(Integer.parseInt(page),4);
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            request.setAttribute("page",Integer.parseInt(page));
            request.setAttribute("FirstPlant",array);
            request.getRequestDispatcher("plant.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
