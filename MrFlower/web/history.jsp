<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray History = null;
    if ((History = (JSONArray) request.getAttribute("History")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="history?pot_id=-1&pot_device=-1&pot_handle=-1"/>
<%
    }
%>
<%
    List<String> pot_names = ((List<String>) History.getJSONObject(0).get("pot_names"));
    List<Integer> pot_ids = ((List<Integer>) History.getJSONObject(0).get("pot_ids"));
    List<String> pot_details = ((List<String>) History.getJSONObject(0).get("pot_details"));
    List<String> pot_times = ((List<String>) History.getJSONObject(0).get("pot_times"));

%>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>历史记录</title>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/sForm.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/DelCookie.js"></script>

    <link rel="stylesheet" href="css/his_index.css"/>
    <link rel="stylesheet" href="css/his_style.css"/>
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
    <style>
        select {
            /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
            border: solid 1px #000;
            width: 170px;
            height: 20px;
            /*很关键：将默认的select选择框样式清除*/
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
            border-radius: 4px;
            text-align: center;
            /*在选择框的最右侧中间显示小箭头图片*/
            background: url("images/Down.png") no-repeat scroll right center transparent;

            /*为下拉小箭头留出一点位置，避免被文字覆盖*/
            padding-right: 14px;
        }

        .selectStyle {
            display: inline;
        }

        /*清除ie的默认选择框样式清除，隐藏下拉箭头*/
        select::-ms-expand {
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
            /*carousel*/
            var owl = $("#owl");
            owl.owlCarousel({
                items: 1, //10 items above 1000px browser width
                navigation: true,
                pagination: false
            });
            var owl = $("#owl1");
            owl.owlCarousel({
                items: 1, //10 items above 1000px browser width
                navigation: true,
                pagination: false
            });
        })
    </script>
</head>
<body>
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
                                        out.print("<a style=\"float:left\" >" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "|<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
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
<div style="padding-bottom: 3em;text-align: center">
    <form>
        <div>
            <div class="selectStyle">
                花盆：<select class="select" id="pot_names">
                <option value="-1">全部</option>
                <%
                    for (int i = 0; i < pot_ids.size(); i++) {
                        out.println("<option value=\"" + pot_ids.get(i) + "\" id=\"" + pot_ids.get(i) + "1\">" + pot_names.get(i) + "</option>");
                    }
                %>
            </select>
            </div>
            <div class="selectStyle">
                来源：<select class="select" id="pot_devices">
                <option value="-1">全部</option>
                <option value="android" id="android1">android</option>
                <option value="web" id="web1">web</option>
            </select>
            </div>
            <div class="selectStyle">
                操作：<select class="select" id="pot_handles">
                <option value="-1" id="-1">全部</option>
                <option value="watering" id="watering1">浇水</option>
                <option value="fertilizering" id="fertilizering1">施肥</option>
                <option value="delete_pot" id="delete_pot1">删除花盆</option>
                <option value="set" id="set1">设置操作</option>
                <option value="login" id="login1">登陆</option>
                <option value="signup" id="signup1">注册</option>
            </select>
            </div>
        </div>
    </form>
</div>
<script>
    window.onload = function () {
        $('#'+'<%=request.getAttribute("pot_id1")%>'+'1').attr("selected", "selected");
        $('#' + '<%=request.getAttribute("pot_device1")%>' + '1').attr("selected", "selected");
        $('#' + '<%=request.getAttribute("pot_handle1")%>' + '1').attr("selected", "selected");
    };
    var pot_names = document.getElementById("pot_names");
    var pot_devices = document.getElementById("pot_devices");
    var pot_handles = document.getElementById("pot_handles");
    pot_names.onchange = function () {
        window.location.href = "history?pot_id=" + pot_names.options[pot_names.selectedIndex].value + "&pot_device=" + pot_devices.options[pot_devices.selectedIndex].value + "&pot_handle=" + pot_handles.options[pot_handles.selectedIndex].value;
    };
    pot_devices.onchange = function () {
        window.location.href = "history?pot_id=" + pot_names.options[pot_names.selectedIndex].value + "&pot_device=" + pot_devices.options[pot_devices.selectedIndex].value + "&pot_handle=" + pot_handles.options[pot_handles.selectedIndex].value;
    };
    pot_handles.onchange = function () {
        window.location.href = "history?pot_id=" + pot_names.options[pot_names.selectedIndex].value + "&pot_device=" + pot_devices.options[pot_devices.selectedIndex].value + "&pot_handle=" + pot_handles.options[pot_handles.selectedIndex].value;
    }

</script>
<script src='js/jquery.js'></script>
</body>

<div id="say">
    <div class="weizi">
        <%
            for (int i = 0; i < pot_times.size(); i++) {
                out.println("<ul class=\"say_box\"><div class=\"sy\"><p>" + pot_details.get(i) + "</p></div><span class=\"dateview\">" + pot_times.get(i) + "</span></ul>");
            }
            if (pot_times.size() == 0)
                out.println("<p style=\"text-align: center; font-size: 24px\">当前选项尚无任何操作</p><br>");
        %>
        <%--<ul class="say_box"><div class="sy"><p>浇水100ml</p></div><span class="dateview">2017-5-16</span></ul>--%>
    </div>
</div>

<div style="padding-bottom: 2em;padding-top: 3em;background-color: #FFFFFF;">
    <div class="page_normal">
        <%
            int pageThis = (int) request.getAttribute("page");
            int pageMax = (int) History.getJSONObject(0).get("pageMax");
            int pagePrev = pageThis - 1;
            int pageNext = pageThis + 1;
            if (pageThis != 1)
                out.print("<a href=\"history?pot_id=" + request.getAttribute("pot_id1") + "&pot_device=" + request.getAttribute("pot_device1") + "&pot_handle=" + request.getAttribute("pot_handle1") + "&page=" + pagePrev + "\" class=\"page_prev\">&lt;</a>");//判断是否第一页,是则不显示前一页
            for (int i = 1; i <= pageMax; i++) {
                if (i == pageThis) {
                    out.print("<a class=\"page_current\">" + pageThis + "</a>");//为当前页加特效
                    continue;
                }
                out.print("<a href=\"history?pot_id=" + request.getAttribute("pot_id1") + "&pot_device=" + request.getAttribute("pot_device1") + "&pot_handle=" + request.getAttribute("pot_handle1") + "&page=" + i + "\">" + i + "</a>");
            }
            if (pageThis != pageMax)
                out.print("<a href=\"history?pot_id=" + request.getAttribute("pot_id1") + "&pot_device=" + request.getAttribute("pot_device1") + "&pot_handle=" + request.getAttribute("pot_handle1") + "&page=" + pageNext + "\" class=\"page_next\">&gt;</a>");//判断是否最后一页,是则不显示下一页
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
