package pot.dao.android;

import pot.util.AddressUtils;
import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/4/20.
 */
public class askMeDaoAndroid {
    public int askMe(int user_id, String opinion, String phone, String ip) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = 0;
        String sqlAdd = "INSERT INTO ask_me(user_id, phone, opinion, ip_address, time) VALUES(?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlAdd);
            prepstmt.setInt(1, user_id);
            prepstmt.setString(2, opinion);
            prepstmt.setString(3, phone);
            AddressUtils addressUtils = new AddressUtils();
            try {
                prepstmt.setString(4, "登陆ip:" + ip + ",地址:" + addressUtils.getAddress("ip=" + ip, "utf-8"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            prepstmt.setTimestamp(5, now);
            state=prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
