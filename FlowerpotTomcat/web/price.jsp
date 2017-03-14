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
    <title>价格</title>
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
<div class="content">
    <div class="container_12">
        <div class="grid_12">
            <h2>推荐</h2>
        </div>
        <div class="grid_6">
            <div class="img_block fleft">
                <img src="images/page4_img1.jpg" alt="" class="img_inner">
                <span class="l"></span>
                <span class="ll"></span>
                <span class="r"></span>
                <span class="rr"></span>
                <span class="lb"></span>
                <span class="llb"></span>
                <span class="rb"></span>
                <span class="rrb"></span>
            </div>
            <div class="extra_wrapper">
                <div class="text1"><a href="#">Vivamus at magna non</a></div>
                Vivamus at magna non nunc stique rhoncusy. Aliquam nibh ante stas luctus lraesent faucibus malesuada ucibusnec <br>
                <a href="#" class="btn">查看更多</a>
            </div>
        </div>
        <div class="grid_6">
            <div class="img_block fleft">
                <img src="images/page4_img2.jpg" alt="" class="img_inner">
                <span class="l"></span>
                <span class="ll"></span>
                <span class="r"></span>
                <span class="rr"></span>
                <span class="lb"></span>
                <span class="llb"></span>
                <span class="rb"></span>
                <span class="rrb"></span>
            </div>
            <div class="extra_wrapper">
                <div class="text1"><a href="#">Nullam consectetury mol</a></div>
                Integer convallis orci vel mi oreet, at ornarem consequat. Phasellus erat nisl, auctor vel velit spharetra venenatis nullaestibulumat turpi <br>
                <a href="#" class="btn">查看更多</a>
            </div>
        </div>
    </div>
</div>
<div class="bottom_block pb1">
    <div class="container_12">
        <div class="grid_11">
            <h2>价格列表</h2>
            <div class="img_block fleft ib2">
                <img src="images/page4_img3.jpg" alt="" class="img_inner">
                <span class="l"></span>
                <span class="ll"></span>
                <span class="r"></span>
                <span class="rr"></span>
                <span class="lb"></span>
                <span class="llb"></span>
                <span class="rb"></span>
                <span class="rrb"></span>
            </div>
            <div class="extra_wrapper">
                <ul class="list l1">
                    <li>
                        <div class="price"><a href="#">Quisque viverra meloto / Pulvinar urna</a><span>$ 45.20</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Lulla nunc, eultri dertolo</a><span>$ 120.10</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Kultricies egeter julomm/ Donec non sapien atero</a><span>$ 63.50</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Viverra nulla nuncyll lomi</a><span>$ 90.30</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Es libero ultricies eget</a><span>$ 45.60</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Fusce adipiscing quamery lotto / Curabitur</a><span>$ 50.79 </span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Risus sagittis non</a><span>$ 80.45</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Anterterdum remelo der Consequat adreno</a><span>$ 30.90</span></div>
                    </li>
                    <li>
                        <div class="price"><a href="#">Rem conseq undo</a><span>$ 70.20</span></div>
                    </li>
                </ul>
            </div>
        </div>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>

</body>
</html>
