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
        int fertilizer = 50;
        String sqlFindfertilizer = "SELECT bottle_ml,now_bottle FROM pot WHERE pot_id=?;";
        String sqlUpdatafertilizer = "UPDATE pot SET bottleing_time=?,now_bottle=? where pot_id=?;";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindfertilizer);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                fertilizer = rs.getInt("now_bottle") - (int) ((rs.getInt("bottle_ml") * 1.0) / 12.18);
            }
            if (fertilizer <= 0)
                state = -1;
            else {
                prepstmt = con.prepareStatement(sqlUpdatafertilizer);
                prepstmt.setTimestamp(1, now);
                prepstmt.setInt(2, fertilizer);
                prepstmt.setInt(3,pot_id);
                if (prepstmt.executeUpdate() != 0)
                    state = 1;
                else
                    state = 0;
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1, pot_id);
                prepstmt.setInt(2, user_id);
                prepstmt.setString(3, device);
                prepstmt.setTimestamp(4, now);
                prepstmt.setString(5, "fertilizering");
                prepstmt.setString(6, "施肥完成后剩余" + fertilizer + "%");
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
