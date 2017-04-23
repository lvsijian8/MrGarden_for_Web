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
        p{
            font-size: 18px;
            line-height: 30px;
        }
        h3{
            text-align: center;
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本的账户登陆注册与注销，资料修改，通过手机号找回密码。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为了保证用户数据和种植系统的安全性，每位用户的每次操作信息都将完整记入历史记录供未来查看，每次登陆注册地理位置ip信息也同样可以在自己的历史记录中进行查看，保证用户安全。并且全站全部的网络通信都以采用HTTPS加密，配合linux良好的安全性稳定性以提供最佳的用户体验。
                    </p>
                </section>
                <section id="tab2" title="操作">
                    <h3>
                        盆栽的操作管理
                    </h3>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前用户名下盆栽添加删除与共享，植物实时状态更新查看，远程灌溉，数据自动采集设置，历史操作记录查询。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户可以随时通过web浏览器和智能手机控制自己名下的任一个在线的系统，进行延迟在2秒内的远程浇水、状态实时更新查看等操作，并且系统会对统计植物的大量历史数据进行差异化系统分析给予用户适当的种植改进意见。植物护养将自动根据不同植物不同需水量进行定制化操作，用户同样可以根据个人喜好修改自动化操作。当系统离线时，会对采集数据离线保存等待网络恢复同步。并且每次操作都将记录入历史记录以备查询，登录注册等重要操作还将自动记录登陆位置ip。
                    </p>
                </section>
                <section id="tab3" title="报表">
                    <h3>
                        数据的报表管理
                    </h3>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单一数据时序图，多种数据时序图，当前用户下多盆栽数据对比，根据采集数据提供养护建议，植物生长警报，植物数据百科全书，数据远程实时刷新。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本系统能够远程实时检测植物生长环境数据，并能高效分析处理给予用户种植改进建议。通过物联网技术，用户可以随时随地的用智能手机和web浏览器实时查看数据报表。并且使用者还可以根据反馈建议实时数据的变化来更好的调整种植系统，从而实现智能种植的理念。
                    </p>
                </section>
                <section id="tab4" title="模式">
                    <h3>
                        盆栽的模式管理
                    </h3>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;模式选择，自定义模式，手动模式，无人托管模式，自动适应模式，已经模式的编辑添加与删除。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自动栽培依靠系统检测到的植物生长情况与用户实现设置好的或即时发出的浇灌指令执行；生长环境数据由大量高精度传感器所检测、开源硬件收集并通过ESP8266无线通讯模块发送至服务器端分析存储后，通过App端、Web端反馈给用户。
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
