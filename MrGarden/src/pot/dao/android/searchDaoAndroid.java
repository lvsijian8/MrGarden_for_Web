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
 * Created by lvsijian8 on 2017/4/11.
 */
public class searchDaoAndroid {
    public Map searchplant(String flower_name) {//处理安卓植物第一界面
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sql = "select plant_id,chinese_name,english_name,image_url from plant WHERE chinese_name like '%" + flower_name + "%'";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
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
}
