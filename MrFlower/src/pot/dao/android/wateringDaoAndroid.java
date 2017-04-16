package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class wateringDaoAndroid {
    public int watering(int user_id,int pot_id) {
        int state = 0;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        String sql = "SELECT water_ml FROM pot WHERE pot_id=?;";
        int water=0;
        String sqlFindWater = "SELECT water FROM pot_"+pot_id+" ORDER BY time DESC limit 0,1;";
        String sqltime = "UPDATE pot SET watering_time=? WHERE pot_id=?;";
        String sqlUpdataWater="update pot_"+pot_id+" set water=? where time=(select max(time) FROM (SELECT time FROM pot_1) AS something);";
        String sqlAddHistory="INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                water=rs.getInt("water_ml");
            }
            prepstmt = con.prepareStatement(sqlFindWater);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                water=rs.getInt("water")-(int)((water*1.0)/12.18);
            }
            if(water<=0)
                return -1;
            prepstmt = con.prepareStatement(sqltime);
            prepstmt.setTimestamp(1,now);
            prepstmt.setInt(2, pot_id);
            if(prepstmt.executeUpdate()!=0)
                state=1;
            else
                state=0;
            prepstmt = con.prepareStatement(sqlUpdataWater);
            prepstmt.setInt(1, water);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlAddHistory);
            prepstmt.setInt(1,pot_id);
            prepstmt.setInt(2,user_id);
            prepstmt.setString(3,"android");
            prepstmt.setTimestamp(4,now);
            prepstmt.setString(5,"watering");
            prepstmt.setString(6,"浇水完成后剩余"+water+"%");
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
