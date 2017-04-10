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
 * Created by lvsijian8 on 2017/4/8.
 */
public class chartDaoWeb {
    public JSONArray findchart(int pot_id,int user_id){
        Connection con = null;
        PreparedStatement prepstmt = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        Map params = new HashMap();
        con = DBConnection.getDBConnection();
        String sqlFindPots="SELECT pot_id FROM user_pot WHERE user_id=?;";
        try {
            prepstmt = con.prepareStatement(sqlFindPots);
            prepstmt.setInt(1, user_id);
            rs = prepstmt.executeQuery();
            int checked=0;
            ArrayList<Integer> pot_ids=new ArrayList<Integer>();
            ArrayList<String> pot_names=new ArrayList<String>();
            ArrayList<Integer> temperature=new ArrayList<Integer>();//温度
            ArrayList<Integer> humidity=new ArrayList<Integer>();//湿度
            while (rs.next()) {
                pot_ids.add(rs.getInt("pot_id"));
            }
            String sqlFindPotName="SELECT flower_name FROM pot WHERE pot_id=?;";
            prepstmt = con.prepareStatement(sqlFindPotName);
            for(int i=0;i<pot_ids.size();i++){
                if(pot_ids.get(i)==pot_id)
                    checked=i;
                prepstmt.setInt(1, pot_ids.get(i));
                rs = prepstmt.executeQuery();
                while (rs.next()){
                    pot_names.add(rs.getString("flower_name"));
                }
            }
            if(pot_id==-1){
                checked=0;
                pot_id=pot_ids.get(0);
            }
            String sql="SELECT out_temperature,out_humidity,water,fertilizer FROM pot_"+pot_id+" ORDER BY time DESC limit 0,1";
            prepstmt = con.prepareStatement(sql);
            rs = prepstmt.executeQuery();
            while (rs.next()) {
                params.put("out_t",rs.getInt(1));
                params.put("out_h",rs.getInt(2));
                params.put("water",rs.getInt(3));
                params.put("fertilizer",rs.getInt(4));
            }
            String sqlFdata="SELECT time,out_temperature,out_humidity FROM pot_"+pot_id+" ORDER BY time DESC limit 0,192";
            prepstmt = con.prepareStatement(sqlFdata);
            rs = prepstmt.executeQuery();
            int outT[]=new int[30];
            int outH[]=new int[30];
            for (int j=0,d=0,mark=0,yesDay=0;rs.next()&&j<8;d++){//近8天的数据
                int thisDay=0;
                Date date=rs.getDate(1);
                DateFormat dateFormat =new SimpleDateFormat("dd");//获取当前天
                thisDay=Integer.parseInt(dateFormat.format(date));
                if(mark==0){
                    yesDay=thisDay;
                    mark++;
                }
                if(yesDay!=thisDay){//下一天
                    j++;
                    yesDay=thisDay;
                    int oT=0,oH=0;
                    for(int k=0;k<d;k++){//取出今天的所有数据并平均值
                        oT+=outT[k];outT[k]=0;
                        oH+=outH[k];outH[k]=0;
                    }
                    humidity.add(oH/d);
                    temperature.add(oT/d);
                    d=0;
                }
                outT[d]=rs.getInt(2);
                outH[d]=rs.getInt(3);
            }
            Collections.reverse(humidity);
            Collections.reverse(temperature);
            params.put("checked",checked);
            params.put("pot_names",pot_names);
            params.put("pot_ids",pot_ids);
            params.put("humidity",humidity);
            params.put("temperature",temperature);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDB(con, prepstmt, rs);
        }
        array.add(params);
        return array;
    }
}
