<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/11
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备</title>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no" />
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico" />
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script>
        $(document).ready(function(){
            $().UItoTop({ easingType: 'easeOutQuart' });
        })
    </script>

    <script type="text/javascript" language="javascript">
        function iFrameHeight() {
            var ifm= document.getElementById("iframepage");
            var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;
            if(ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
                ifm.width = subWeb.body.scrollWidth;
            }
        }
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
                        <li><a href="price.jsp">价格</a></li>
                        <li><a href="Contacts.jsp">联系我们</a></li>
                        <li><a href="login.jsp">登录|注册</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</header>

<!--==============================Content=================================-->
    <div>
        <figure>
            <iframe src="guanli.html" width="100%" height="400px"></iframe>
        </figure>
    </div>

<!--==============================footer=================================-->
<footer>
    <div class="container_12">
        <div class="grid_12 ">
            <div class="copy">
                Copyright &copy; 2014.Company name All rights reserved.
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>

</body>
</html>
