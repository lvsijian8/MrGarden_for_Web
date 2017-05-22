package pot.dao.web;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
public class getManageAllDaoWeb {
    public JSONArray findAllPot(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        ArrayList<String> pot_names = new ArrayList<String>();
        ArrayList<Integer> pot_waters = new ArrayList<Integer>();
        ArrayList<Integer> pot_bottles = new ArrayList<Integer>();
        ArrayList<Integer> pot_online = new ArrayList<Integer>();
        ArrayList<String> lastWaterDates = new ArrayList<String>();
        ArrayList<String> lastFertilizerDates = new ArrayList<String>();
        Timestamp date = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp now = new Timestamp(new Date().getTime());
        String sqlFindPotName = "SELECT flower_name,heartBeat_time,now_water,now_bottle FROM pot WHERE pot_id=?;";
        Timestamp lastWaterDate = null, lastFertilizerDate = null;
        String sqlFindHandleTime = "SELECT time FROM history WHERE handle=? AND user_id=? AND pot_id=? ORDER BY time DESC limit 0,1;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                pot_ids.add(rs.getInt("pot_id"));
            }
            prepstmt = con.prepareStatement(sqlFindPotName);
            for (int i = 0; i < pot_ids.size(); i++) {
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    pot_names.add(rs.getString("flower_name"));
                    pot_waters.add(rs.getInt("now_water"));
                    pot_bottles.add(rs.getInt("now_bottle"));
                    date = rs.getTimestamp("heartBeat_time");
                    if (date == null)
                        date = new Timestamp(new java.util.Date().getTime() - 10000);
                    if (((now.getTime() - date.getTime()) / 1000) > 5)
                        pot_online.add(0);
                    else
                        pot_online.add(1);
                }
            }
            prepstmt = con.prepareStatement(sqlFindHandleTime);
            for (int i = 0; i < pot_ids.size(); i++) {
                lastWaterDate = null;
                lastFertilizerDate = null;
                prepstmt.setString(1, "watering");
                prepstmt.setInt(2, user_id);
                prepstmt.setInt(3, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    lastWaterDate = rs.getTimestamp("time");
                }
                prepstmt.setString(1, "fertilizering");
                prepstmt.setInt(2, user_id);
                prepstmt.setInt(3, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    lastFertilizerDate = rs.getTimestamp("time");
                }
                if (lastWaterDate != null) {
                    lastWaterDates.add(timeCha(lastWaterDate));
                } else {
                    lastWaterDates.add("尚无浇水操作");
                }
                if (lastFertilizerDate != null) {
                    lastFertilizerDates.add(timeCha(lastFertilizerDate));
                } else {
                    lastFertilizerDates.add("尚无浇营养液操作");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        params.put("pot_names", pot_names);
        params.put("pot_ids", pot_ids);
        params.put("pot_waters", pot_waters);
        params.put("pot_bottles", pot_bottles);
        params.put("pot_bottles", pot_bottles);
        params.put("pot_online", pot_online);
        params.put("lastWaterDates", lastWaterDates);
        params.put("lastFertilizerDates", lastFertilizerDates);
        array.add(params);
        return array;
    }

    private String timeCha(Date until) {
        String re = "";
        java.util.Date now = new Date();
        long between = (now.getTime() - until.getTime()) / 1000;//除以1000是为了转换成秒
        if (between < 0)
            between = -between;
        long year1 = between / (12 * 30 * 24 * 3600);
        long month1 = between % (12 * 30 * 24 * 3600) / (30 * 24 * 3600);
        long week1 = between % (30 * 24 * 3600) / (7 * 24 * 3600);
        long day1 = between % (7 * 24 * 3600) / (24 * 3600);
        long hour1 = between % (24 * 3600) / 3600;
        long minute1 = between % 3600 / 60;
        long second1 = between % 60;
        if (year1 != 0)
            re = year1 + "年";
        else if (month1 != 0)
            re = month1 + "月";
        else if (week1 != 0)
            re = week1 + "周";
        else if (day1 != 0)
            re = day1 + "天";
        else if (hour1 != 0)
            re = hour1 + "小时";
        else if (minute1 != 0)
            re = minute1 + "分钟";
        else if (second1 != 0)
            re = second1 + "秒";
        return re + "前";
    }
}
