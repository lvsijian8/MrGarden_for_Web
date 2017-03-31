<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/26
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <link rel="stylesheet" href="css/chart_reset.css">
    <link rel="stylesheet" href="css/chart_style.css" media="screen" type="text/css"/>
    <script src="js/modernizr.js"></script>
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
<div style="text-align: center;width: 750px;margin:auto;color: #7a7a7a;font: 14px/20px Arial, Helvetica, sans-serif;padding-bottom: 2em">
    <div id="article1">
        <h1>第一段</h1>
        <p>系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
    <div id="article2">
        <h1>第二段</h1>
        <p>系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
    <div id="article3">
        <h1>第三段</h1>
        <p> 系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
    <div id="article4">
        <h1>第四段</h1>
        <p> 系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
    <div id="article5">
        <h1>第五段</h1>
        <p> 系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
    <div id="article6">
        <h1>第六段</h1>
        <p> 系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
            系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。
        </p>
    </div>
</div>


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
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>

</body>
</html>
