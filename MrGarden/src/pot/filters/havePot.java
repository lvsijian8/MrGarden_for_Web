package pot.filters;

import pot.dao.web.havePotDaoWeb;
import pot.util.Findipid;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lvsijian8 on 2017/5/10.
 */
@WebFilter({"/chart.jsp", "/charts_pot.jsp", "/equipment.jsp", "/manage.jsp", "/manage_all.jsp", "/bottleAll", "/chart", "/chartGroup", "/deletepot", "/deviceState", "/equipment", "/getManageAll", "/setTimeMl", "/wateringWeb", "/waterAll"})
public class havePot implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        int user_id = Findipid.finduser_id(request.getCookies());
        havePotDaoWeb havePotDao = new havePotDaoWeb();
        if (havePotDao.havePot(user_id))
            chain.doFilter(req, resp);
        else {
            request.setAttribute("error", "alert(\"您当前尚未添加节点.请先进行添加\");");
            request.getRequestDispatcher("addPot.jsp").forward(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
