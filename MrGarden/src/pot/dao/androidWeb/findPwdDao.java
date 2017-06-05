package pot.dao.androidWeb;

import pot.util.AddressUtils;
import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/6/4.
 */
public class findPwdDao {
    public int findPwd(String user_name, String user_pwd, String user_phone, String ip, String device) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = -2;//默认用户名不存在
        String sqlAlready = "Select count(user_name) FROM user where user_name=?;";
        String sqlPhone = "SELECT user_id FROM user WHERE user_name=? AND user_phone=?;";
        String sqlUp = "UPDATE user SET user_pwd=? WHERE user_name=? AND user_phone=?;";
        String sqlAddHistory = "INSERT INTO history (user_id, time, handle,detail,device) VALUES(?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlAlready);
            prepstmt.setString(1, user_name);//http://localhost:8080/MrGarden/findPwdAndroid?user_name=lll&user_phone=11&user_pwd=lll.....=0
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == 1) //用户存在
                    state = 1;
            }
            if (state != -2 && state == 1) {
                prepstmt = con.prepareStatement(sqlPhone);
                prepstmt.setString(1, user_name);
                prepstmt.setString(2, user_phone);
                rs = prepstmt.executeQuery();
                state = -4;//电话错误
                while (rs.next()) {
                    state = rs.getInt(1);
                }
                if (state != -4 && state > 0) {
                    prepstmt = con.prepareStatement(sqlUp);
                    prepstmt.setString(1, user_pwd);
                    prepstmt.setString(2, user_name);
                    prepstmt.setString(3, user_phone);
                    prepstmt.executeUpdate();

                    prepstmt = con.prepareStatement(sqlAddHistory);
                    prepstmt.setInt(1, state);
                    prepstmt.setTimestamp(2, now);
                    prepstmt.setString(3, "findPwd");
                    AddressUtils addressUtils = new AddressUtils();
                    try {
                        prepstmt.setString(4, "找回密码ip:" + ip + ",地址:" + addressUtils.getAddress("ip=" + ip, "utf-8"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    prepstmt.setString(5, device);
                    prepstmt.executeUpdate();



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
