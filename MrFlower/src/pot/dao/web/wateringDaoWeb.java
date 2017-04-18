package pot.dao.web;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class wateringDaoWeb {
    public int watering(int user_id, int pot_id, String type, int watered) {
        int state = 0;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        String sqltime = "";
        String sqlUpdataWater = "";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        if (type.equals("w")) {
            sqltime = "UPDATE pot SET watering_time=? WHERE pot_id=?;";
            sqlUpdataWater = "update pot_" + pot_id + " set water=? where time=(select max(time) FROM (SELECT time FROM pot_1) AS something);";
        } else {
            sqltime = "UPDATE pot SET bottleing_time=? WHERE pot_id=?;";
            sqlUpdataWater = "update pot_" + pot_id + " set fertilizer=? where time=(select max(time) FROM (SELECT time FROM pot_1) AS something);";
        }
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqltime);
            prepstmt.setTimestamp(1, now);
            prepstmt.setInt(2, pot_id);
            if (prepstmt.executeUpdate() != 0)
                state = 1;
            else
                state = 0;
            prepstmt = con.prepareStatement(sqlUpdataWater);
            prepstmt.setInt(1, watered);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlAddHistory);
            prepstmt.setInt(1, pot_id);
            prepstmt.setInt(2, user_id);
            prepstmt.setString(3, "web");
            prepstmt.setTimestamp(4, now);
            if (type.equals("w"))
                prepstmt.setString(5, "watering");
            else
                prepstmt.setString(5, "fertilizering");
            prepstmt.setString(6, "完成后剩余" + watered + "%");
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
