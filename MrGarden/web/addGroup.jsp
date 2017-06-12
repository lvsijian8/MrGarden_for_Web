<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/6/3
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>添加组</title>
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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/modernizr.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/framework.css"/>
    <link type="text/css" rel="stylesheet" href="css/main.css"/>
    <style>
        table {
            line-height: 45px;
            border-collapse: collapse;
        }

        tr {
            padding: 1em;
        }
    </style>

    <script language="javascript">
        window.onload = function () {
            <%=request.getAttribute("error")%>
        };
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
                        <li><a href="manage_all.jsp">设备</a></li>
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
                                out.print("<a href=\"login.jsp\">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp<a href=\"signup.jsp\">注册</a>");
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

<div style="background-color: white;padding-left: 20em; padding-bottom: 2em">
    <!--the newDevice form-->
    <div class="twelve wide column" style="width: 80%">
        <div class="pageHeader">
            <div class="segment">
                <h3 class="ui dividing header">
                    <div class="content" style="padding: 20px 0">
                        <img src="images/Plus_Math.png" width="30px" height="auto">添加组
                        <div class="sub header">将您的设备连接到云端</div>
                    </div>
                </h3>
            </div>
        </div>
        <div class="ui form fluid vertical segment">
            <form name="form" action="addGroup" method="post">
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">组名</h5>
                        <div class="ui small left labeled icon input">
                            <input type="text" placeholder="给您的组起个名,您容易记住就行，10个字符内……" id="device_title"
                                   name="group_name" maxlength='10' required/>
                        </div>
                    </div>
                </div>
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">描述</h5>
                        <textarea placeholder="不超过30个字符……" maxlength='30' name="group_text"></textarea>
                    </div>
                </div>
                <input class="ui small blue submit button" type="submit" value="保存">
                <input class="ui small basic button" type="reset" value="重置">

                <!--the form end-->
            </form>
        </div>
    </div>
</div>
<script>
    function tofid(fid) {
        document.getElementById("fromfid").value = fid;
    }
</script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tabcomplete.min.js"></script>
<script src="js/livefilter.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="js/filterlist.js"></script>
<script src="js/plugins.js"></script>
<!--==============================footer=================================-->
<footer>
    <div class="container_12">
        <div class="grid_12 ">
            <div class="copy">
                Copyright &copy; 2017.MrGarden All rights reserved.
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>

</body>
</html>
