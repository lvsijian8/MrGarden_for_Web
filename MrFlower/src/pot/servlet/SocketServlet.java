package pot.servlet;

import pot.util.SocketListener;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/4/11.
 */
@WebServlet(name = "SocketServlet")
public class SocketServlet extends HttpServlet {
    //private Socket sockets;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        SocketListener socketListener = new SocketListener();
        socketListener.start();
        //this.sockets=socketArd.getSocket();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
