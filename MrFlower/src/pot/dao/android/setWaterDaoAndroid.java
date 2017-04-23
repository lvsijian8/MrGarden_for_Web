package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class setWaterDaoAndroid {
    public int setWater(int user_id, int pot_id, int wday, int wtime, int wml) {
        wml/=10;
        wml*=10;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = 0;
        String sql = "UPDATE pot SET water_day=?,water_time=?,water_ml=? WHERE pot_id=?;";
        String sqlAddHistory = "INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, wday);
            prepstmt.setInt(2, wtime);
            prepstmt.setInt(3, wml);
            prepstmt.setInt(4, pot_id);
            if (prepstmt.executeUpdate() != 0) {
                state = 1;
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1, pot_id);
                prepstmt.setInt(2, user_id);
                prepstmt.setString(3, "android");
                prepstmt.setTimestamp(4, now);
                prepstmt.setString(5, "set");
                prepstmt.setString(6, "修改浇水设置:浇水间隔为" + wday + "天,浇水时间为:" + wtime + "点,浇水量为:" + wml + "ml.");
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
