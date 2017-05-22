package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
public class deviceDetailDaoAndroid {
    public Map finddevice(int pot_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        Boolean nullMark = false;
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        String sql = "SELECT bottle_day,bottle_time,bottle_ml,water_day,water_time,water_ml,now_temperature,now_humidity,now_power,now_light FROM pot WHERE pot_id=?;";
        String sqlUpdataLook = "UPDATE pot SET look_time=? WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                Map params = new HashMap();
                params.put("num_bottle_day", rs.getInt(1));
                params.put("num_bottle_time", rs.getInt(2));
                params.put("num_bottle_ml", rs.getInt(3));
                params.put("num_water_day", rs.getInt(4));
                params.put("num_water_time", rs.getInt(5));
                params.put("num_water_ml", rs.getInt(6));
                params.put("temperature", rs.getInt(7));
                params.put("humidity", rs.getInt(8));
                params.put("power", rs.getInt(9));
                if (rs.getInt(10) > 70)
                    params.put("light", "强");
                else if (rs.getInt(10) > 40)
                    params.put("light", "适中");
                else
                    params.put("light", "弱");
                array.add(params);
            }
            prepstmt = con.prepareStatement(sqlUpdataLook);
            prepstmt.setTimestamp(1, now);
            prepstmt.setInt(2, pot_id);
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        wai.put("data", array);
        if (nullMark)
            return wai;
        else
            return null;
    }
}
