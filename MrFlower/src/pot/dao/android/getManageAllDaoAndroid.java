package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/5/12.
 */
public class getManageAllDaoAndroid {
    public Map findAllPot(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        Timestamp date = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        String sqlFindPotName = "SELECT flower_name,heartBeat_time,now_water,now_bottle FROM pot WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                pot_ids.add(rs.getInt("pot_id"));
            }
            prepstmt = con.prepareStatement(sqlFindPotName);
            for (int i = 0; i < pot_ids.size(); i++) {
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    Map params = new HashMap();
                    params.put("pot_id", pot_ids.get(i));
                    params.put("pot_names", rs.getString("flower_name"));
                    params.put("pot_waters", rs.getInt("now_water"));
                    params.put("pot_bottles", rs.getInt("now_bottle"));
                    params.put("pot_online", 0);
                    date = rs.getTimestamp("heartBeat_time");
                    if (date == null)
                        date = new Timestamp(new java.util.Date().getTime() - 10000);
                    if (((now.getTime() - date.getTime()) / 1000) > 5)
                        params.put("pot_online", 0);
                    else
                        params.put("pot_online", 1);
                    array.add(params);
                }
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