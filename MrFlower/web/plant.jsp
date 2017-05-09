<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/3/11
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    JSONArray FirstPlant = null;
    if ((FirstPlant = (JSONArray) request.getAttribute("FirstPlant")) == null) {//若是直接访问plant.jsp则先跳转plant,再跳转回来
%>
<jsp:forward page="plant?page=1"/>
<%
    }
%>
<html>
<head>
    <title>花卉</title>
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

    <link rel="stylesheet" href="css/hua_index.css"/>
    <script type="text/javascript" src="js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <style>
        div.page_normal {
            color: #a5a6a8;
            text-align: center;
            font-size: 0px;
            background-color: #FFFFFF;
        }

        .page_normal a, .page_normal .page_current, .page_normal .page_prev {
            margin-left: 10px;
            padding: 5px 7px;
            border: 1px solid #cdcdcd;
            border-radius: 3px;
            width: 25px;
            height: 20px;
            font-size: 18px;
            display: inline-block;
        }

        .page_normal a:hover {
            color: #ffffff;
            background-color: #f9f9f9;
        }

        .page_normal a {
            color: #a5a6a8;
            text-decoration: none;
        }

        .page_normal .page_current {
            color: #ffffff;
            background-color: #f9f9f9;
        }

        .page_normal .page_prev {
            color: #a5a6a8;
        }
    </style>
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
                                       out.print("<a style=\"float:left\" href=\"editInfo.jsp\">" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "&nbsp;&nbsp;|&nbsp;&nbsp;<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
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
<!--content start-->
<div style="background-color: #FFFFFF">
    <div id="content">
        <div class="left" id="learn">
            <div class="l_content">
                <!--wz-->
                <div class="wz">
                    <h3>
                        <a href="plant?plant_id=<%=FirstPlant.getJSONObject(1).get("plant_id")%>"><%=FirstPlant.getJSONObject(1).get("namec")%>
                        </a></h3>
                    <dl>
                        <dt><img src="sql_image<%=FirstPlant.getJSONObject(1).get("pic")%>" width="200" height="123"
                                 alt="">
                        </dt>
                        <dd>
                            <p class="dd_text_1">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=FirstPlant.getJSONObject(1).get("brief")%>
                            </p>
                        </dd>
                        <div class="clear"></div>
                    </dl>
                </div>
                <!--wz end-->
                <!--wz-->
                <div class="wz">
                    <h3>
                        <a href="plant?plant_id=<%=FirstPlant.getJSONObject(2).get("plant_id")%>"><%=FirstPlant.getJSONObject(2).get("namec")%>
                        </a></h3>
                    <dl>
                        <dt><img src="sql_image<%=FirstPlant.getJSONObject(2).get("pic")%>" width="200" height="123"
                                 alt="">
                        </dt>
                        <dd>
                            <p class="dd_text_1">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=FirstPlant.getJSONObject(2).get("brief")%>
                            </p>
                        </dd>
                        <div class="clear"></div>
                    </dl>
                </div>
                <!--wz end-->
                <!--wz-->
                <div class="wz">
                    <h3>
                        <a href="plant?plant_id=<%=FirstPlant.getJSONObject(3).get("plant_id")%>"><%=FirstPlant.getJSONObject(3).get("namec")%>
                        </a></h3>
                    <dl>
                        <dt><img src="sql_image<%=FirstPlant.getJSONObject(3).get("pic")%>" width="200" height="123"
                                 alt="">
                        </dt>
                        <dd>
                            <p class="dd_text_1">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=FirstPlant.getJSONObject(3).get("brief")%>
                            </p>
                        </dd>
                        <div class="clear"></div>
                    </dl>
                </div>
                <!--wz end-->
                <!--wz-->
                <div class="wz">
                    <h3>
                        <a href="plant?plant_id=<%=FirstPlant.getJSONObject(4).get("plant_id")%>"><%=FirstPlant.getJSONObject(4).get("namec")%>
                        </a></h3>
                    <dl>
                        <dt><img src="sql_image<%=FirstPlant.getJSONObject(4).get("pic")%>" width="200" height="123"
                                 alt="">
                        </dt>
                        <dd>
                            <p class="dd_text_1">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=FirstPlant.getJSONObject(4).get("brief")%>
                            </p>
                        </dd>
                        <div class="clear"></div>
                    </dl>
                </div>
                <!--wz end-->

            </div>
        </div>
    </div>
</div>

<div style="padding-bottom: 2em;padding-top: 3em;background-color: #FFFFFF;">
    <div class="page_normal">
        <%
            int pageThis = (int) request.getAttribute("page");
            int pageMax = (int) FirstPlant.getJSONObject(0).get("pageMax");
            int pagePrev = pageThis - 1;
            int pageNext = pageThis + 1;
            if (pageThis != 1)
                out.print("<a href=\"plant?page=" + pagePrev + "\" class=\"page_prev\">&lt;</a>");//判断是否第一页,是则不显示前一页
            for (int i = 1; i <= pageMax; i++) {
                if (i == pageThis) {
                    out.print("<a class=\"page_current\">" + pageThis + "</a>");//为当前页加特效
                    continue;
                }
                out.print("<a href=\"plant?page=" + i + "\">" + i + "</a>");
            }
            if (pageThis != pageMax)
                out.print("<a href=\"plant?page=" + pageNext + "\" class=\"page_next\">&gt;</a>");//判断是否最后一页,是则不显示下一页
        %>
    </div>
</div>
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
