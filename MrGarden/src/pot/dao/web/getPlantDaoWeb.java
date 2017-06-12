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
 * Created by lvsijian8 on 2017/4/18.
 */
public class getPlantDaoWeb {
    public JSONArray findPlant(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sql1 = "select plant_id,chinese_name from plant;";
        String sqlGroupName="SELECT group_id,group_name FROM groups WHERE user_id=?;";
        ArrayList<Integer> plant_ids = new ArrayList<Integer>();
        ArrayList<String> plant_names = new ArrayList<String>();
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<String> group_names = new ArrayList<String>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql1);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                plant_ids.add(rs.getInt("plant_id"));
                plant_names.add(rs.getString("chinese_name"));
            }
            prepstmt = con.prepareStatement(sqlGroupName);
            prepstmt.setInt(1,user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()){
                group_ids.add(rs.getInt("group_id"));
                group_names.add(rs.getString("group_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("group_ids",group_ids);
        params.put("group_names",group_names);
        params.put("plant_ids", plant_ids);
        params.put("plant_names", plant_names);
        array.add(params);
        return array;
    }
}
