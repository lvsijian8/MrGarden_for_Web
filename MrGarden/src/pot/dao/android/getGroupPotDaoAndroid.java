package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/6/13.
 */
public class getGroupPotDaoAndroid {
    public Map findGroupPot(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        boolean nullMark = false;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sqlGroupName="SELECT group_id,group_name FROM groups WHERE user_id=?;";
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<Integer> group_index = new ArrayList<Integer>();
        String sqlFindPots = "SELECT pot_id,flower_name,heartBeat_time FROM pot WHERE group_id=?;";
        int index_id=1;
        Timestamp date = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlGroupName);
            prepstmt.setInt(1,user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()){//parent
                Map params = new HashMap();
                nullMark=true;
                params.put("it_id",rs.getInt("group_id"));
                params.put("names",rs.getString("group_name"));
                params.put("parentId",0);
                group_index.add(index_id);
                params.put("_id",index_id++);
                params.put("state", 0);
                array.add(params);
                group_ids.add(rs.getInt("group_id"));
            }
            prepstmt = con.prepareStatement(sqlFindPots);
            for (int i=0;i<group_ids.size();i++){
                prepstmt.setInt(1,group_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()){
                    Map params = new HashMap();
                    date = rs.getTimestamp("heartBeat_time");
                    params.put("it_id",rs.getInt("pot_id"));
                    params.put("names",rs.getString("flower_name"));
                    params.put("parentId",group_index.get(i));
                    params.put("_id",index_id++);
                    if (date == null)
                        date = new Timestamp(new java.util.Date().getTime() - 10000);
                    if (((now.getTime() - date.getTime()) / 1000) > 5)
                        params.put("state", 0);
                    else
                        params.put("state", 1);
                    array.add(params);
                }
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
