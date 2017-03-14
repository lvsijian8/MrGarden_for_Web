<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/11
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图表</title>
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
    <link rel="stylesheet" href="css/chart_reset.css">
    <link rel="stylesheet" href="css/chart_style.css" media="screen" type="text/css" />
    <script src="js/modernizr.js"></script>
    <script>
        $(document).ready(function(){
            $().UItoTop({ easingType: 'easeOutQuart' });
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
                            <li><a href="price.jsp">价格</a></li>
                            <li><a href="Contacts.jsp">联系</a></li>
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
    <div style="text-align:center;clear:both;">
        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
        <script src="/follow.js" type="text/javascript"></script>
    </div>
    <div class="charts-container cf">
        <div class="chart" id="graph-1-container">
            <h2 class="title">温度(0-90°C)</h2>
            <div class="chart-svg">
                <svg class="chart-line" id="chart-1" viewBox="0 0 80 40">
                    <defs>
                        <clipPath id="clip" x="0" y="0" width="80" height="40" >
                            <rect id="clip-rect" x="-80" y="0" width="77" height="38.7"/>
                        </clipPath>

                        <linearGradient id="gradient-1">
                            <stop offset="0" stop-color="#00d5bd" />
                            <stop offset="100" stop-color="#24c1ed" />
                        </linearGradient>

                        <linearGradient id="gradient-2">
                            <stop offset="0" stop-color="#954ce9" />
                            <stop offset="0.3" stop-color="#954ce9" />
                            <stop offset="0.6" stop-color="#24c1ed" />
                            <stop offset="1" stop-color="#24c1ed" />
                        </linearGradient>

                        <linearGradient id="gradient-3" x1="0%" y1="0%" x2="0%" y2="100%">>
                            <stop offset="0" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0.07"/>
                            <stop offset="0.5" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0.13"/>
                            <stop offset="1" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0"/>
                        </linearGradient>

                        <linearGradient id="gradient-4" x1="0%" y1="0%" x2="0%" y2="100%">>
                            <stop offset="0" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0.07"/>
                            <stop offset="0.5" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0.13"/>
                            <stop offset="1" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0"/>
                        </linearGradient>

                    </defs>
                </svg>
                <h3 class="valueX">时间/天</h3>
            </div>
            <!--div class="chart-values">
                <p class="h-value">1689h</p>
                <p class="percentage-value"></p>
                <p class="total-gain"></p>
            </div-->
            <div class="triangle green"></div>
        </div>
        <div class="chart" id="graph-2-container">
            <h2 class="title">湿度(0-90%)</h2>
            <div class="chart-svg">
                <svg class="chart-line" id="chart-2" viewBox="0 0 80 40">
                </svg>
                <h3 class="valueX">时间/天</h3>
            </div>
            <!--div class="chart-values">
                <p class="h-value">322h</p>
                <p class="percentage-value"></p>
                <p class="total-gain"></p>
            </div-->
            <div class="triangle red"></div>
        </div>
        <div class="chart circle" id="circle-1">
            <h2 class="title">水位</h2>
            <div class="chart-svg align-center">
                <h2 class="circle-percentage"></h2>
                <svg class="chart-circle" id="chart-3" width="50%" viewBox="0 0 100 100">
                    <path class="underlay" d="M5,50 A45,45,0 1 1 95,50 A45,45,0 1 1 5,50"/>
                </svg>
            </div>
            <div class="triangle green"></div>
        </div>
        <div class="chart circle" id="circle-2">
            <h2 class="title">营养液</h2>
            <div class="chart-svg align-center">
                <h2 class="circle-percentage"></h2>
                <svg class="chart-circle" id="chart-4" width="50%" viewBox="0 0 100 100">
                    <path class="underlay" d="M5,50 A45,45,0 1 1 95,50 A45,45,0 1 1 5,50"/>
                </svg>
            </div>
            <div class="triangle red"></div>
        </div>
    </div>

    <div style="text-align:center;clear:both;">
        <script src="/gg_bd_ad_720x90-2.js" type="text/javascript"></script>
        <script src="/follow.js" type="text/javascript"></script>
    </div>

    <script src='js/jquery.js'></script>
    <script src='js/snap.svg-min.js'></script>

    <script src="js/index.js"></script>

    <!--==============================footer=================================-->
    <footer style="background-color: #aea9a9">
        <div class="container_12">
            <div class="grid_12 ">
                <div class="copy">
                    Copyright &copy; 2017.Mr.Flower All rights reserved.
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </footer>
    <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>

</body>
</html>
