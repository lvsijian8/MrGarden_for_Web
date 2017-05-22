package pot.dao.android;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class deletepotDaoAndroid {
    public int deletepot(int user_id, int pot_id) {
        int state = 0;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        String sqldelete = "DELETE FROM pot WHERE pot_id = ?;";
        String sqluserpot = "DELETE FROM user_pot WHERE pot_id = ? AND user_id=?;";
        String sqltable = "drop table pot_" + pot_id + ";";
        String sqlFindPotName = "SELECT flower_name FROM pot WHERE pot_id=?;";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        String flower_name = "";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPotName);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                flower_name = rs.getString("flower_name");
            }
            prepstmt = con.prepareStatement(sqldelete);
            prepstmt.setInt(1, pot_id);
            state = prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqluserpot);
            prepstmt.setInt(1, pot_id);
            prepstmt.setInt(2, user_id);
            state = prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqltable);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlAddHistory);
            prepstmt.setInt(1, pot_id);
            prepstmt.setInt(2, user_id);
            prepstmt.setString(3, "android");
            prepstmt.setTimestamp(4, now);
            prepstmt.setString(5, "delete_pot");
            prepstmt.setString(6, "被删除的花盆为:" + flower_name);
            prepstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("<<<删除花盆出错.");
            e.printStackTrace();
            System.out.println("删除花盆出错.>>>");
            state = 0;
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
            return state;
        }
    }
}
