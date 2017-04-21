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
    public JSONArray findPlant() {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sql1 = "select plant_id,chinese_name from plant;";
        ArrayList<Integer> plant_ids = new ArrayList<Integer>();
        ArrayList<String> plant_names = new ArrayList<String>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql1);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                plant_ids.add(rs.getInt("plant_id"));
                plant_names.add(rs.getString("chinese_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("plant_ids", plant_ids);
        params.put("plant_names", plant_names);
        array.add(params);
        return array;
    }
}
