package pot.dao;

import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lvsijian8 on 2017/4/6.
 */
public class appendDaoAndroid {
    public int append(int fid,String fname,int bday,int bbtime,int bml,int wday,int wtime,int wml){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state=0;
        con = DBConnection.getDBConnection();
        String sql="INSERT INTO pot (fid, flower_name, bottle_day, bottle_time, bottle_ml, water_day,water_time, water_ml) VALUES(?,?,?,?,?,?,?,?)";
        try {
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, fid);
            prepstmt.setString(2, fname);
            prepstmt.setInt(3, bday);
            prepstmt.setInt(4, bbtime);
            prepstmt.setInt(5, bml);
            prepstmt.setInt(6, wday);
            prepstmt.setInt(7, wtime);
            prepstmt.setInt(8, wml);
            state=prepstmt.executeUpdate();
        }catch (SQLException e){e.printStackTrace();}
        finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
