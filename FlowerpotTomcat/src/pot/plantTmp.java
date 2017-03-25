package pot;

import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/3/21.
 */
@WebServlet("/plantTmp")
public class plantTmp extends HttpServlet {

    public void init() throws ServletException {// 初始化代码仅进行一次的数据库连接操作

       /* try {
        } catch (SQLException e) {
            e.printStackTrace();
        }*/
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*String device=new String(request.getParameter("device").getBytes("ISO8859-1"), "UTF-8");
        if(device.equals("web")){
            ;
        }*/


        Connection con=null;
        PreparedStatement prepstmt=null;
        ResultSet rs=null;




        boolean nullMark=false;
        String fid=new String(request.getParameter("fid").getBytes("ISO8859-1"), "UTF-8");
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        try {

            mysqlUser.User();
            con=mysqlUser.start();
            String sql="select * from plant plant_id LIMIT ?,7";
            prepstmt=con.prepareStatement(sql);




            prepstmt.setInt(1, Integer.parseInt(fid));
            rs=prepstmt.executeQuery();
            while (rs.next()){
                //nullMark=true;
                Map params = new HashMap();
                params.put("fid", rs.getInt(1));
                params.put("pic", rs.getString(4));
                //params.put("namec",rs.getString(2));
                params.put("namee",rs.getString(3));
                array.add(params);
            }
            response.setContentType("text/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if(nullMark) {
                wai.put("data",array);
                out.println(wai.toString());
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            String sqlState = e.getSQLState();
            // 这个08S01就是这个异常的sql状态。单独处理手动重新链接就可以了。
            if ("08S01".equals(sqlState) || "40001".equals(sqlState))
            {
                try {
                    con=mysqlUser.start();
                    String sql="select * from plant plant_id LIMIT ?,7";
                    prepstmt=con.prepareStatement(sql);
                } catch (SQLException ee) {
                    e.printStackTrace();
                }
            }



        }finally {
            mysqlUser.over(rs,prepstmt,con);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    /*public void destroy() {// 终止化代码,关闭数据库连接
        mysqlUser.over(rs,prepstmt,con);
    }*/
}
