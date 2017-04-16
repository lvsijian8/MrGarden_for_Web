package pot.dao.android;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/3/27.
 */
public class signupDaoAndroid {
    public String writeUser(String user_name,String user_pwd,String user_phone) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        String state="";
        Boolean isAlready=false;
        String sqlAlready = "Select count(user_name) FROM user where user_name=?";
        String sql="INSERT INTO user (user_name,user_pwd,user_phone) VALUES (?,?,?)";
        String sqlFind="select user_id from user where user_name=?";
        String sqlAddHistory="INSERT INTO history (user_id, time, handle) VALUES(?,?,?);";
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlAlready);
            prepstmt.setString(1, user_name);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt(1)!=0){
                    isAlready=true;
                    state="-1";//用户已存在
                }
            }
            if(!isAlready){
                prepstmt = con.prepareStatement(sql);
                prepstmt.setString(1, user_name);
                prepstmt.setString(2, user_pwd);
                prepstmt.setString(3, user_phone);
                prepstmt.executeUpdate();
                prepstmt=con.prepareStatement(sqlFind);
                prepstmt.setString(1,user_name);
                rs=prepstmt.executeQuery();
                while(rs.next()){
                    state=""+rs.getInt(1);
                }
                prepstmt = con.prepareStatement(sqlAddHistory);
                prepstmt.setInt(1,Integer.parseInt(state));
                prepstmt.setTimestamp(2,now);
                prepstmt.setString(3,"signup");
                prepstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
            return state;
    }
}
