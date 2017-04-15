package pot.dao.android;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/3/27.
 */
public class loginDaoAndroid {
    public String findUser(String user_name,String user_pwd) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String state="-3";//默认密码错误
        Boolean isAlready=false;
        String sqlAlready = "Select count(user_name) FROM user where user_name=?";
        String sql="select user_id from user where user_name=? AND user_pwd=?";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlAlready);
            prepstmt.setString(1, user_name);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt(1)!=0)
                    isAlready=true;
                else
                    state="-2";//用户不存在
            }
            if(isAlready){
                prepstmt = con.prepareStatement(sql);
                prepstmt.setString(1, user_name);
                prepstmt.setString(2, user_pwd);
                rs=prepstmt.executeQuery();
                while(rs.next()){
                    state=""+rs.getInt(1);//密码正确
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
