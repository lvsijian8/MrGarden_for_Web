package pot.servlet.android;

import pot.dao.plantDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/3/26.
 */
@WebServlet("/plantAndroid")
public class plantAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fid = new String(request.getParameter("fid").getBytes("ISO8859-1"), "UTF-8");
        plantDaoAndroid plantDao = new plantDaoAndroid();
        Map wai = plantDao.findFirst(Integer.parseInt(fid), 7);
        if (wai != null) {
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println(wai.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
