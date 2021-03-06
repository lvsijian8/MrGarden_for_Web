package pot.dao.web;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lvsijian8 on 2017/4/8.
 */
public class chartDaoWeb {
    public JSONArray findchart(int user_id, int pot_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<String> group_names = new ArrayList<String>();
        ArrayList<Double> temperature = new ArrayList<Double>();//温度
        ArrayList<Integer> humidity = new ArrayList<Integer>();//湿度
        String sqlFindGroud = "SELECT group_id,group_name FROM groups WHERE user_id=?;";
        String sqlFindPots = "SELECT pot_id,flower_name FROM pot WHERE group_id=?;";
        String sql = "SELECT out_temperature,out_humidity FROM pot_";
        String sqlFindWaterFertilizer = "SELECT now_water,now_bottle FROM pot WHERE pot_id=?;";
        String sqlFdata = "SELECT time,out_temperature,out_humidity FROM pot_";
        DateFormat dateFormat = new SimpleDateFormat("dd");//获取当前天
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindGroud);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                group_ids.add(rs.getInt("group_id"));
                group_names.add(rs.getString("group_name"));
            }
            params.put("group_ids", group_ids);
            params.put("group_names", group_names);
            prepstmt = con.prepareStatement(sqlFindPots);
            for (int i = 0; i < group_ids.size(); i++) {
                prepstmt.setInt(1, group_ids.get(i));
                rs = prepstmt.executeQuery();
                ArrayList<Integer> p_ids = new ArrayList<Integer>();
                ArrayList<String> p_names = new ArrayList<String>();
                while (rs.next()) {
                    int p_id = rs.getInt("pot_id");
                    String p_name = rs.getString("flower_name");
                    if (pot_id == -1)
                        pot_id = p_id;
                    if (p_id == pot_id)
                        params.put("top_name", p_name);
                    p_ids.add(p_id);
                    p_names.add(p_name);
                }
                params.put(group_names.get(i) + "_ids", p_ids);
                params.put(group_names.get(i) + "_names", p_names);
            }
            sql = sql + pot_id + " ORDER BY time DESC limit 0,1";
            prepstmt = con.prepareStatement(sql);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                params.put("out_t", rs.getInt(1));
                params.put("out_h", rs.getInt(2));
            }
            prepstmt = con.prepareStatement(sqlFindWaterFertilizer);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt("now_water") == 0)
                    params.put("water", 1);
                else
                    params.put("water", rs.getInt("now_water"));
                if (rs.getInt("now_bottle") == 0)
                    params.put("fertilizer", 1);
                else
                    params.put("fertilizer", rs.getInt("now_bottle"));
            }
            sqlFdata = sqlFdata + pot_id + " ORDER BY time DESC limit 0,192";
            prepstmt = con.prepareStatement(sqlFdata);
            rs = prepstmt.executeQuery();
            int outT[] = new int[30];
            int outH[] = new int[30];
            for (int j = 0, d = 0, mark = 0, yesDay = 0; rs.next() && j < 8; d++) {//近8天的数据
                int thisDay = 0;
                Date date = rs.getDate(1);
                thisDay = Integer.parseInt(dateFormat.format(date));
                if (mark == 0) {
                    yesDay = thisDay;
                    mark++;
                }
                if (yesDay != thisDay) {//下一天
                    j++;
                    yesDay = thisDay;
                    int oT = 0, oH = 0;
                    for (int k = 0; k < d; k++) {//取出今天的所有数据并平均值
                        oT += outT[k];
                        outT[k] = 0;
                        oH += outH[k];
                        outH[k] = 0;
                    }
                    humidity.add(oH / d);
                    temperature.add((oT / d) + 0.0);
                    d = 0;
                }
                outT[d] = rs.getInt(2);
                outH[d] = rs.getInt(3);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        Collections.reverse(humidity);
        Collections.reverse(temperature);
        //数据放大(25-10)/30*100
        for (int i = 0; i < temperature.size(); i++) {
            temperature.set(i, Math.floor(((temperature.get(i) - 10.0) / 30.0) * 100.0));
        }
        params.put("humidity", humidity);
        params.put("temperature", temperature);
        array.add(params);
        return array;
    }
}
