package pot.dao.web;

import pot.util.DBConnection;

import java.sql.*;
import java.util.*;

/**
 * Created by lvsijian8 on 2017/4/15.
 */
public class setTimeDaoWeb {
    public String setTime(int user_id,int pot_id,String type,int day,int time,int ml){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String state="",sql="";
        String sqlAddHistory="INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        if(type.equals("w"))
            sql="UPDATE pot SET water_day=?,water_time=?,water_ml=? WHERE pot_id=?;";
        else
            sql="UPDATE pot SET bottle_day=?,bottle_time=?,bottle_ml=? WHERE pot_id=?;";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, day);
            prepstmt.setInt(2, time);
            prepstmt.setInt(3, ml);
            prepstmt.setInt(4, pot_id);
            if(prepstmt.executeUpdate()!=0){
                state="设置成功.";
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1,pot_id);
                prepstmt.setInt(2,user_id);
                prepstmt.setString(3,"web");
                prepstmt.setTimestamp(4,now);
                prepstmt.setString(5,"set");
                prepstmt.setString(6,"修改设置:间隔为"+type+"天,时间为:"+day+",time:"+time+"点,量为:"+ml+"ml");
                prepstmt.executeUpdate();
            }
            else
                state="设置失败,请重新设置.";
        }catch (SQLException e){e.printStackTrace();}
        finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
