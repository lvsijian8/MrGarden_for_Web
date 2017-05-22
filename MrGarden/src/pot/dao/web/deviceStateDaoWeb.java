package pot.dao.web;

import pot.util.DBConnection;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by lvsijian8 on 2017/4/14.
 */
public class deviceStateDaoWeb {
    public String findState(int pot_id, int user_id) {
        String state = "";
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        Timestamp date = new Timestamp(new java.util.Date().getTime() - 10000);
        Timestamp now = new Timestamp(new Date().getTime());
        String sql = "SELECT heartBeat_time,now_temperature,now_humidity,now_power,now_light,water_ml,bottle_ml,now_water,now_bottle,water_day,bottle_day FROM pot WHERE pot_id=?;";
        String sqlUpdataLook = "UPDATE pot SET look_time=? WHERE pot_id=?;";
        int water = 0, fertilizer = 0;
        String sqlFindHandleTime = "SELECT time FROM history WHERE handle=? AND user_id=? AND pot_id=? ORDER BY time DESC limit 0,1;";
        Date lastWaterDate = null, lastFertilizerDate = null;
        int recommendWaterTime = 0, recommendFertilizerTime = 0;
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sql);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                date = rs.getTimestamp("heartBeat_time");
                state += rs.getInt("now_temperature") + "<span>°C</span>|";
                state += rs.getInt("now_humidity") + "<span>%</span>|";
                state += rs.getInt("now_power") + "<span>%</span>|";
                if (rs.getInt("now_light") > 70)
                    state += "强|";
                else if (rs.getInt("now_light") > 40)
                    state += "适中|";
                else
                    state += "弱|";
                if (date == null)
                    date = new Timestamp(new java.util.Date().getTime() - 10000);
                if (((now.getTime() - date.getTime()) / 1000) > 5)
                    state += "0|";
                else
                    state += "1|";
                state += (rs.getInt("water_ml") + "|");
                state += (rs.getInt("bottle_ml") + "|");
                state += ((water = rs.getInt("now_water")) + "|");
                state += ((fertilizer = rs.getInt("now_bottle")) + "|");
                recommendWaterTime = rs.getInt("water_day");
                recommendFertilizerTime = rs.getInt("bottle_day");
            }

            if (water > 50)
                state += "水量充足，暂时不需要添水|";
            else
                state += "水量不足，需要加水|";
            if (fertilizer > 50)
                state += "营养液充足，暂时不需要添加营养液|";
            else
                state += "营养液余量不足，需要添加营养液|";
            prepstmt = con.prepareStatement(sqlFindHandleTime);
            prepstmt.setString(1, "watering");
            prepstmt.setInt(2, user_id);
            prepstmt.setInt(3, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                lastWaterDate = rs.getTimestamp("time");
            }
            prepstmt.setString(1, "fertilizering");
            prepstmt.setInt(2, user_id);
            prepstmt.setInt(3, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                lastFertilizerDate = rs.getTimestamp("time");
            }
            prepstmt = con.prepareStatement(sqlUpdataLook);
            prepstmt.setTimestamp(1, now);
            prepstmt.setInt(2, pot_id);
            prepstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        if (lastWaterDate != null) {
            state += timeCha(lastWaterDate, 0);
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(lastWaterDate);
            rightNow.add(Calendar.DAY_OF_YEAR, recommendWaterTime);//日期加
            Date recommendWaterTime1 = rightNow.getTime();
            state += timeCha(recommendWaterTime1, 1);
        } else {
            state += ("尚无浇水操作|");
            state += ("现在可以浇水了哦|");
        }
        if (lastFertilizerDate != null) {
            state += timeCha(lastFertilizerDate, 0);
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(lastFertilizerDate);
            rightNow.add(Calendar.DAY_OF_YEAR, recommendFertilizerTime);//日期加
            Date recommendFertilizerTime1 = rightNow.getTime();
            state += timeCha(recommendFertilizerTime1, 1);
        } else {
            state += ("尚无浇营养液操作|");
            state += ("现在可以浇营养液了哦|");
        }
        return state;
    }

    private String timeCha(Date until, int mark) {
        String re = "";
        java.util.Date now = new Date();
        long between = (now.getTime() - until.getTime()) / 1000;//除以1000是为了转换成秒
        if (between > 0 && mark == 1)
            return "早就该浇水啦|";
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
        if (mark == 0)
            return re + "前|";
        else
            return re + "后|";
    }
}
