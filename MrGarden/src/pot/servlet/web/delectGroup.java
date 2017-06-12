package pot.servlet.web;

import pot.dao.web.deleteGroupDaoWeb;
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
@WebServlet("/delectGroup")
public class delectGroup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int group_id = Integer.parseInt(new String(request.getParameter("group_id").getBytes("ISO8859-1"), "UTF-8"));
        int user_id = Findipid.finduser_id(request.getCookies());
        deleteGroupDaoWeb deleteGroup =new deleteGroupDaoWeb();
        int stata=deleteGroup.deleteGroup(user_id, group_id);
        if (1 == stata) {
            response.sendRedirect("index.jsp");
        }
        else if (stata==-2){
            request.setAttribute("error", "alert(\"请先删除组中的节点.\");");
            request.getRequestDispatcher("manage_all.jsp").forward(request, response);
        }
        else {
            request.setAttribute("error", "alert(\"删除失败,请重试.\");");
            request.getRequestDispatcher("manage_all.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
