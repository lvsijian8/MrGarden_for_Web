package pot.dao.androidWeb;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/6/4.
 */
public class findPwdDao {
    public int findPwd(String user_name, String user_pwd, String user_phone, String ip, String device){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = -2;//默认用户名不存在
        String sqlAlready = "Select count(user_name) FROM user where user_name=?;";
        String sqlPhone="SELECT COUNT(user_id) FROM user WHERE user_name=? AND user_phone=?;";
        String sqlUp = "UPDATE user SET user_pwd=? WHERE user_name=? AND user_phone=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlAlready);
            prepstmt.setString(1, user_name);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                state = rs.getInt(1);//用户存在
            }
            if (state!=-2&&state==1){
                prepstmt = con.prepareStatement(sqlPhone);
                prepstmt.setString(1, user_name);
                prepstmt.setString(2, user_phone);
                rs = prepstmt.executeQuery();
                state=-4;//电话错误
                while (rs.next()) {
                    state = rs.getInt(1);
                }
            }
            if (state!=-4&&state==1){
                prepstmt = con.prepareStatement(sqlUp);
                prepstmt.setString(1, user_pwd);
                prepstmt.setString(2,user_name);
                prepstmt.setString(3,user_phone);
                state=prepstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
