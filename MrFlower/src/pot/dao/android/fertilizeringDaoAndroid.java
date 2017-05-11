package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class fertilizeringDaoAndroid {
    public int fertilizering(int user_id, int pot_id,String device) {
        int state = 0;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        int fertilizer = 0;
        String sql = "SELECT bottle_ml FROM pot WHERE pot_id=?;";
        String sqlFindfertilizer = "SELECT now_bottle FROM pot WHERE pot_id=?;";
        String sqltime = "UPDATE pot SET bottleing_time=? WHERE pot_id=?;";
        String sqlUpdatafertilizer = "update pot set now_bottle=? where pot_id=?;";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                fertilizer = rs.getInt("bottle_ml");
            }
            prepstmt = con.prepareStatement(sqlFindfertilizer);
            prepstmt.setInt(1,pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                fertilizer = rs.getInt("now_bottle") - (int) ((fertilizer * 1.0) / 12.18);
            }
            if (fertilizer <= 0)
                return -1;
            prepstmt = con.prepareStatement(sqltime);
            prepstmt.setTimestamp(1, now);
            prepstmt.setInt(2, pot_id);
            if (prepstmt.executeUpdate() != 0)
                state = 1;
            else
                state = 0;
            prepstmt = con.prepareStatement(sqlUpdatafertilizer);
            prepstmt.setInt(1, fertilizer);
            prepstmt.setInt(2,pot_id);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlAddHistory);
            prepstmt.setInt(1, pot_id);
            prepstmt.setInt(2, user_id);
            prepstmt.setString(3, device);
            prepstmt.setTimestamp(4, now);
            prepstmt.setString(5, "fertilizering");
            prepstmt.setString(6, "施肥完成后剩余" + fertilizer + "%");
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
