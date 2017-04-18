<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/26
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>文章</title>
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
    <script src="js/modernizr.js"></script>
    <script src="js/DelCookie.js"></script>
    <style type="text/css">
        .clearfix:after, .container:after, .tab-nav:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        /* ==========
           Setup Page */
        *, *:before, *:after {
            box-sizing: border-box;
        }

        body {
            font-family: 'Quicksand', sans-serif;
        }

        /* =================
           Container Styling */
        .container {
            position: relative;
            background: white;
            padding: 3em;
        }

        /* ===========
           Tab Styling */
        .tab-group {
            position: relative;
            border: 1px solid #eee;
            margin-top: 2.5em;
            border-radius: 0 0 10px 10px;
        }

        .tab-group section {
            opacity: 0;
            height: 0;
            padding: 0 1em;
            overflow: hidden;
            transition: opacity 0.4s ease, height 0.4s ease;
        }

        .tab-group section.active {
            opacity: 1;
            height: auto;
            overflow: visible;
        }

        .tab-nav {
            list-style: none;
            margin: -2.5em -1px 0 0;
            padding: 0;
            height: 2.5em;
            overflow: hidden;
        }

        .tab-nav li {
            display: inline;
        }

        .tab-nav li a {
            top: 1px;
            position: relative;
            display: block;
            float: left;
            border-radius: 10px 10px 0 0;
            background: #eee;
            line-height: 2em;
            padding: 0 1em;
            text-decoration: none;
            color: grey;
            margin-top: .5em;
            margin-right: 1px;
            transition: background .2s ease, line-height .2s ease, margin .2s ease;
        }

        .tab-nav li.active a {
            background: #6EB590;
            color: #5F604B;
            line-height: 2.5em;
            margin-top: 0;
        }
    </style>

    <script src="js/prefixfree.min.js"></script>
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
                        <li><a href="plant.jsp">花卉</a></li>
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
<div style="background-color: white">
    <div class="htmleaf-container" style="width: 70%;margin: auto">
        <div class="container">
            <div class="tab-group">
                <section id="tab1" title="用户">
                    <h3>
                        系统的用户管理
                    </h3>
                    <p>
                        基本的账户登陆注册与注销，资料修改，通过手机号找回密码。
                    </p>
                </section>
                <section id="tab2" title="操作">
                    <h3>
                        盆栽的操作管理
                    </h3>
                    <p>
                        当前用户下盆栽添加删除与共享，浇灌指令发出，数据采集间隔设置，拍照指令的发出。
                    </p>
                </section>
                <section id="tab3" title="报表">
                    <h3>
                        数据的报表管理
                    </h3>
                    <p>
                        单一数据时序图，多种数据时序图，当前用户下多盆栽数据对比，根据采集数据提供养护建议，植物生长警报，植物数据百科全书，数据实时刷新，生长记录相册。
                    </p>
                </section>
                <section id="tab4" title="模式">
                    <h3>
                        盆栽的模式管理
                    </h3>
                    <p>
                        模式选择，自定义模式，手动模式，无人托管模式，自动适应模式，已经模式的编辑添加与删除。
                    </p>
                </section>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-tab.js"></script>
<script type="text/javascript">
    $(function () {
        // Calling the plugin
        $('.tab-group').tabify();
    })
</script>

<!--==============================footer=================================-->
<footer style="background-color: #53534A">
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
