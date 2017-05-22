package pot.dao.arduino;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/4/19.
 */
public class lookUpdataDao {
    public void lookUpdata(int pot_id, int now_temperature, int now_humidity, int now_power, int now_light) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String sqllookUpdata = "UPDATE pot SET now_temperature=?,now_humidity=?,now_power=?,now_light=? WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqllookUpdata);
            prepstmt.setInt(1, now_temperature);
            prepstmt.setInt(2, now_humidity);
            prepstmt.setInt(3, now_power);
            prepstmt.setInt(4, now_light);
            prepstmt.setInt(5, pot_id);
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
    }
}
