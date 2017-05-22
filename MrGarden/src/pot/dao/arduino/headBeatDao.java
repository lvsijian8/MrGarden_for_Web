package pot.dao.arduino;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/19.
 */
public class headBeatDao {
    public String headBeat(int pot_id) {
        String state = "";
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        Timestamp lookdate = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp waterdate = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp bottledate = new Timestamp(new java.util.Date().getTime() - 10000);
        String sqlIsLook = "SELECT look_time,watering_time,bottleing_time FROM pot WHERE pot_id=?";
        String sqlUpdataHead = "UPDATE pot SET heartBeat_time=? WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlUpdataHead);
            prepstmt.setTimestamp(1, now);
            prepstmt.setInt(2, pot_id);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlIsLook);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                lookdate = rs.getTimestamp("look_time");
                waterdate = rs.getTimestamp("watering_time");
                bottledate = rs.getTimestamp("bottleing_time");
            }
            if (lookdate == null)
                lookdate = new Timestamp(new java.util.Date().getTime() - 10000);
            if (((now.getTime() - lookdate.getTime()) / 1000) <= 5)
                state += "LlookUpdata|";
            else
                state += "12345678901|";
            if (waterdate == null)
                waterdate = new Timestamp(new java.util.Date().getTime() - 10000);
            if (((now.getTime() - waterdate.getTime()) / 1000) <= 5) {
                Timestamp waterdated = new Timestamp(waterdate.getTime() - 10000);
                String sqlUpdataWater = "UPDATE pot SET watering_time=? WHERE pot_id=?;";
                prepstmt = con.prepareStatement(sqlUpdataWater);
                prepstmt.setTimestamp(1, waterdated);
                prepstmt.setInt(2, pot_id);
                prepstmt.executeUpdate();
                state += "Wwatering|";
            } else
                state += "123456789|";
            if (bottledate == null)
                bottledate = new Timestamp(new java.util.Date().getTime() - 10000);
            if (((now.getTime() - bottledate.getTime()) / 1000) <= 5) {
                Timestamp bottledated = new Timestamp(bottledate.getTime() - 10000);
                String sqlUpdataBottle = "UPDATE pot SET bottleing_time=? WHERE pot_id=?;";
                prepstmt = con.prepareStatement(sqlUpdataBottle);
                prepstmt.setTimestamp(1, bottledated);
                prepstmt.setInt(2, pot_id);
                prepstmt.executeUpdate();
                state += "Bbottleing|";
            } else
                state += "1234567890|";
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
