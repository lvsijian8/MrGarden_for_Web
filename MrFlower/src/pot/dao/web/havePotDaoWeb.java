package pot.dao.web;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
public class havePotDaoWeb {
    public Boolean havePot(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Boolean stats=false;
        String sql="SELECT COUNT(pot_id) FROM user_pot WHERE user_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt(1)>0)
                    stats=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return stats;
    }
}
