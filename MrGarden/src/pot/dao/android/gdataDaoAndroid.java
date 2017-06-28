package pot.dao.android;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/6/14.
 */
public class gdataDaoAndroid {
    public Map getgdata(int user_id, int group_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        String sqlFindGroud = "SELECT group_id FROM groups WHERE user_id=?;";
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        ArrayList<String> pot_names = new ArrayList<String>();
        String sqlFindpotId = "SELECT pot_id,flower_name FROM pot WHERE group_id=?;";
        DateFormat dateFormatyM = new SimpleDateFormat("yyyy-MM");
        DateFormat dateFormatd = new SimpleDateFormat("dd");//获取当前天
        Boolean nullMark = false;
        try {
            con = DBConnection.getDBConnection();
            if (group_id == -1) {
                prepstmt = con.prepareStatement(sqlFindGroud);
                prepstmt.setInt(1, user_id);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    group_id = rs.getInt("group_id");
                    break;
                }
            }
            prepstmt = con.prepareStatement(sqlFindpotId);
            prepstmt.setInt(1, group_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                nullMark = true;
                pot_ids.add(rs.getInt("pot_id"));
                pot_names.add(rs.getString("flower_name"));
            }
            for (int i = 0; i < pot_ids.size(); i++) {
                Map params = new HashMap();
                ArrayList<Integer> temperature = new ArrayList<Integer>();//温度
                ArrayList<Integer> days = new ArrayList<Integer>();//日期
                String month = "时间";
                String sqlFdata = "SELECT time,out_temperature FROM pot_" + pot_ids.get(i) + " ORDER BY time DESC limit 0,192";
                prepstmt = con.prepareStatement(sqlFdata);
                rs = prepstmt.executeQuery();
                int outT[] = new int[30];
                int time[] = new int[8];
                for (int j = 0, mark = 0, d = 0; rs.next() && j < 8; d++) {//近8天的数据
                    if (mark == 0) {//获取一次年份
                        Date date1 = rs.getDate(1);
                        month = dateFormatyM.format(date1);
                        mark++;
                    }
                    int thisDay = 0;
                    Date date = rs.getDate(1);
                    thisDay = Integer.parseInt(dateFormatd.format(date));
                    if (time[j] == 0) {
                        time[j] = thisDay;
                    }
                    if (time[j] != thisDay) {//下一天
                        j++;
                        if (j >= 8)
                            break;
                        time[j] = thisDay;
                        int oT = 0;
                        for (int k = 0; k < d; k++) {//取出今天的所有数据并平均值
                            oT += outT[k];
                            outT[k] = 0;
                        }
                        temperature.add(oT / d);
                        days.add(time[j - 1]);
                        d = 0;
                    }
                    outT[d] = rs.getInt(2);
                }
                params.put("days", days);
                params.put("month", month);
                params.put("name", pot_names.get(i));
                params.put("temperature", temperature);
                array.add(params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        wai.put("data", array);
        if (nullMark)
            return wai;
        else
            return null;
    }
}
