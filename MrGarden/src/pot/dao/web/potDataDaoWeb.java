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
 * Created by lvsijian8 on 2017/4/13.
 */
public class potDataDaoWeb {
    public JSONArray findPotData(int user_id, int pot_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<String> group_names = new ArrayList<String>();
        String sqlFindGroud = "SELECT group_id,group_name FROM groups WHERE user_id=?;";
        String sqlFindPots = "SELECT pot_id,flower_name FROM pot WHERE group_id=?;";
        ArrayList<Integer> pot_ids = null;
        int checked = 0;
        int group_id=0;
        String sqlFindGid="SELECT group_id FROM pot WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindGid);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                group_id=rs.getInt(1);
            }
            prepstmt = con.prepareStatement(sqlFindGroud);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                group_ids.add(rs.getInt("group_id"));
                group_names.add(rs.getString("group_name"));
            }
            params.put("group_ids", group_ids);
            params.put("group_names", group_names);
            prepstmt = con.prepareStatement(sqlFindPots);
            for (int i = 0; i < group_ids.size(); i++) {
                prepstmt.setInt(1, group_ids.get(i));
                rs = prepstmt.executeQuery();
                ArrayList<Integer> p_ids = new ArrayList<Integer>();
                ArrayList<String> p_names = new ArrayList<String>();
                while (rs.next()) {
                    int p_id = rs.getInt("pot_id");
                    String p_name = rs.getString("flower_name");
                    if (pot_id == -1)
                        pot_id = p_id;
                    if (p_id == pot_id)
                        params.put("top_name", p_name);
                    p_ids.add(p_id);
                    p_names.add(p_name);
                }
                params.put(group_names.get(i) + "_ids", p_ids);
                params.put(group_names.get(i) + "_names", p_names);
                if (group_id == group_ids.get(i)) {
                    pot_ids = p_ids;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("user_id", user_id);
        params.put("checked", checked);
        params.put("pot_ids", pot_ids);
        array.add(params);
        return array;
    }
}
