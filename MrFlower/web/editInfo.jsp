<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/5/7
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String UserPhone = null;
    if ((UserPhone = (String) request.getAttribute("UserPhone")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="getUser"/>
<%
    }
%>
<html>

<head>
    <title></title>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <script src="js/DelCookie.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #eee;
        }

        .demo-box {
            margin: 50px auto;
            width: 520px;
            padding: 20px;
            border: 5px solid #ccc;
            background: #fff;
        }

        .demo-table {
            border-collapse: collapse;
            width: 100%;
        }

        .demo-table caption {
            border-bottom: 1px dashed #ccc;
            height: 40px;
            margin-bottom: 20px;
            font-size: 18px;
            line-height: 1.2;
            text-align: center;
        }

        .demo-table tr td {
            padding: 8px 10px;
            font-size: 16px;
            line-height: 1.8;
            vertical-align: top;
        }

        .demo-table tr th {
            padding: 8px 10px;
            font-size: 16px;
            line-height: 1.8;
            vertical-align: top;
        }

        .ui-input {
            vertical-align: top;
            height: 18px;
            font-size: 16px;
            line-height: 20px;
            border: 1px solid #aaa;
            padding: 6px 8px;
            border-radius: 3px;
        }

        ::-webkit-input-placeholder {
            font-size: 14px;
            color: #e7e7e7;
        }

        span {
            color: red;
            padding-right: 5em;
        }
    </style>
    <script language="javascript">
        $(document).ready(function () {
            <%
                out.print(request.getAttribute("error"));
            %>
            $().UItoTop({easingType: 'easeOutQuart'});
        });

        function pd() {
            var psw1 = document.getElementById("edit_pwd2").value;
            var psw2 = document.getElementById("edit_pwd3").value;
            if (psw1 != psw2) {
                $("#edit_pwd3").val("");
                alert("对不起！两次输入密码不一致！");
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
                                            out.print("<a style=\"float:left\" href=\"editInfo.jsp\">" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "|<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
                                            isLogin = true;
                                            break;
                                        }
                                    }
                                }
                                if (!isLogin)
                                    out.print("<a href=\"login.jsp\">登录&nbsp;&nbsp;|&nbsp;&nbsp注册</a>");
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
<div class="demo-box">
    <form action="changeUser" method="post">
        <table class="demo-table">
            <caption>修改用户信息</caption>
            <tr>
                <th scope="row" style="width:120px;">密码</th>
                <td><input name="user_pwd" id="edit_pwd1" type="password" value="" placeholder="验证用户密码" required
                           onkeyup="this.value=this.value.replace(' ','')"></td>
                <td><span>*</span></td>
            </tr>
            <tr>
                <th scope="row" style="width:120px;">用户名</th>
                <td><input name="user_name" id="edit_name" type="text" value="<%=UserPhone.split("\\|")[0]%>"
                           onkeyup="this.value=this.value.replace(' ','')"></td>
            </tr>
            <tr>
                <th scope="row" style="width:120px;">手机号</th>
                <td><input name="user_phone" id="edit_tel" type="tel" value="<%=UserPhone.split("\\|")[1]%>"
                           pattern="[0-9]{11}"
                           onkeyup="this.value=this.value.replace(' ','')"></td>
            </tr>
            <tr id="tr1">
                <th scope="row" style="width:120px;">新密码</th>
                <td><input name="user_newpwd" id="edit_pwd2" type="password" value=""></td>
            </tr>
            <tr id="tr2">
                <th scope="row" style="width:120px;">再次输入密码</th>
                <td><input id="edit_pwd3" type="password" value="" onblur="pd()"></td>
            </tr>
        </table>
        <div style="padding-top: 1em">
            <input style="width:60px;height:30px;margin-right: 30px" type="submit" value="确认">
            <input style="width:60px;height:30px" type="reset" value="取消">
        </div>
    </form>
</div>
<script>
    window.onload = function () {
        var editPwd1 = document.getElementById("edit_pwd1").value;
        var tr1 = document.getElementById("tr1").value;
        if (editPwd1 == "") {
            document.getElementById("tr1").style.display = "none";
            document.getElementById("tr2").style.display = "none";
        }
        $("#edit_pwd1").click(function () {
            document.getElementById("tr1").style.display = "table-row";
            document.getElementById("tr2").style.display = "table-row";
        });
    }
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