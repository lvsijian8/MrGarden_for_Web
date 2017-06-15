package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
public class deviceDaoAndroid {
    public Map finddevice(int user_id, int group_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sqlFindGroud = "SELECT group_id FROM groups WHERE user_id=?;";
        String sqlState = "SELECT pot_id,flower_name,heartBeat_time,now_power,now_light FROM pot WHERE group_id=?;";
        String sqlUpdataLook = "UPDATE pot SET look_time=? WHERE pot_id=?;";
        Timestamp date = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        Boolean nullMark = false;
        try {
            con = DBConnection.getDBConnection();
            if (group_id == -1) {
                prepstmt = con.prepareStatement(sqlFindGroud);
                prepstmt.setInt(1, user_id);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    group_id = rs.getInt("group_id");
                    break;
                }
            }
            prepstmt = con.prepareStatement(sqlState);
            prepstmt.setInt(1, group_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                Map params = new HashMap();
                params.put("name", rs.getString("flower_name"));
                date = rs.getTimestamp("heartBeat_time");
                params.put("power", rs.getInt("now_power"));
                if (rs.getInt("now_light") > 600)
                    params.put("warning", "近期光照过强");
                else if (rs.getInt("now_light") < 300)
                    params.put("warning", "近期光照过弱");
                else
                    params.put("warning", "近期光照正常");
                if (date == null)
                    date = new Timestamp(new java.util.Date().getTime() - 10000);
                if (((now.getTime() - date.getTime()) / 1000) > 5)
                    params.put("state", 0);
                else
                    params.put("state", 1);
                params.put("pot_id", rs.getInt("pot_id"));
                array.add(params);
                prepstmt = con.prepareStatement(sqlUpdataLook);
                prepstmt.setTimestamp(1, now);
                prepstmt.setInt(2, rs.getInt("pot_id"));
                prepstmt.executeUpdate();
            }
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
