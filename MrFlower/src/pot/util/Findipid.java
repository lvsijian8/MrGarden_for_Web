package pot.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
public class Findipid {
    public static int finduser_id(Cookie[] cookies) {
        int user_id = 0;
        Cookie cookie = null;
        // 获取cookies的数据,是一个数组
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {//从cookie中获取当前已登陆用户
                cookie = cookies[i];
                if (cookie.getName().equals("user_id") && (cookie.getValue() != null)) {
                    user_id = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }
        return user_id;
    }

    public static String getRemoteAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getHeader("Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown"))
            ip = request.getHeader("WL-Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getRemoteAddr();
        return ip;
    }
}