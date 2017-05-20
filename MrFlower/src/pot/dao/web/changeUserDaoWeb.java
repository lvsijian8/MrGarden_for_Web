package pot.dao.web;

import pot.util.AddressUtils;
import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/5/6.
 */
public class changeUserDaoWeb {
    public int changeUser(int user_id, String user_name, String user_pwd, String user_newpwd, String user_phone, String ip, String device) {
        if (user_newpwd.equals(""))
            user_newpwd = user_pwd;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = -3;//默认密码错误
        String sqlis = "select user_id from user where user_id=?  AND user_pwd=?;";
        Boolean isAlready = true;
        String sqlAlready = "Select count(user_name) FROM user where user_name=? AND user_id<>?;";
        String sqlUp = "UPDATE user SET user_name=?,user_pwd=?,user_phone=? WHERE user_id=?;";
        String sqlAddHistory = "INSERT INTO history (user_id, time, handle,detail,device) VALUES(?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlis);
            prepstmt.setInt(1, user_id);
            prepstmt.setString(2, user_pwd);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                state = rs.getInt(1);//密码正确
            }
            if (state != -3) {
                prepstmt = con.prepareStatement(sqlAlready);
                prepstmt.setString(1, user_name);
                prepstmt.setInt(2, user_id);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    if (rs.getInt(1) == 0) {
                        isAlready = false;
                    } else {
                        state = -1;//用户已存在
                    }
                }
            }
            if (!isAlready) {
                prepstmt = con.prepareStatement(sqlUp);
                prepstmt.setString(1, user_name);
                prepstmt.setString(2, user_newpwd);
                prepstmt.setString(3, user_phone);
                prepstmt.setInt(4, user_id);
                if (prepstmt.executeUpdate() != 0) {
                    prepstmt = con.prepareStatement(sqlAddHistory);
                    prepstmt.setInt(1, user_id);
                    prepstmt.setTimestamp(2, now);
                    prepstmt.setString(3, "changeUser");
                    AddressUtils addressUtils = new AddressUtils();
                    try {
                        prepstmt.setString(4, "修改用户名为:" + user_name + ",修改手机为:" + user_phone + "ip:" + ip + ",地址:" + addressUtils.getAddress("ip=" + ip, "utf-8"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    prepstmt.setString(5, device);
                    prepstmt.executeUpdate();
                } else
                    state = -4;//修改失败;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
