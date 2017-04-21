package pot.dao.arduino;

import java.sql.Timestamp;

/**
 * Created by lvsijian8 on 2017/4/19.
 */
public class setTimeDao {
    public String setTime(){
        Timestamp now = new Timestamp(new java.util.Date().getTime());
        return now.toString().split("\\.")[0];
    }
}
