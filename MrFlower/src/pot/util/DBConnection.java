package pot.util;

import java.sql.*;
import java.util.ResourceBundle;

/**
 * Created by lvsijian8 on 2017/3/25.
 */
public class DBConnection {
    private static String driverClass = "";
    private static String url = "";
    private static String user = "";
    private static String password = "";

    static {
        ResourceBundle rB = ResourceBundle.getBundle("db");//获取本地db.properties配置文件
        driverClass = rB.getString("driverClass");
        url = rB.getString("url") + rB.getString("url1");
        user = rB.getString("user");
        password = rB.getString("password");
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getDBConnection() {
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
            String sqlState = e.getSQLState();
            // 这个08S01就是这个异常的sql状态。单独处理手动重新链接就可以了。
            if ("08S01".equals(sqlState) || "40001".equals(sqlState)) {
                try {
                    return DriverManager.getConnection(url, user, password);
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        }
        return null;
    }

    public static void closeDB(Connection con, PreparedStatement pstm, ResultSet rs) {
        if (rs != null) try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (pstm != null) try {
            pstm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (con != null) try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
