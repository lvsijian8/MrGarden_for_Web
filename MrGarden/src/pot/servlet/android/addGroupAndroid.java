package pot.servlet.android;

import pot.dao.web.addGroupDaoWeb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lvsijian8 on 2017/6/13.
 */
@WebServlet("/addGroupAndroid")
public class addGroupAndroid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(new String(request.getParameter("user_id").getBytes("ISO8859-1"), "UTF-8"));
        String group_name = new String(request.getParameter("group_name").getBytes("ISO8859-1"), "UTF-8");
        addGroupDaoWeb addGroup=new addGroupDaoWeb();
        addGroup.addGroup(user_id,group_name,"");
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("success");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}