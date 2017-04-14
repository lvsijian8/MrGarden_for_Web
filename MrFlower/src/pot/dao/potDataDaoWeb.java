package pot.dao;

import net.sf.json.JSONArray;
import pot.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by lvsijian8 on 2017/4/13.
 */
public class potDataDaoWeb {
    public JSONArray findPotData(int pot_id, int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        ArrayList<Integer> pot_ids = new ArrayList<Integer>();
        ArrayList<String> pot_names = new ArrayList<String>();
        int checked = 0;
        String sqlFindPotName = "SELECT flower_name FROM pot WHERE pot_id=?;";
        String sqlFindWater = "SELECT water,fertilizer FROM pot_";
        String sqlFindHandleTime = "SELECT time FROM history WHERE handle=? AND pot_id=? AND user_id=? ORDER BY time DESC limit 0,1;";
        int water = 0, fertilizer = 0;
        Date lastWaterDate=null,lastFertilizerDate=null;
        int recommendWaterTime=0,recommendFertilizerTime=0;
        String sqlFindDay="SELECT water_day,bottle_day FROM pot WHERE pot_id=?;";
        try {
            con = DBConnection.getDBConnection();
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            boolean isKong = true;
            while (rs.next()) {
                pot_ids.add(rs.getInt("pot_id"));
                isKong = false;
            }
            if (isKong)
                return null;
            prepstmt = con.prepareStatement(sqlFindPotName);
            for (int i = 0; i < pot_ids.size(); i++) {
                if (pot_ids.get(i) == pot_id)
                    checked = i;
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    pot_names.add(rs.getString("flower_name"));
                }
            }
            if (pot_id == -1) {
                checked = 0;
                pot_id = pot_ids.get(0);
            }
            sqlFindWater = sqlFindWater + pot_id + " ORDER BY time DESC limit 0,1;";
            prepstmt = con.prepareStatement(sqlFindWater);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                water = rs.getInt("water");
                fertilizer = rs.getInt("fertilizer");
            }
            prepstmt = con.prepareStatement(sqlFindHandleTime);
            prepstmt.setString(1, "watering");
            prepstmt.setInt(2, user_id);
            prepstmt.setInt(3, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                lastWaterDate = rs.getDate("time");
            }
            prepstmt = con.prepareStatement(sqlFindHandleTime);
            prepstmt.setString(1, "fertilizering");
            prepstmt.setInt(2, user_id);
            prepstmt.setInt(3, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                lastFertilizerDate = rs.getDate("time");
            }
            prepstmt = con.prepareStatement(sqlFindDay);
            prepstmt.setInt(1, pot_id);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                recommendWaterTime = rs.getInt("water_day");
                recommendFertilizerTime = rs.getInt("bottle_day");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        if(lastWaterDate!=null){
            params.put("lastWaterDate", timeCha(lastWaterDate)+"前");
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(lastWaterDate);
            rightNow.add(Calendar.DAY_OF_YEAR,recommendWaterTime);//日期加
            Date recommendWaterTime1=rightNow.getTime();
            params.put("recommendWaterTime", timeCha(recommendWaterTime1)+"后");
        }
        else{
            params.put("lastWaterDate", "尚无浇水操作");
            params.put("recommendWaterTime", "现在可以浇水了哦");
        }
        if(lastFertilizerDate!=null){
            params.put("lastFertilizerDate", timeCha(lastFertilizerDate)+"前");
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(lastFertilizerDate);
            rightNow.add(Calendar.DAY_OF_YEAR,recommendFertilizerTime);//日期加
            Date recommendFertilizerTime1=rightNow.getTime();
            params.put("recommendFertilizerTime", timeCha(recommendFertilizerTime1)+"后");
        }
        else{
            params.put("lastFertilizerDate", "尚无浇营养液操作");
            params.put("recommendFertilizerTime", "现在可以浇营养液了哦");
        }
        if(water>50)
            params.put("recommendWater", "水量充足，暂时不需要添水");
        else
            params.put("recommendWater", "水量不足，需要加水");
        if(fertilizer>50)
            params.put("recommendFertilizer", "营养液充足，暂时不需要添加营养液");
        else
            params.put("recommendFertilizer", "营养液余量不足，需要添加营养液");
        params.put("water", water);
        params.put("fertilizer", fertilizer);
        params.put("checked", checked);
        params.put("pot_names", pot_names);
        params.put("pot_ids", pot_ids);
        array.add(params);
        return array;
    }

    private String timeCha(Date until) {
        //SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String re="";
        //java.util.Date begin = dfs.parse("2017-01-01 11:30:24");
        java.util.Date now = new Date();
        long between = (now.getTime() - until.getTime()) / 1000;//除以1000是为了转换成秒
        if(between<0)
            between=-between;
        long year1 = between / (12 * 30 * 24 * 3600);
        long month1 = between % (12 * 30 * 24 * 3600) / (30 * 24 * 3600);
        long week1 = between % (30 * 24 * 3600) / (7 * 24 * 3600);
        long day1 = between % (7 * 24 * 3600) / (24 * 3600);
        long hour1 = between % (24 * 3600) / 3600;
        long minute1 = between % 3600 / 60;
        long second1 = between % 60;
        if(year1!=0)
            re=year1+"年";
        else if(month1!=0)
            re=month1+"月";
        else if(week1!=0)
            re=week1+"周";
        else if(day1!=0)
            re=day1+"天";
        else if(hour1!=0)
            re=hour1+"小时";
        else if(minute1!=0)
            re=minute1+"分钟";
        else if(second1!=0)
            re=second1+"秒";
        //System.out.println(year1 + "年" + month1 + "月" + week1 + "周" + day1 + "天" + hour1 + "小时" + minute1 + "分" + second1 + "秒");
        return re;
    }
}
