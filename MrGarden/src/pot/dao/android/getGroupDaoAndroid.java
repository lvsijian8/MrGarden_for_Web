package pot.dao.android;

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
 * Created by lvsijian8 on 2017/6/13.
 */
public class getGroupDaoAndroid {
    public Map findGroup(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sqlGroupName="SELECT group_id,group_name FROM groups WHERE user_id=?;";
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<String> group_names = new ArrayList<String>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlGroupName);
            prepstmt.setInt(1,user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()){
                Map params = new HashMap();
                nullMark=true;
                params.put("group_id",rs.getInt("group_id"));
                params.put("group_name",rs.getString("group_name"));
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
