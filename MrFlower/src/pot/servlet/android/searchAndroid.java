package pot.servlet.android;

import pot.dao.android.searchDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/11.
 */
@WebServlet("/searchAndroid")
public class searchAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flower_name = new String(request.getParameter("flower_name").getBytes("ISO8859-1"), "UTF-8");
        searchDaoAndroid searchDao = new searchDaoAndroid();
        Map wai = searchDao.searchplant(flower_name);
        if (wai != null) {
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println(wai.toString());
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
