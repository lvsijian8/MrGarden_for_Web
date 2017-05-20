package pot.dao.web;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
public class checkLoginDaoWeb {
    public Boolean checkLogin(int user_id, String user_name) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Boolean stats = false;
        String sql = "SELECT COUNT(user_id) FROM user WHERE user_id=? AND user_name=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, user_id);
            prepstmt.setString(2, user_name);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if (1 == rs.getInt(1))
                    stats = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return stats;
    }
}
