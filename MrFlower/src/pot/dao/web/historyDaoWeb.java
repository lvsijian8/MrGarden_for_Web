package pot.dao.web;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/17.
 */
public class historyDaoWeb {
    public JSONArray findHistory(int user_id, String pot_id, String pot_device, String pot_handle, int page, int next) {
        page = (page - 1) * next;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sqlFindName = "SELECT pot.pot_id,pot.flower_name FROM user_pot left join pot ON pot.pot_id=user_pot.pot_id WHERE user_id=?;";
        //String sqlhistory = "SELECT " +
        //        "FROM history AS H left join pot ON pot.pot_id=H.pot_id WHERE H.user_id=?";
        String sqlhistory = "SELECT COUNT(H.user_id) " +
                "FROM history AS H left join pot ON pot.pot_id=H.pot_id WHERE H.user_id=?";

        boolean mark = true;
        if (pot_handle.equals("login") || pot_handle.equals("signup") || pot_handle.equals("delete_pot")) {
            //sqlhistory = "SELECT device,handle,detail,time FROM history WHERE user_id=?";
            sqlhistory = "SELECT COUNT(user_id) FROM history WHERE user_id=?";
            mark = false;
        }
        if (mark) {
            if (!pot_id.equals("-1"))
                sqlhistory += " AND H.pot_id=?";
            if (!pot_device.equals("-1"))
                sqlhistory += " AND H.device=?";
            if (!pot_handle.equals("-1"))
                sqlhistory += " AND H.handle=?";
        } else {
            if (!pot_id.equals("-1"))
                sqlhistory += " AND pot_id=?";
            if (!pot_device.equals("-1"))
                sqlhistory += " AND device=?";
            if (!pot_handle.equals("-1"))
                sqlhistory += " AND handle=?";
        }
        sqlhistory += " ORDER BY time DESC ;";
        ArrayList<String> pot_names = new ArrayList<String>();
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        ArrayList<String> pot_details = new ArrayList<String>();
        ArrayList<String> pot_times = new ArrayList<String>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindName);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                pot_ids.add(rs.getInt("pot_id"));
                pot_names.add(rs.getString("flower_name"));
            }

            prepstmt = con.prepareStatement(sqlhistory);
            prepstmt.setInt(1, user_id);
            int leng = 1;
            if (!pot_id.equals("-1")) {
                leng++;
                prepstmt.setInt(leng, Integer.parseInt(pot_id));
            }
            if (!pot_device.equals("-1")) {
                leng++;
                prepstmt.setString(leng, pot_device);
            }
            if (!pot_handle.equals("-1")) {
                leng++;
                prepstmt.setString(leng, pot_handle);
            }
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                params.put("pageMax", ((rs.getInt(1) - 1) / next + 1));//计算最大页数
            }

            if (mark) {
                sqlhistory = sqlhistory.replace("COUNT(H.user_id) ", "pot.flower_name,H.device,H.handle,H.detail,H.time ");
            } else {
                sqlhistory = sqlhistory.replace("COUNT(user_id) ", "device,handle,detail,time ");
            }
            sqlhistory = sqlhistory.replace(";", "LIMIT ?,?;");
            prepstmt = con.prepareStatement(sqlhistory);
            prepstmt.setInt(1, user_id);
            leng = 1;
            if (!pot_id.equals("-1")) {
                leng++;
                prepstmt.setInt(leng, Integer.parseInt(pot_id));
            }
            if (!pot_device.equals("-1")) {
                leng++;
                prepstmt.setString(leng, pot_device);
            }
            if (!pot_handle.equals("-1")) {
                leng++;
                prepstmt.setString(leng, pot_handle);
            }
            leng++;
            prepstmt.setInt(leng, page);
            leng++;
            prepstmt.setInt(leng, next);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                String detail = "";
                if (rs.getString("device") != null)
                    detail += "通过" + rs.getString("device") + ".";
                if (mark && rs.getString("flower_name") != null)
                    detail += "对" + rs.getString("flower_name") + ".";
                if (rs.getString("handle") != null)
                    detail += "进行了" + rs.getString("handle") + "操作.";
                if (rs.getString("detail") != null)
                    detail += "操作后状态为:" + rs.getString("detail") + ".";
                pot_details.add(detail);
                pot_times.add(rs.getTimestamp("time").toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("pot_names", pot_names);
        params.put("pot_ids", pot_ids);
        params.put("pot_details", pot_details);
        params.put("pot_times", pot_times);
        array.add(params);
        return array;
    }
}
