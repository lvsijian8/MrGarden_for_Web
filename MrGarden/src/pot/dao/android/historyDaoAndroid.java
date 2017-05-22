package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/4/18.
 */
public class historyDaoAndroid {
    public Map findHistory(int user_id, int page) {
        int next = 14;
        page = (page - 1) * next;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sqlhistory = "SELECT pot.flower_name,H.device,H.handle,H.detail,H.time " +
                "FROM history AS H left join pot ON pot.pot_id=H.pot_id WHERE H.user_id=? ORDER BY time DESC LIMIT ?,?;";
        boolean nullMark = false;
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlhistory);
            prepstmt.setInt(1, user_id);
            prepstmt.setInt(2, page);
            prepstmt.setInt(3, next);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                String detail = "";
                if (rs.getString("device") != null)
                    detail += "通过" + rs.getString("device") + ".";
                if (rs.getString("flower_name") != null)
                    detail += "对" + rs.getString("flower_name") + ".";
                if (rs.getString("handle") != null)
                    detail += "进行了" + rs.getString("handle") + "操作.";
                if (rs.getString("detail") != null)
                    detail += "操作后状态为:" + rs.getString("detail") + ".";
                Map params = new HashMap();

                params.put("pot_detail", detail);
                params.put("pot_time", rs.getTimestamp("time").toString().split("\\.")[0]);
                array.add(params);
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
