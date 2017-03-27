package pot.dao;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/3/27.
 */
public class signupDaoAndroid {
    public Map findUser(String username,String password,String phone) {//处理安卓植物第一界面
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        Boolean isAlready=false;
        con = DBConnection.getDBConnection();
        String sqlAlready = "Select count(username) FROM user where username=?";
        String sql="INSERT INTO user (username,userpass,phone) VALUES (?,?,?)";
        String sqlFind="select user_id from user where username=?";
        try {
            prepstmt = con.prepareStatement(sqlAlready);
            prepstmt.setString(1, username);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt(1)!=0){
                    isAlready=true;
                    Map params = new HashMap();
                    params.put("userid",-1);
                    array.add(params);
                }
            }
            if(!isAlready){
                prepstmt = con.prepareStatement(sql);
                prepstmt.setString(1, username);
                prepstmt.setString(2, password);
                prepstmt.setString(3, phone);
                prepstmt.executeUpdate();
                prepstmt=con.prepareStatement(sqlFind);
                prepstmt.setString(1,username);
                rs=prepstmt.executeQuery();
                while(rs.next()){
                    Map params = new HashMap();
                    params.put("userid",rs.getInt(1));
                    array.add(params);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
            wai.put("data", array);
            return wai;
    }
}
