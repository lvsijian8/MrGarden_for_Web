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
 * Created by lvsijian8 on 2017/6/6.
 */
public class chartGroupDaoWeb {
    public JSONArray findchartGroup(int user_id, int group_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map hands = new HashMap();
        ArrayList<Integer> group_ids = new ArrayList<Integer>();
        ArrayList<String> group_names = new ArrayList<String>();
        String sqlFindGroud = "SELECT group_id,group_name FROM groups WHERE user_id=?;";
        String sqlFindPots = "SELECT pot_id,flower_name FROM pot WHERE group_id=?;";

        ArrayList<Integer> pot_ids = null;
        String sqlFindWaterFertilizer = "SELECT now_water,now_bottle FROM pot WHERE pot_id=?;";
        ArrayList<Map> potsdata = new ArrayList<Map>();
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindGroud);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                int g_id = rs.getInt("group_id");
                String g_name = rs.getString("group_name");
                if (group_id == -1)
                    group_id = g_id;
                if (g_id == group_id)
                    hands.put("top_name", g_name);
                group_ids.add(g_id);
                group_names.add(g_name);
            }
            hands.put("group_ids", group_ids);
            hands.put("group_names", group_names);
            prepstmt = con.prepareStatement(sqlFindPots);
            for (int i = 0; i < group_ids.size(); i++) {
                prepstmt.setInt(1, group_ids.get(i));
                rs = prepstmt.executeQuery();
                ArrayList<Integer> p_ids = new ArrayList<Integer>();
                ArrayList<String> p_names = new ArrayList<String>();
                while (rs.next()) {
                    p_ids.add(rs.getInt("pot_id"));
                    p_names.add(rs.getString("flower_name"));
                }
                hands.put(group_names.get(i) + "_ids", p_ids);
                hands.put(group_names.get(i) + "_names", p_names);
                if (group_id == group_ids.get(i)) {
                    pot_ids = p_ids;
                }
            }
            array.add(hands);//将下拉列表的groud pot 的id name存入hands
            for (int i = 0; i < pot_ids.size(); i++) {
                Map pots = new HashMap();
                prepstmt = con.prepareStatement(sqlFindWaterFertilizer);
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    pots.put("water", rs.getInt("now_water"));
                    pots.put("fertilizer", rs.getInt("now_bottle"));
                }
                array.add(pots);
            }
            for (int i = 0; i < pot_ids.size(); i++) {
                DateFormat dateFormaty = new SimpleDateFormat("yyyy-MM-dd");
                ArrayList<Integer> humidity = new ArrayList<Integer>();//湿度
                ArrayList<Integer> temperature = new ArrayList<Integer>();//温度
                ArrayList<String> days = new ArrayList<String>();//日期
                String sqlFdata = "SELECT time,out_temperature,out_humidity FROM pot_" + pot_ids.get(i) + " ORDER BY time DESC limit 0,720";
                prepstmt = con.prepareStatement(sqlFdata);
                rs = prepstmt.executeQuery();
                int outT[] = new int[30];
                int outH[] = new int[30];
                String time[] = new String[30];
                humidity.clear();
                temperature.clear();
                days.clear();
                String thisDay = "时间";
                for (int j = 0, d = 0; rs.next() && j < 30; d++) {//近30天的数据
                    Date date = rs.getDate(1);
                    if (j == 0 && d == 0) {
                        days.add(dateFormaty.format(date));
                    }
                    if (rs.isLast() || !dateFormaty.format(date).equals(days.get(j))) {
                        j++;
                        days.add(dateFormaty.format(date));
                        if (j >= 30)
                            break;
                        int oT = 0, oH = 0;
                        for (int k = 0; k < d; k++) {//取出今天的所有数据并平均值
                            oT += outT[k];
                            outT[k] = 0;
                            oH += outH[k];
                            outH[k] = 0;
                        }
                        humidity.add(oH / d);
                        temperature.add(oT / d);
                        d = 0;
                    }
                    outT[d] = rs.getInt(2);
                    outH[d] = rs.getInt(3);
                }
                Map potdata = new HashMap();
                Collections.reverse(humidity);
                Collections.reverse(temperature);
                Collections.reverse(days);
                potdata.put("humidity", humidity);
                potdata.put("temperature", temperature);
                potdata.put("days", days);
                potsdata.add(potdata);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        ArrayList<Map> potsEndData = new ArrayList<Map>();
        ArrayList<String> EndDays = new ArrayList<String>();//日期
        Map potEndDate = new HashMap();
        potEndDate.put("EndDays", EndDays);
        potsEndData.add(potEndDate);
        for (int i = 0; i < potsdata.size(); i++) {
            Map potEndData = new HashMap();
            ArrayList<Integer> humidity = new ArrayList<Integer>();//湿度
            ArrayList<Integer> temperature = new ArrayList<Integer>();//温度
            potEndData.put("humidity", humidity);
            potEndData.put("temperature", temperature);
            potsEndData.add(potEndData);
        }
        while (!potsdata.isEmpty()) {
            int minIndex = -1;
            String minDate = "9999-99-99";
            for (int i = 0; i < potsdata.size(); i++) {
                if (minDate.compareTo(((ArrayList<String>) potsdata.get(i).get("days")).get(0)) > 0) {
                    minDate = ((ArrayList<String>) potsdata.get(i).get("days")).get(0);
                    minIndex = i;
                }
            }
            if (((ArrayList<String>) potsEndData.get(0).get("EndDays")).isEmpty() || !((ArrayList<String>) potsEndData.get(0).get("EndDays")).get(((ArrayList<String>) potsEndData.get(0).get("EndDays")).size() - 1).equals(((ArrayList<String>) potsdata.get(minIndex).get("days")).get(0))) {
                ((ArrayList<String>) potsEndData.get(0).get("EndDays")).add(((ArrayList<String>) potsdata.get(minIndex).get("days")).get(0));
                ((ArrayList<String>) potsdata.get(minIndex).get("days")).remove(0);
                for (int i = 1; i < potsEndData.size(); i++) {
                    ((ArrayList<Integer>) potsEndData.get(i).get("humidity")).add(-9999);
                    ((ArrayList<Integer>) potsEndData.get(i).get("temperature")).add(-9999);
                }
            }
            else if (!((ArrayList<String>) potsEndData.get(0).get("EndDays")).isEmpty()){
                ((ArrayList<String>) potsdata.get(minIndex).get("days")).remove(0);
            }
            ((ArrayList<Integer>) potsEndData.get(minIndex + 1).get("humidity")).set(((ArrayList<Integer>) potsEndData.get(minIndex + 1).get("humidity")).size() - 1, ((ArrayList<Integer>) potsdata.get(minIndex).get("humidity")).get(0));
            ((ArrayList<Integer>) potsEndData.get(minIndex + 1).get("temperature")).set(((ArrayList<Integer>) potsEndData.get(minIndex + 1).get("temperature")).size() - 1, ((ArrayList<Integer>) potsdata.get(minIndex).get("temperature")).get(0));
            ((ArrayList<Integer>) potsdata.get(minIndex).get("temperature")).remove(((ArrayList<Integer>) potsdata.get(minIndex).get("temperature")).size() - 1);
            ((ArrayList<Integer>) potsdata.get(minIndex).get("humidity")).remove(((ArrayList<Integer>) potsdata.get(minIndex).get("humidity")).size() - 1);
            if (((ArrayList<Integer>) potsdata.get(minIndex).get("humidity")).isEmpty()) {
                potsdata.remove(minIndex);
            }
        }
        for (int i = 0; i < ((ArrayList<Integer>) potsEndData.get(1).get("temperature")).size(); i++) {
            System.out.println(((ArrayList<Integer>) potsEndData.get(1).get("temperature")).get(i));
        }
        return array;
    }
}
