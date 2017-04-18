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
    public JSONArray findPotData(int pot_id, int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        ArrayList<String> pot_names = new ArrayList<String>();
        int checked = 0;
        String sqlFindPotName = "SELECT flower_name FROM pot WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            boolean isKong = true;
            while (rs.next()) {
                pot_ids.add(rs.getInt("pot_id"));
                isKong = false;
            }
            if (isKong)
                return null;
            prepstmt = con.prepareStatement(sqlFindPotName);
            for (int i = 0; i < pot_ids.size(); i++) {
                if (pot_ids.get(i) == pot_id)
                    checked = i;
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    pot_names.add(rs.getString("flower_name"));
                }
            }
            if (pot_id == -1) {
                checked = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("user_id", user_id);
        params.put("checked", checked);
        params.put("pot_names", pot_names);
        params.put("pot_ids", pot_ids);
        array.add(params);
        return array;
    }
}
