package pot.util;

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

    public SocketReader(Socket s) {
        this.s = s;
        try {
            br = new BufferedReader(new InputStreamReader(s.getInputStream(), "utf-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void run() {
        try {
            String content = null;
            while ((content = br.readLine()) != null) {
                //System.out.println(content);
                /*Mysql mysql = new Mysql(content);
                OutputStream os = s.getOutputStream();
                //System.out.println(content.charAt(0)+mysql.get() + "\n");
                os.write((content.charAt(0) + mysql.get() + "\n").getBytes("utf-8"));*/
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
