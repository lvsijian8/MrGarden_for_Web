package pot.dao;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/14.
 */
public class deviceStateDaoWeb {
    public String findState(int pot_id) {
        String state = "";
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp date = null;
        Timestamp now = new Timestamp(new Date().getTime());
        String sql = "SELECT heartBeat_time,now_temperature,now_humidity,now_power,now_light FROM pot WHERE pot_id=?;";
        String sqlUpdataLook="UPDATE pot SET look_time=? WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                date = rs.getTimestamp("heartBeat_time");
                state += rs.getInt("now_temperature") + "<span>°C</span>|";
                state += rs.getInt("now_humidity") + "<span>%</span>|";
                state += rs.getInt("now_power") + "<span>%</span>|";
                if (rs.getInt("now_light") > 500)
                    state += "强|";
                else
                    state += "弱|";
            }
            prepstmt = con.prepareStatement(sqlUpdataLook);
            prepstmt.setTimestamp(1,now);
            prepstmt.setInt(2, pot_id);
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        if (((now.getTime() - date.getTime()) / 1000) > 5)
            state += "0|";
        else
            state += "1|";
        return state;
    }
}
