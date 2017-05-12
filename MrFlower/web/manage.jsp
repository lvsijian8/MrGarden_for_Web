<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/3/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备管理</title>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .demo {
            background: #f9f9f9;
            padding: 1.5em 0;
        }

        a:hover, a:focus {
            outline: none;
            text-decoration: none;
        }

        .tab .nav-tabs {
            position: relative;
            border-bottom: 0 none;
        }

        .tab .nav-tabs li {
            text-align: center;
        }

        .tab .nav-tabs li a {
            display: block;
            height: 70px;
            line-height: 65px;
            background: linear-gradient(165deg, transparent 29%, #908a78 30%);
            font-size: 15px;
            font-weight: 600;
            color: #fff;
            text-transform: uppercase;
            margin-right: 0;
            border-radius: 0;
            border: none;
            position: relative;
            transition: all 0.5s ease 0s;
        }

        .tab .nav-tabs li.active a,
        .tab .nav-tabs li a:hover {
            background: linear-gradient(165deg, transparent 29%, #efe8d5 30%);
            border: none;
            color: #908a78;
        }

        .tab .nav-tabs li a:before {
            content: "";
            height: 70px;
            line-height: 90px;
            border-bottom: 70px solid rgba(0, 0, 0, 0.1);
            border-right: 10px solid transparent;
            position: absolute;
            top: 0;
            left: 100%;
            z-index: 1;
        }

        .tab .nav-tabs li:last-child a:before {
            border: none;
        }

        .tab .tab-content {
            font-size: 14px;
            color: #6f6c6c;
            line-height: 26px;
            background: #efe8d5;
            padding: 20px;
        }

        .tab .tab-content h3 {
            font-size: 24px;
            color: #6f6c6c;
            margin-top: 0;
        }

        .tab .tab-content p {
            margin-bottom: 0;
        }

        @media only screen and (max-width: 480px) {
            .tab .nav-tabs li {
                width: 100%;
                margin-bottom: 8px;
            }

            .tab .nav-tabs li:last-child {
                margin-bottom: 0;
            }

            .tab .nav-tabs li a:before {
                border: none;
            }
        }

        .delectPot {
            border: none;
            width: 205px;
            height: 54px;
            line-height: 24px;
            padding: 0 2px 4px 0;
            *padding-bottom: 0;
            background: url(images/bg1.png) no-repeat;
            font: 26px/35px "Microsoft YaHei", Verdana, Geneva, sans-serif;
            color: #fff;
            cursor: pointer;
        }
    </style>
    <script>

        window.onload = function () {
            <%
                out.print(request.getAttribute("error"));
            %>
        };

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
                                        out.print("<a style=\"float:left\" href=\"editInfo.jsp\">" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "&nbsp;&nbsp;|&nbsp;&nbsp;<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
                                        isLogin = true;
                                        break;
                                    }
                                }
                            }
                            if (!isLogin)
                                out.print("<a href=\"login.jsp\">登录&nbsp;&nbsp;|&nbsp;&nbsp注册</a>");
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
<div class="demo">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="tab" role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab"
                                                                  data-toggle="tab">浇水设置</a></li>
                        <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab"
                                                   data-toggle="tab">施肥设置</a></li>
                        <li role="presentation"><a href="#Section3" aria-controls="profile" role="tab"
                                                   data-toggle="tab">删除花盆</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content tabs">
                        <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                            <h3>浇水时间间隔设置(天)</h3>
                            <script>
                                function value_change() {
                                    var number = document.getElementById("range").value;
                                    document.getElementById("output").value = number;
                                }
                            </script>
                            <form id="testform" action="setTimeMl?type=w&pot_id=<%=request.getParameter("pot_id")%>"
                                  method="post">
                                <input type="submit" style="float: right;padding:0 1em;margin-right: 5em"
                                       value="提&nbsp;&nbsp;交"><br>
                                <div style="display: inline">
                                    <input id="range" type="range" min="1" max="30" value="1"
                                           style="float: left;width: 200px" onchange="value_change()" name="day">
                                    <output id="output">1</output>
                                </div>
                                <input type="reset" style="float: right;padding:0 1em;margin-right: 5em"
                                       value="重&nbsp;&nbsp;置">
                                <h3>浇水时间设置</h3>
                                <input name="time" type="text" value="10">点
                                <span style="float: right;padding:0 1em;margin-right: 5em;font-size: 20px">
                                    <%
                                        try {
                                            if (request.getAttribute("speak") != null && request.getAttribute("type").equals("w"))
                                                out.print(request.getAttribute("speak"));
                                        } catch (Exception e) {
                                        }
                                    %>
                                </span>
                                <h3>浇水量(ml)</h3>
                                <input name="ml" type="number" value="50" min="10" max="200" step="10">
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section2">
                            <h3>施肥时间间隔设置(天)</h3>
                            <script>
                                function value_change1() {
                                    var number = document.getElementById("range1").value;
                                    document.getElementById("output1").value = number;
                                }
                            </script>
                            <form id="testform1" style="display: inline"
                                  action="setTimeMl?type=f&pot_id=<%=request.getParameter("pot_id")%>" method="post">
                                <input type="submit" style="float: right;padding:0 1em;margin-right: 5em"
                                       value="提&nbsp;&nbsp;交"><br>
                                <div style="display: inline">
                                    <input id="range1" type="range" min="1" max="30" value="7"
                                           style="float: left;width: 200px" onchange="value_change1()" name="day">
                                    <output id="output1">7</output>
                                </div>
                                <input type="reset" style="float: right;padding:0 1em;margin-right: 5em"
                                       value="重&nbsp;&nbsp;置">
                                <h3>施肥时间设置</h3>
                                <input name="time" type="text" value="10">点
                                <span style="float: right;padding:0 1em;margin-right: 5em;font-size: 20px">
                                    <%
                                        try {
                                            if (request.getAttribute("speak") != null && request.getAttribute("type").equals("f"))
                                                out.print(request.getAttribute("speak"));
                                        } catch (Exception e) {
                                        }
                                    %>
                                </span>

                                <h3>施肥量(ml)</h3>
                                <input name="ml" type="number" value="50" min="10" max="200" step="10">
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section3">
                            <form id="testform2" action="deletepot?pot_id=<%=request.getParameter("pot_id")%>"
                                  method="post">
                                <h3>点击删除按钮删除花盆</h3>
                                <div style="padding: 10px 0">
                                    <input value="删&nbsp;&nbsp;除" class="delectPot" type="submit">
                                </div>
                                <br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<!--==============================footer=================================-->
<footer style="background-color: #53534a;">
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
