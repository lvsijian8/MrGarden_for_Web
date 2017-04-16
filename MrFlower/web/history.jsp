<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon" />
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
                花盆：<select class="select">
                <option value="all">全部</option>
                <option value="hwl">虎尾兰</option>
                <option value="gyz">观音竹</option>
            </select>
            </div>
            <div class="selectStyle">
                操作：<select class="select">
                <option value="all">全部</option>
                <option value="hwl">浇水</option>
                <option value="gyz">施肥</option>
            </select>
            </div>
            <div class="selectStyle">
                时间：<input name="datetimelocal" type="datetime-local"
                          style="width: 170px;height: 20px;border-radius:10%">
            </div>
            <div class="selectStyle">
                来源：<select class="select">
                <option value="all">全部</option>
                <option value="hwl">XXX的app</option>
                <option value="gyz">XXX的web</option>
            </select>
            </div>
        </div>
    </form>
</div>
<script>
    var sel=document.getElementById("sel");
    sel.onchange=function(){
        alert(sel.options[sel.selectedIndex].value);

    }
</script>
<script src='js/jquery.js'></script>
</body>

<div id="say">
    <div class="weizi">
        <ul class="say_box">
            <div class="sy">
                <p>浇水100ml</p>
            </div>
            <span class="dateview">2017-5-16</span>
        </ul>
        <ul class="say_box">
            <div class="sy">
                <p>浇水150ml</p>
            </div>
            <span class="dateview">2017-4-30</span>
        </ul>
        <ul class="say_box">
            <div class="sy">
                <p> 浇水100ml，施肥50ml</p>
            </div>
            <span class="dateview">2017-4-16</span>
        </ul>
        <ul class="say_box">
            <div class="sy">
                <p>浇水100ml</p>
            </div>
            <span class="dateview">2017-3-31</span>
        </ul>
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
