package pot.servlet.web;

import pot.dao.web.addGroupDaoWeb;
import pot.util.Findipid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/6/12.
 */
@WebServlet("/addGroup")
public class addGroup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Findipid.finduser_id(request.getCookies());
        String group_name = new String(request.getParameter("group_name").getBytes("ISO8859-1"), "UTF-8");
        String group_text = new String(request.getParameter("group_text").getBytes("ISO8859-1"), "UTF-8");
        addGroupDaoWeb addGroup = new addGroupDaoWeb();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (1 == addGroup.addGroup(user_id, group_name, group_text))
            request.getRequestDispatcher("addPot.jsp").forward(request, response);
        else{
            request.setAttribute("error", "alert(\"组名已存在.\")");
            request.getRequestDispatcher("addGroup.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}