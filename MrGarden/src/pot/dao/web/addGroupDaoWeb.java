package pot.dao.web;

import pot.util.DBConnection;

import java.sql.*;

/**
 * Created by lvsijian8 on 2017/6/12.
 */
public class addGroupDaoWeb {
    public int addGroup(int user_id, String group_name, String group_text) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        int state = -1;//组名重复
        String sql="INSERT INTO groups (group_name,group_text,user_id) VALUES(?,?,?);";
        String sqlGroupName="SELECT COUNT(group_id) FROM groups WHERE user_id=? AND group_name=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlGroupName);
            prepstmt.setInt(1,user_id);
            prepstmt.setString(2,group_name);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT(group_id)")==0){
                    state=0;//更新失败请重试
                }
            }
            if (state==0){
                prepstmt = con.prepareStatement(sql);
                prepstmt.setString(1,group_name);
                prepstmt.setString(2,group_text);
                prepstmt.setInt(3, user_id);
                state=prepstmt.executeUpdate();//==1成功
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        return state;
    }
}
