package pot.dao.arduino;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/4/19.
 */
public class setTimeDao {
    public String setTime(int pot_id) {
        String state = "";
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        state = state + "s " + now.toString().split("\\.")[0];
        String sql = "SELECT bottle_day,bottle_time,bottle_ml,water_day,water_time,water_ml FROM pot WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                state = state + " "+rs.getInt(1);
                state = state + " "+rs.getInt(2);
                state = state + " "+rs.getInt(3);
                state = state + " "+rs.getInt(4);
                state = state + " "+rs.getInt(5);
                state = state + " "+rs.getInt(6);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
