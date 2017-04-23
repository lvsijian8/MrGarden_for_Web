package pot.util;

import pot.dao.arduino.headBeatDao;
import pot.dao.arduino.lookUpdataDao;
import pot.dao.arduino.setTimeDao;
import pot.dao.arduino.updataDao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Created by lvsijian8 on 2017/4/11.
 */
public class SocketReader implements Runnable {
    Socket s = null;
    BufferedReader br = null;
    OutputStream os = null;

    public SocketReader(Socket s) {
        this.s = s;
        try {
            br = new BufferedReader(new InputStreamReader(s.getInputStream(), "utf-8"));
            os = s.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void run() {
        try {
            String content = null;
            while ((content = br.readLine()) != null) {
                //System.out.println(2);
//                System.out.print(content);
                switch (content.split("\\|")[0]) {
                    case "headBeat": {
                        int pot_id = Integer.parseInt(content.split("\\|")[1]);
                        headBeatDao headBeat = new headBeatDao();
                        os.write((headBeat.headBeat(pot_id) + "\n").getBytes("utf-8"));
                        break;
                    }
                    case "lookUpdata": {
                        int pot_id = Integer.parseInt(content.split("\\|")[1]);
                        int now_temperature = Integer.parseInt(content.split("\\|")[2]);
                        int now_humidity = Integer.parseInt(content.split("\\|")[3]);
                        int now_power = Integer.parseInt(content.split("\\|")[4]);
                        int now_light = Integer.parseInt(content.split("\\|")[5]);
                        lookUpdataDao lookUpdata = new lookUpdataDao();
                        lookUpdata.lookUpdata(pot_id, now_temperature, now_humidity, now_power, now_light);
                        break;
                    }
                    case "updata": {
                        int pot_id = Integer.parseInt(content.split("\\|")[1]);
                        int out_temperature = Integer.parseInt(content.split("\\|")[2]);
                        int out_humidity = Integer.parseInt(content.split("\\|")[3]);
                        int in_humidity = Integer.parseInt(content.split("\\|")[4]);
                        int water = Integer.parseInt(content.split("\\|")[5]);
                        int light = Integer.parseInt(content.split("\\|")[6]);
                        int fertilizer = Integer.parseInt(content.split("\\|")[7]);
                        updataDao updata = new updataDao();
                        os.write((updata.Updata(pot_id, out_temperature, out_humidity, in_humidity, water, light, fertilizer) + "\n").getBytes("utf-8"));
                        break;
                    }
                    case "setTime":{
                        setTimeDao setTime=new setTimeDao();
                        int pot_id = Integer.parseInt(content.split("\\|")[1]);
                        os.write((setTime.setTime(pot_id) + "\n").getBytes("utf-8"));
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
