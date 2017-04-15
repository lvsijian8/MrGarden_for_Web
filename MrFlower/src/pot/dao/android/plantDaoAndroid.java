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
 * Created by lvsijian8 on 2017/3/26.
 */
public class plantDaoAndroid {
    public Map findFirst(int id, int next) {//处理安卓植物第一界面
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sql = "select plant_id,chinese_name,english_name,image_url from plant LIMIT ?,?";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, id);
            prepstmt.setInt(2, next);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                Map params = new HashMap();
                params.put("fid", rs.getInt(1));
                params.put("pic", rs.getString(4));
                params.put("namec", rs.getString(2));
                params.put("namee", rs.getString(3));
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

    public Map findSecond(int id) {//安卓
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sql = "select chinese_name,english_name,watering,sunshine,temperature_min,temperature_max,fertilizer,text,brief from plant where plant_id=?";
        Boolean nullMark=false;
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark=true;
                Map params = new HashMap();
                params.put("chinese_name", rs.getString(1));
                params.put("english_name", rs.getString(2));
                params.put("watering", "/water_"+rs.getString(3)+".png");
                params.put("sunshine", "/sun_"+rs.getString(4)+".png");
                params.put("temperature_min", Integer.parseInt(rs.getString(5)));
                params.put("temperature_max", Integer.parseInt(rs.getString(6)));
                params.put("fertilizer", "/ye_"+rs.getString(7)+".png");
                params.put("text", rs.getString(8));
                params.put("brief", rs.getString(9));
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
