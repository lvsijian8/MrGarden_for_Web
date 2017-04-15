package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.*;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
public class deviceDaoAndroid {
    public Map finddevice(int user_id){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        int pot_ids[] = new int[50];//同一用户花盆最大不超过50个
        int leng = 0;
        String flower_name = "";
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        String sqlFindPotName = "SELECT flower_name FROM pot WHERE pot_id=?;";
        String sqlState = "SELECT heartBeat_time,now_power,now_light FROM pot WHERE pot_id=?;";
        String sqlUpdataLook="UPDATE pot SET look_time=? WHERE pot_id=?;";
        Timestamp date = null;
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        Boolean nullMark=false;
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            for (int i = 0; rs.next(); i++) {
                pot_ids[i] = rs.getInt("pot_id");
                leng++;
                nullMark=true;
            }
            for (int i = 0; i < leng; i++) {
                Map params = new HashMap();
                flower_name = "";
                prepstmt = con.prepareStatement(sqlFindPotName);
                prepstmt.setInt(1, pot_ids[i]);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    flower_name = rs.getString("flower_name");
                }
                prepstmt = con.prepareStatement(sqlState);
                prepstmt.setInt(1, pot_ids[i]);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    date = rs.getTimestamp("heartBeat_time");
                    params.put("power",rs.getInt("now_power"));
                    if (rs.getInt("now_light") > 500)
                        params.put("warning","近期光照过强.");
                    else
                        params.put("warning","近期光照过弱.");
                }
                if (((now.getTime() - date.getTime()) / 1000) > 5)
                    params.put("state",0);
                else
                    params.put("state",1);
                params.put("pot_id",pot_ids[i]);
                params.put("name",flower_name);
                array.add(params);
                prepstmt = con.prepareStatement(sqlUpdataLook);
                prepstmt.setTimestamp(1,now);
                prepstmt.setInt(2, pot_ids[i]);
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
