package pot.dao;

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
 * Created by lvsijian8 on 2017/4/7.
 */
public class fdataDaoAndroid {
    public Map getfdata(int user_id) {
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        con = DBConnection.getDBConnection();
        Map wai = new HashMap();
        JSONArray array = new JSONArray();
        int pot_ids[] = new int[50];//同一用户花盆最大不超过50个
        String sqlFindPots = "SELECT pot_id FROM user_pot WHERE user_id=?;";
        int leng = 0;
        String sqlFindPotName = "SELECT flower_name FROM pot WHERE pot_id=?;";
        DateFormat dateFormatyM = new SimpleDateFormat("yyyy-MM");
        DateFormat dateFormatd = new SimpleDateFormat("dd");//获取当前天
        String flower_name = "";
//        String sqlFdata = "SELECT time,out_temperature,out_humidity,in_humidity,light FROM pot_";
        ArrayList<Integer> humidity = new ArrayList<Integer>();//湿度
        ArrayList<Integer> inhumidity = new ArrayList<Integer>();//土壤湿度
        ArrayList<Integer> sunshine = new ArrayList<Integer>();//光照
        ArrayList<Integer> temperature = new ArrayList<Integer>();//温度
        ArrayList<Integer> days = new ArrayList<Integer>();//日期
        try {
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            for (int i = 0; rs.next(); i++) {
                pot_ids[i] = rs.getInt("pot_id");
                leng++;
            }
            for (int i = 0; i < leng; i++) {
                Map params = new HashMap();
                flower_name = "";
                prepstmt = con.prepareStatement(sqlFindPotName);
                prepstmt.setInt(1, pot_ids[i]);
                rs = prepstmt.executeQuery();
                while (rs.next()) {
                    flower_name = rs.getString("flower_name");
                }
                String sqlFdata = "SELECT time,out_temperature,out_humidity,in_humidity,light FROM pot_" +pot_ids[i] + " ORDER BY time DESC limit 0,192";
                prepstmt = con.prepareStatement(sqlFdata);
                rs = prepstmt.executeQuery();
                int outT[] = new int[30];
                int outH[] = new int[30];
                int inH[] = new int[30];
                int light[] = new int[30];
                int time[] = new int[8];
                humidity.clear();
                inhumidity.clear();
                sunshine.clear();
                temperature.clear();
                days.clear();
                String month = "时间";
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
                        if(j>=8)
                            break;
                        time[j] = thisDay;
                        int oT = 0, oH = 0, iH = 0, li = 0;
                        for (int k = 0; k < d; k++) {//取出今天的所有数据并平均值
                            oT += outT[k];
                            outT[k] = 0;
                            oH += outH[k];
                            outH[k] = 0;
                            iH += inH[k];
                            inH[k] = 0;
                            li += light[k];
                            light[k] = 0;
                        }
                        humidity.add(oH / d);
                        inhumidity.add(iH / d);
                        sunshine.add(li / d);
                        temperature.add(oT / d);
                        days.add(time[j - 1]);
                        d = 0;
                    }
                    outT[d] = rs.getInt(2);
                    outH[d] = rs.getInt(3);
                    inH[d] = rs.getInt(4);
                    light[d] = rs.getInt(5);
                }
                Collections.reverse(humidity);
                Collections.reverse(inhumidity);
                Collections.reverse(sunshine);
                Collections.reverse(temperature);
                Collections.reverse(days);
                params.put("humidity", humidity);
                params.put("inhumidity", inhumidity);
                params.put("sunshine", sunshine);
                params.put("temperature", temperature);
                params.put("days", days);
                String msg = "您的植物近期生长状况不错,再接再厉哦.";
                int warn=-1;
                if((warn=isOutMaxWei(humidity,90))!=-1){
                    msg="您的植物在"+days.get(warn)+"时环境湿度过高对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isUpMinWei(humidity,10))!=-1){
                    msg="您的植物在"+days.get(warn)+"时环境湿度过低对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isOutMaxWei(inhumidity,95))!=-1){
                    msg="您的植物在"+days.get(warn)+"时土壤湿度过高对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isUpMinWei(inhumidity,10))!=-1){
                    msg="您的植物在"+days.get(warn)+"时土壤湿度过低对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isOutMaxWei(sunshine,30))!=-1){
                    msg="您的植物在"+days.get(warn)+"时光照过强对植物生长不利,请进行将花盆移至合适处！";//----------------光照数据待确认
                }else if((warn=isUpMinWei(sunshine,10))!=-1){
                    msg="您的植物在"+days.get(warn)+"时光照过低对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isOutMaxWei(temperature,30))!=-1){
                    msg="您的植物在"+days.get(warn)+"时温度过高对植物生长不利,请进行将花盆移至合适处！";
                }else if((warn=isUpMinWei(temperature,10))!=-1){
                    msg="您的植物在"+days.get(warn)+"时温度过低对植物生长不利,请进行将花盆移至合适处！";
                }
                params.put("msg", msg);
                params.put("month", month);
                params.put("id", pot_ids[i]);
                params.put("name", flower_name);
                params.put("warn", warn);
                array.add(params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        wai.put("data", array);
        return wai;
    }

    private int isUpMinWei(ArrayList<Integer> s, int Min) {
        int minWei = -1, min = -1,wei=-1;
        for (int i = 0; i < s.size(); i++) {
            if(s.get(i)<min){
                wei=i;
                min=s.get(i);
            }
        }
        if(min<=Min)
            minWei=wei;
        return minWei;
    }

    private int isOutMaxWei(ArrayList<Integer> s, int Max) {
        int maxWei = -1, max = -1,wei=-1;
        for (int i = 0; i < s.size(); i++) {
            if(s.get(i)>max){
                wei=i;
                max=s.get(i);
            }
        }
        if(max>=Max)
            maxWei=wei;
        return maxWei;
    }

}
