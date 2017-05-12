package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class wateringDaoAndroid {
    public int watering(int user_id, int pot_id, String device) {
        int state = 0;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        int water = 50;
        String sqlFindWater = "SELECT water_ml,now_water FROM pot WHERE pot_id=?;";
        String sqlUpdataWater = "UPDATE pot SET watering_time=?,now_water=? where pot_id=?;";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindWater);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                water = rs.getInt("now_water") - (int) ((rs.getInt("water_ml") * 1.0) / 12.18);
            }
            if (water <= 0)
                state = -1;
            else {
                prepstmt = con.prepareStatement(sqlUpdataWater);
                prepstmt.setTimestamp(1, now);
                prepstmt.setInt(2, water);
                prepstmt.setInt(3, pot_id);
                if (prepstmt.executeUpdate() != 0)
                    state = 1;
                else
                    state = 0;
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1, pot_id);
                prepstmt.setInt(2, user_id);
                prepstmt.setString(3, device);
                prepstmt.setTimestamp(4, now);
                prepstmt.setString(5, "watering");
                prepstmt.setString(6, "浇水完成后剩余" + water + "%");
                prepstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
