package pot.servlet.android;

import pot.dao.android.deviceDetailDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
@WebServlet("/deviceDetailAndroid")
public class deviceDetailAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        deviceDetailDaoAndroid deviceDetailDao = new deviceDetailDaoAndroid();
        Map wai = deviceDetailDao.finddevice(pot_id);
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
