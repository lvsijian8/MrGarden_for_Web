<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/9
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>首页</title>
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
            <div class="slogan">glorify the nature around you</div>
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
                        <li>
                            <%
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
                            %>
                        </li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</header>
<!--==============================Content=================================-->
<div class="content">
    <div class="container_12" style="padding-top: 2em">
        <div class="grid_4">
            <div class="block1">
                <div class="img_block">
                    <img src="images/page1_img1.jpg" alt="" class="img_inner">
                    <span class="l"></span>
                    <span class="ll"></span>
                    <span class="r"></span>
                    <span class="rr"></span>
                    <span class="lb"></span>
                    <span class="llb"></span>
                    <span class="rb"></span>
                    <span class="rrb"></span>
                </div>
                <div class="text1">花盆正视图</div>
                <br>
            </div>
        </div>
        <div class="grid_4">
            <div class="block1">
                <div class="img_block">
                    <img src="images/page1_img2.jpg" alt="" class="img_inner">
                    <span class="l"></span>
                    <span class="ll"></span>
                    <span class="r"></span>
                    <span class="rr"></span>
                    <span class="lb"></span>
                    <span class="llb"></span>
                    <span class="rb"></span>
                    <span class="rrb"></span>
                </div>
                <div class="text1">花盆侧视图</div>
                <br>
            </div>
        </div>
        <div class="grid_4">
            <div class="block1">
                <div class="img_block">
                    <img src="images/page1_img3.jpg" alt="" class="img_inner">
                    <span class="l"></span>
                    <span class="ll"></span>
                    <span class="r"></span>
                    <span class="rr"></span>
                    <span class="lb"></span>
                    <span class="llb"></span>
                    <span class="rb"></span>
                    <span class="rrb"></span>
                </div>
                <div class="text1">花盆顶视图</div>
                <br>
            </div>
        </div>
        <div class="clear"></div>
        <div class="grid_8">
            <h3>关于系统</h3>
            <div id="owl">
                <div class="item">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统在讯通方面采用服务器做为中转站，确保硬件，软件与数据库之间准确稳定独立的通讯，数据的存储与调用方便快捷，各个通讯模块之间相互独立也让后期的维护工作更加方便简单。 </p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在硬件方面使用无线通信模块使得监控与控制不受空间和时间限制，并且使用了成本低易于推广的开源硬件，采用DS3231高精度时钟模块让周期栽培的时间更加精准，以及大量高精度传感器使数据更加准确。</p>
                </div>
                <div class="item">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在功能方面即使是无人看护的情况下系统也能保证植物的正常生长，并且通过机器学习使得智慧盆栽可以在较短的时间内即可掌握不同植物在不同时期的独特需求从而始终做到以最合适的方式进行护养。并且在种植业中可以轻易的实现无人远程批量管理。在数据采集方面最优算法用于排除异常数据大大提高数据的准确性。
                </div>
            </div>
        </div>
        <div class="grid_4">
            <h3>系统能做什么</h3>
            <ul class="list">
                <li><a href="article.jsp#tab1">系统的用户管理</a></li>
                <li><a href="article.jsp#tab2">盆栽的操作管理</a></li>
                <li><a href="article.jsp#tab3">数据的报表管理</a></li>
                <li><a href="article.jsp#tab4">盆栽的模式管理</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="bottom_block">
    <div class="container_12">
        <div class="grid_3">
            <h3>其他项目</h3>
            <div id="owl1">
                <div class="item">
                    <div class="img_block ib1">
                        <img src="images/car_img1.jpg" style="width: 129px" title="在线数据库管理系统" class=" img_inner" onclick="window.location.href='https://lvsijian.cn/OnlineDB'">
                        <span class="l"></span>
                        <span class="ll"></span>
                        <span class="r"></span>
                        <span class="rr"></span>
                        <span class="lb"></span>
                        <span class="llb"></span>
                        <span class="rb"></span>
                        <span class="rrb"></span>
                    </div>
                </div>
                <div class="item">
                    <div class="img_block ib1">
                        <img src="images/car_img2.jpg" style="width: 129px" title="移动开发与数据计算实验室管理系统" class="img_inner" onclick="window.location.href='https://lvsijian.cn/MDACD'">
                        <span class="l"></span>
                        <span class="ll"></span>
                        <span class="r"></span>
                        <span class="rr"></span>
                        <span class="lb"></span>
                        <span class="llb"></span>
                        <span class="rb"></span>
                        <span class="rrb"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid_4 prefix_1">
            <h3>最新消息</h3>
            <p class="col1" style="font-size: 15px" id="download">
                <time datetime="2017-04-12">2017-04-12</time>
                -
                <a href="http://android.myapp.com/myapp/detail.htm?apkName=com.lvsijian8.flowerpot">花伴安卓版APP发布(PC版应用宝地址)</a>
            </p>
            <p class="col1" style="font-size: 15px" id="download1">
                <time datetime="2017-04-12">2017-04-12</time>
                -
                <a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.lvsijian8.flowerpot">花伴安卓版APP发布(手机版应用宝地址)</a>
            </p>
            <img src="images/appdownload.png" title="扫码下载app" style="width: 96px;height: auto">
        </div>
        <div class="grid_4">
            <h3>邮件订阅</h3>
            <p>输入您的邮箱订阅网站最新信息 </p>
            <form id="newsletter">
                <div class="rel">
                    <div class="success">您的订阅请求已成功发送!</div>
                    <label class="email">
                        <input id="email" type="email" value="请输入您的邮箱...">
                        <a href="#" id="submit1" class="submit1" data-type="submit" onclick="reg()">提交</a>
                        <span class="error"><font color="red">*这不是有效的邮箱地址.</font></span>
                    </label>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function reg() {
        var email = document.getElementById("email").value;
        if (email != "") {
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            isok = reg.test(email);
            if (!isok) {
                alert("邮箱格式不正确，请重新输入！");
                document.getElementById("email").focus();
                return false;
            }
            alert("提交成功！");
            window.location.reload();
        }
    }
</script>
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
</body>
</html>
