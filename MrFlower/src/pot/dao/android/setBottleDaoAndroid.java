package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/4/16.
 */
public class setBottleDaoAndroid {
    public int setBottle(int user_id,int pot_id,int bday,int btime,int bml){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state=0;
        String sql="UPDATE pot SET bottle_day=?,bottle_time=?,bottle_ml=? WHERE pot_id=?;";
        String sqlAddHistory="INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, bday);
            prepstmt.setInt(2, btime);
            prepstmt.setInt(3, bml);
            prepstmt.setInt(4, pot_id);
            if(prepstmt.executeUpdate()!=0){
                state=1;
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1,pot_id);
                prepstmt.setInt(2,user_id);
                prepstmt.setString(3,"web");
                prepstmt.setTimestamp(4,now);
                prepstmt.setString(5,"set");
                prepstmt.setString(6,"修改施肥设置:施肥间隔为"+bday+"天,施肥时间为:"+btime+"点,施肥量为:"+bml+"ml.");
            }
        }catch (SQLException e){e.printStackTrace();}
        finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
