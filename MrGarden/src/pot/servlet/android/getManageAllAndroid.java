package pot.servlet.android;

import pot.dao.android.getManageAllDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/5/12.
 */
@WebServlet("/getManageAllAndroid")
public class getManageAllAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8");
        getManageAllDaoAndroid getManageAllDao = new getManageAllDaoAndroid();
        Map wai = getManageAllDao.findAllPot(Integer.parseInt(user_id));
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
