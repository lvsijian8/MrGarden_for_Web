package pot.dao;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
public class setTimeDaoWeb {
    public String setTime(int pot_id,String type,int day,int time,int ml){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String state="",sql="";
        if(type.equals("w"))
            sql="UPDATE pot SET water_day=?,water_time=?,water_ml=? WHERE pot_id=?;";
        else
            sql="UPDATE pot SET bottle_day=?,bottle_time=?,bottle_ml=? WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, day);
            prepstmt.setInt(2, time);
            prepstmt.setInt(3, ml);
            prepstmt.setInt(4, pot_id);
            if(prepstmt.executeUpdate()!=0)
                state="设置成功.";
            else
                state="设置失败,请重新设置.";
        }catch (SQLException e){e.printStackTrace();}
        finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
