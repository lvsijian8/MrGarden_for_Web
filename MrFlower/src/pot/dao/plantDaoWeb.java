package pot.dao;

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
public class plantDaoWeb {
    public JSONArray findFirst(int page, int next) {//处理Web植物第一界面
        page=(page-1)*4;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        String sql1="select COUNT(plant_id) from plant";
        String sql = "select plant_id,chinese_name,brief,image_url from plant LIMIT ?,?";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql1);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                Map params = new HashMap();
                params.put("pageMax",((rs.getInt(1)-1)/next+1));
                array.add(params);
            }
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, page);
            prepstmt.setInt(2, next);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                Map params = new HashMap();
                params.put("plant_id", rs.getString(1));
                params.put("pic", rs.getString(4));
                params.put("namec", rs.getString(2));
                params.put("brief", rs.getString(3));
                array.add(params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return array;
    }

    public JSONArray findSecond(int id) {//处理Web植物第二界面
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        String sql = "select chinese_name,english_name,image_url,watering,sunshine,temperature_min,temperature_max,fertilizer,text from plant where plant_id=?";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                Map params = new HashMap();
                params.put("chinese_name", rs.getString(1));
                params.put("english_name", rs.getString(2));
                params.put("image_url", rs.getString(3));
                params.put("watering", rs.getString(4));
                params.put("sunshine", rs.getString(5));
                params.put("temperature_min", rs.getString(6));
                params.put("temperature_max", rs.getString(7));
                params.put("fertilizer", rs.getString(8));
                params.put("text", rs.getString(9));
                array.add(params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return array;
    }


}
