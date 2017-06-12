package pot.dao.web;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/6/12.
 */
public class deleteGroupDaoWeb {
    public int deleteGroup(int user_id, int group_id) {
        int state = -1;
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp now = new Timestamp(new Date().getTime());
        String sqlFindPot = "SELECT COUNT(pot_id) FROM pot WHERE group_id=?;";
        String sqlFindGroupName = "SELECT group_name FROM groups WHERE group_id=?;";
        String sqldelete = "DELETE FROM groups WHERE group_id=?;";
        String sqlAddHistory = "INSERT INTO history (user_id, device, time, handle,detail) VALUES(?,?,?,?,?);";
        String group_name = "";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPot);
            prepstmt.setInt(1, group_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                state = rs.getInt("COUNT(pot_id)");
            }
            if (state == 0) {
                prepstmt = con.prepareStatement(sqlFindGroupName);
                prepstmt.setInt(1, group_id);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    group_name = rs.getString("group_name");
                }
                prepstmt = con.prepareStatement(sqldelete);
                prepstmt.setInt(1, group_id);
                state = prepstmt.executeUpdate();
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1, user_id);
                prepstmt.setString(2, "web");
                prepstmt.setTimestamp(3, now);
                prepstmt.setString(4, "delete_pot");
                prepstmt.setString(5, "被删除的组为:" + group_name);
                prepstmt.executeUpdate();
            } else
                state = -2;
        } catch (Exception e) {
            System.out.println("<<<删除组出错.");
            e.printStackTrace();
            System.out.println("删除组出错.>>>");
            state = 0;
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
            return state;
        }
    }
}
