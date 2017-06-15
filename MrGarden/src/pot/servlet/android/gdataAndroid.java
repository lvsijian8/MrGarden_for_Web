package pot.servlet.android;

import pot.dao.android.gdataDaoAndroid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/6/14.
 */
@WebServlet("/gdataAndroid")
public class gdataAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8");
        int group_id = -1;
        try {
            group_id = Integer.parseInt(new String(request.getParameter("group_id").getBytes("ISO8859-1"), "UTF-8"));
        } catch (NullPointerException e) {
            group_id = -1;
        }
        gdataDaoAndroid gdataDao =new gdataDaoAndroid();
        Map wai = gdataDao.getgdata(Integer.parseInt(user_id),group_id);
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