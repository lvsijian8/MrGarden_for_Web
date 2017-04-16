package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/4/6.
 */
public class appendDaoAndroid {
    public String append(int user_id,int fid,String fname,int bday,int bbtime,int bml,int wday,int wtime,int wml){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state=0,pot_id=0;
        String sql="INSERT INTO pot (fid, flower_name, bottle_day, bottle_time, bottle_ml, water_day,water_time, water_ml) VALUES(?,?,?,?,?,?,?,?);";
        String sqlFind="select MAX(pot_id) from pot where fid=? AND flower_name=? AND bottle_day=? AND bottle_time=? AND bottle_ml=? AND water_day=? AND water_time=? AND water_ml=?;";
        String sqlPot="INSERT INTO user_pot (user_id,pot_id) VALUES(?,?);";
        String sqlAddHistory="INSERT INTO history (pot_id, user_id, device, time, handle,detail) VALUES(?,?,?,?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, fid);
            prepstmt.setString(2, fname);
            prepstmt.setInt(3, bday);
            prepstmt.setInt(4, bbtime);
            prepstmt.setInt(5, bml);
            prepstmt.setInt(6, wday);
            prepstmt.setInt(7, wtime);
            prepstmt.setInt(8, wml);
            prepstmt.executeUpdate();
            prepstmt=con.prepareStatement(sqlFind);
            prepstmt.setInt(1, fid);
            prepstmt.setString(2, fname);
            prepstmt.setInt(3, bday);
            prepstmt.setInt(4, bbtime);
            prepstmt.setInt(5, bml);
            prepstmt.setInt(6, wday);
            prepstmt.setInt(7, wtime);
            prepstmt.setInt(8, wml);
            rs=prepstmt.executeQuery();
            while(rs.next()){
                pot_id=rs.getInt(1);
            }
            prepstmt = con.prepareStatement(sqlPot);
            prepstmt.setInt(1,user_id);
            prepstmt.setInt(2,pot_id);
            state=prepstmt.executeUpdate();
            String sqlTable="CREATE TABLE `flowerpot`.`pot_"+pot_id+"` (" +
                    "`time` datetime NOT NULL," +
                    "`out_temperature` int(3) DEFAULT NULL," +
                    "`out_humidity` int(3) DEFAULT NULL," +
                    "`in_humidity` int(3) DEFAULT NULL," +
                    "`water` int(5) DEFAULT NULL," +
                    "`light` int(4) DEFAULT NULL," +
                    "`fertilizer` int(5) DEFAULT NULL," +
                    "PRIMARY KEY (`time`)" +
                    ") DEFAULT CHARACTER SET utf8 COMMENT='';";
            prepstmt = con.prepareStatement(sqlTable);
            prepstmt.executeUpdate();
            prepstmt = con.prepareStatement(sqlAddHistory);
            prepstmt.setInt(1,pot_id);
            prepstmt.setInt(2,user_id);
            prepstmt.setString(3,"android");
            prepstmt.setTimestamp(4,now);
            prepstmt.setString(5,"add_pot");
            prepstmt.setString(6,"本次创建花盆名称为:"+fname+",施肥间隔:"+bday+"天,施肥时间:"+bbtime+"点,施肥量:"+bml+"ml,浇水间隔:"+wday+",浇水时间:"+wtime+",浇水量:"+wml);
            prepstmt.executeUpdate();
        }catch (SQLException e){e.printStackTrace();}
        finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        if(state==1)
            return "success";
        else
            return "error";
    }
}
