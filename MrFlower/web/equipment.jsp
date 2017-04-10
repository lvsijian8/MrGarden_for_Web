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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="css/framework.css"/>
    <link type="text/css" rel="stylesheet" href="css/main.css"/>
    <style type="text/css">
        a:hover, a:focus {
            text-decoration: none;
            outline: none;
        }

        #accordion {
            padding-right: 24px;
            padding-left: 24px;
            z-index: 1;
        }

        #accordion .panel {
            border: none;
            box-shadow: none;
        }

        #accordion .panel-heading {
            padding: 0;
            border-radius: 0;
            border: none;
        }

        #accordion .panel-title {
            padding: 0;
        }

        #accordion .panel-title a {
            display: block;
            font-size: 16px;
            font-weight: bold;
            background: #e16b47;
            color: #f7c59f;
            padding: 15px 25px;
            position: relative;
            margin-left: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed {
            background: #f7c59f;
            color: #e16b47;
            margin-left: 0;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a:before {
            content: "";
            border-left: 24px solid #e16b47;
            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
            position: absolute;
            top: 0;
            right: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed:before {
            border-left-color: #f7c59f;
        }

        #accordion .panel-title a:after {
            content: "\f106";
            font-family: 'FontAwesome';
            position: absolute;
            top: 30%;
            right: 15px;
            font-size: 18px;
            color: #f7c59f;
        }

        #accordion .panel-title a.collapsed:after {
            content: "\f107";
            color: #e16b47;
        }

        #accordion .panel-collapse {
            position: relative;
        }

        #accordion .panel-collapse.in:before {
            content: "";
            border-right: 24px solid #f7c59f;
            border-bottom: 18px solid transparent;
            position: absolute;
            top: 0;
            left: -24px;
        }

        #accordion .panel-body {
            font-size: 14px;
            color: #333;
            background: #e4e4e4;
            border-top: none;
            z-index: 1;
        }
    </style>
    <script>
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
        })
    </script>

    <script type="text/javascript" language="javascript">
        function iFrameHeight() {
            var ifm = document.getElementById("iframepage");
            var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;
            if (ifm != null && subWeb != null) {
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
<div class="demo" style="padding: 3em 10em 0 0; background-color: #f9f9f9;">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    选择您的花盆
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <form class="form" method="post">
                                    <input type="radio" id="hwl" name="radio" value="虎尾兰" checked><label
                                        for="hwl">虎尾兰</label><br/>
                                    <input type="radio" id="gyz" name="radio" value="观音竹"><label for="gyz">观音竹</label>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<div style="text-align: center;background-color: #f9f9f9">
    <div style="padding: 18px">
        <h1 style="font-size: 24px">设备状态</h1>
    </div>
    <div>
        <!--figure>
            <iframe src="guanli.html" width="80%" height="400px"></iframe>
        </figure-->
        <div id="page-wrapper">
            <div class="graphs" style="width: 80%;margin:0 auto">
                <div class="col_3" style="border-bottom-color: #e6e6e6;display:inline;">
                    <div class="col-md-3 widget widget1" style="float: left" >
                        <div class="r3_counter_box">
                            <i class="fa"><img src="images/Temperature.png"> </i>
                            <div class="stats">
                                <h5>30<span>°C</span></h5>
                                <div class="grow grow3">
                                    <p>温度</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget widget1" style="float: left">
                        <div class="r3_counter_box">
                            <i class="fa"><img src="images/Humidity.png"></i>
                            <div class="stats">
                                <h5>30<span>%</span></h5>
                                <div class="grow grow1">
                                    <p>湿度</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget widget1" style="float: left">
                        <div class="r3_counter_box">
                            <i class="fa"><img src="images/Battery_Full.png"> </i>
                            <div class="stats">
                                <h5>100<span>%</span></h5>
                                <div class="grow">
                                    <p>电量</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget widget1" style="float: left">
                        <div class="r3_counter_box">
                            <i class="fa"><img src="images/Sun.png"> </i>
                            <div class="stats">
                                <h5>强<span></span></h5>
                                <div class="grow grow2">
                                    <p>光照</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link href="css/guanli_style.css" rel='stylesheet' type='text/css'/>
    <link href="css/font-awesome2.css" rel="stylesheet">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div style="padding: 3em 0;float: none;">
        <h1 style="font-size: 24px;">设备控制</h1>
    </div>
    <div class="page" style="background-color: #f9f9f9;width: 50%;margin:0 auto;">

        <!--the main content begin-->
        <div class="container">
            <!--the content-->
            <div class="ui grid">

                <!--the Devicelist-->
                <div class="twelve wide column">
                    <!--the device content-->
                    <div class="ui device two column middle aligned vertical grid segment" style="width: 90%;margin: 22px auto">
                        <div class="column verborder" style="padding-left: 12em">
                            <div class="ui info segment">
                                <p><img src="images/Watering_Can.png">水</p>
                                <p>水剩余： <span class="stress">100%</span></p>
                                <p>上次浇水时间： <span class="stress">1小时前</span></p>
                                <p>建议浇水时间： <span class="stress">23小时后</span></p>
                                <p>建议： <span class="stress">水量充足，不需要添加水</span></p>
                            </div>
                        </div>
                        <div class="center aligned column">
                            <div class="ui buttons">
                                <input type="button" id="green1" value="点击加水"
                                       style="height: 33px;border: 2px solid #f9f9f9;border-radius: 2px;background-color: transparent;"></input>
                                <a class="ui tiny green button" href="manage.jsp"><i><img src="images/Settings.png"
                                                                                          width="14px" height="auto">
                                </i>管 理</a>
                                <a class="ui tiny blue button" href="history.jsp"><i><img src="images/Clock.png"
                                                                                          width="14px"
                                                                                          height="auto"></i>历 史</a>
                            </div>
                        </div>
                    </div>
                    <!--another device content-->
                    <div class="ui two column device middle aligned vertical grid segment" style="width: 90%;margin: 22px auto">
                        <div class="column verborder" style="padding-left: 12em">
                            <div class="ui info segment">
                                <p><img src="images/Bottle_of_Water.png">营养液</p>
                                <p>营养液剩余： <span class="stress">10%</span></p>
                                <p>上次加营养液时间： <span class="stress">1天前</span></p>
                                <p>建议加营养液时间： <span class="stress">6天后</span></p>
                                <p>建议： <span class="stress">营养液余量不足，需要添加营养液</span></p>
                            </div>
                        </div>
                        <div class="center aligned column">
                            <div class="ui buttons">
                                <input type="button" id="green2" value="点击施肥"
                                       style="height: 33px;border: 2px solid #f9f9f9;border-radius: 2px;background-color: transparent;"></input>
                                <a class="ui tiny green button" href="#"><i><img src="images/Settings.png" width="14px"
                                                                                 height="auto"> </i>管 理</a>
                                <a class="ui tiny blue button" href="history.jsp"><i><img src="images/Clock.png"
                                                                                          width="14px"
                                                                                          height="auto"></i>历 史</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var wait = 10;
        function time(i) {
            if (wait == 0) {

                i.removeAttribute("disabled");
                i.value = "继续添加";
                wait = 10;
            } else {
                i.setAttribute("disabled", true);
                i.value = "正在添加";

                wait--;
                setTimeout(function () {
                        time(i)
                    },
                    1000)
            }
        }
        document.getElementById("green1").onclick = function () {
            time(this);
        };
        document.getElementById("green2").onclick = function () {
            time(this);
        }
    </script>


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
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>

</body>
</html>