package pot.util;


import java.io.IOException;
import java.net.ServerSocket;

/**
 * Created by lvsijian8 on 2017/4/11.
 */
public class SocketListener extends Thread {
    public void run() {
        ServerSocket serverSocket = null;
        try {
            serverSocket = new ServerSocket(6605);
            while (true) {
                //Socket s = serverSocket.accept();
                //System.out.println(1);
                new Thread(new SocketReader(serverSocket.accept())).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Could not listen on port: 6605.");
        } finally {
            try {
                serverSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
