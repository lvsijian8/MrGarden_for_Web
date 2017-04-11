<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/21
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray SecondPlant = null;
    if ((SecondPlant = (JSONArray) request.getAttribute("SecondPlant")) == null) {//若是直接访问plant.jsp则先跳转plant,再跳转回来
%>
<jsp:forward page="plant"/>
<%
    }
%>
<html>
<head>
    <title>花卉介绍</title>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/DelCookie.js"></script>
    <script>
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
        })
    </script>
</head>
<body id="top">
<header>
    <div class="container_12">
        <div class="grid_12">
            <h1>
                <a href="index.jsp">
                    <img src="images/logo.png" alt="Your Happy Family">
                </a>
            </h1>
        </div>
    </div>
    <div class="clear"></div>
    <div class="menu_block">
        <div class="container_12">
            <div class="grid_12">
                <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                    <ul class="sf-menu">
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="chart.jsp">图表</a></li>
                        <li><a href="equipment.jsp">设备</a></li>
                        <li><a href="plant">花卉</a></li>
                        <li><a href="Contacts.jsp">联系</a></li>
                        <li><%
                            boolean isLogin = false;
                            Cookie cookie = null;
                            Cookie[] cookies = null;
                            // 获取cookies的数据,是一个数组
                            cookies = request.getCookies();
                            if (cookies != null) {
                                for (int i = 0; i < cookies.length; i++) {//从cookie中获取当前已登陆用户
                                    cookie = cookies[i];
                                    if (cookie.getName().equals("user_name") && (cookie.getValue() != null)) {
                                        out.print("<a style=\"float:left\" >" + cookie.getValue() + "</a>" + "|<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
                                        isLogin = true;
                                        break;
                                    }
                                }
                            }
                            if (!isLogin)
                                out.print("<a href=\"login.jsp\">登录|注册</a>");
                        %></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</header>

<!--==============================Content=================================-->
<iframe frameborder="0" scrolling="no" src="huahui2.jsp?
chinese_name=<%=SecondPlant.getJSONObject(0).get("chinese_name")%>&
english_name=<%=SecondPlant.getJSONObject(0).get("english_name")%>&
image_url=<%=SecondPlant.getJSONObject(0).get("image_url")%>&
watering=<%=SecondPlant.getJSONObject(0).get("watering")%>&
sunshine=<%=SecondPlant.getJSONObject(0).get("sunshine")%>&
temperature_min=<%=SecondPlant.getJSONObject(0).get("temperature_min")%>&
temperature_max=<%=SecondPlant.getJSONObject(0).get("temperature_max")%>&
fertilizer=<%=SecondPlant.getJSONObject(0).get("fertilizer")%>&
text=<%=SecondPlant.getJSONObject(0).get("text")%>
" width="100%" height="500px"></iframe>

<!--==============================footer=================================-->
<footer>
    <div class="container_12">
        <div class="grid_12 ">
            <div class="copy">
                Copyright &copy; 2017.Mr.Flower All rights reserved.
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>
<div style="display:none">
    <script src='https://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>

</body>
</html>
