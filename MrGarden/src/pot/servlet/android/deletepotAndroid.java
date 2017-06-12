package pot.servlet.android;

import pot.dao.androidWeb.deletepotDao;

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
@WebServlet("/deletepotAndroid")
public class deletepotAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pot_id = Integer.parseInt(new String(request.getParameter("pot_id").getBytes("ISO8859-1"), "UTF-8"));
        int user_id = Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        deletepotDao deletepotDao = new deletepotDao();
        response.setContentType("text/html;charset=utf-8");//打印至HTML页面
        PrintWriter out = response.getWriter();
        out.print(deletepotDao.deletepot(user_id, pot_id));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
