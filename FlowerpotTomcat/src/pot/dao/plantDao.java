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
 * Created by lvsijian8 on 2017/3/25.
 */
public class plantDao {
    public Map findById(int id, int next) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        con = DBConnection.getDBConnection();
        String sql = "select * from plant plant_id LIMIT ?,?";
        try {
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
}
