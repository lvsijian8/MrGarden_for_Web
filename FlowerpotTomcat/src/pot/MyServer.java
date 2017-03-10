package pot;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;



/**
 * Created by lvsijian8 on 2017/3/3.
 */
@WebServlet("/MyServer")
public class MyServer extends HttpServlet {
    Connection con;
    Statement stat;
    ResultSet rs = null;

    public void init() throws ServletException {// 初始化代码仅进行一次的数据库连接操作
        mysqlUser.User();
        try {
            Class.forName(mysqlUser.driver);
            con = DriverManager.getConnection(mysqlUser.url, mysqlUser.user, mysqlUser.password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*String username = new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
        String userpass = new String(request.getParameter("userpass").getBytes("ISO8859-1"), "UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(username.equals("123")
                && userpass.equals("456"))
        {
            out.println("登录成功！");
        }
        else
        {
            out.println("登录失败！");
        }*/
        String sql,return1 = "0";//初始值0用于检测return1是否有操作过
        String switchMode = new String(request.getParameter("switchMode").getBytes("ISO8859-1"), "UTF-8");
        try {
            if (mysqlUser.checkConnection(con) || con == null || con.isClosed())//检查链接是否正常
                con = DriverManager.getConnection(mysqlUser.url, mysqlUser.user, mysqlUser.password);
            stat = con.createStatement();
            switch (switchMode){
                case "userLogin":{
                    //验证登录
                    String name =new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
                    String pass =new String(request.getParameter("userpass").getBytes("ISO8859-1"), "UTF-8");
                    sql = "Select userpass,user_id FROM flowerpot_user where username='" + name + "'";
                    rs = stat.executeQuery(sql);
                    while (rs.next()) {
                        //System.out.println(name+" "+pass+rs.getString("userpass"));
                        if (pass.equals(rs.getString("userpass"))) {
                            return1 = "0" + rs.getInt("user_id");//为了兼容原本的后台协议需在id前加上登陆动作的代号:0
                            break;
                        }
                    }
                    rs.close();
                    stat.close();
                    break;
                }
                case "userSign_up":{
                    String name = new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
                    String pass =new String(request.getParameter("userpass").getBytes("ISO8859-1"), "UTF-8");
                    String phone = new String(request.getParameter("userphone").getBytes("ISO8859-1"), "UTF-8");
                    int no = 0;
                    boolean mark = false;

                    String sqlchong = "Select count(username) FROM flowerpot_user where username='" + name + "'";
                    rs = stat.executeQuery(sqlchong);
                    while (rs.next()) {
                        if (0 != rs.getInt("count(username)"))
                            mark = true;
                    }
                    if (mark) {
                        return1 = "/";//查重跳出
                        break;
                    }
                    int id = 1;
                    String sqlmax = "Select MAX(user_id)FROM flowerpot_user";
                    rs = stat.executeQuery(sqlmax);
                    while (rs.next()) {
                        id = rs.getInt("MAX(user_id)");
                    }
                    id++;
                    sql = "INSERT INTO flowerpot_user (user_id,username,userpass,phone) VALUES (" + id + ",'" + name + "','" + pass + "','" + phone + "')";
                    if (0 != stat.executeUpdate(sql)) {
                        return1 = "1" + id;//为了兼容原本的后台协议需在id前加上注册动作的代号:1
                        break;
                    }
                    rs.close();
                    stat.close();
                    break;

                }
                default:;
            }
            stat.close();





        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(return1);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    public void destroy() {// 终止化代码,关闭数据库连接
        mysqlUser.over(rs,stat,con);
    }
}
