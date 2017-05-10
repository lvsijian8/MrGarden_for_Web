package pot.dao.web;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/5/6.
 */
public class getUserDaoWeb {
    public String getUser(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String phone="";
        String sql="SELECT user_name,user_phone FROM user WHERE user_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                phone += rs.getString(1)+"|";
                phone += rs.getString(2)+"|";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return phone;
    }
}
