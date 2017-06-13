package pot.dao.web;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
public class havePotDaoWeb {
    public Boolean havePot(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Boolean stats = false;
        String sqlGroup="SELECT group_id FROM groups WHERE user_id=?;";
        String sqlPot="SELECT pot_id FROM pot WHERE group_id=?;";
        ArrayList<Integer> group_ids=new ArrayList<Integer>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlGroup);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()){
                group_ids.add(rs.getInt(1));
            }
            prepstmt = con.prepareStatement(sqlPot);
            for (int pot_id:group_ids){
                prepstmt.setInt(1,pot_id);
                rs = prepstmt.executeQuery();
                while (rs.next()){
                    stats=true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return stats;
    }
}
