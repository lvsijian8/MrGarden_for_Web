<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/3/10
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录|注册</title>
    <link rel="stylesheet" href="css/login_style.css" />


    <script language="javascript">

        window.onload = function () {
            <%
                out.print(request.getAttribute("error"));
            %>
        };
    </script>
</head>
<body>

<div id="main">

    <h1>登录</h1>

    <form class="" method="post" action="loginWeb">

        <div class="row usernmae">
            <input type="text" id="username" name="usernmae" placeholder="用户名" onkeyup="this.value=this.value.replace(' ','')" required/>
            <img id="clear1" src="images/icon_delete.png" width="20px"/>
        </div>

        <div class="row pass">
            <input type="password" id="password1" name="password1" placeholder="密码" onkeyup="this.value=this.value.replace(' ','')" required/>
            <img id="demo_img" onclick="hideShowPsw()" src="images/Invisible.png" width="20px">
        </div>
        <span>错误提示！！！！</span>

        <!-- The rotating arrow -->
        <div class="arrowCap"></div>
        <div class="arrow"></div>

        <p class="meterText">Password Meter</p>
        <br/><br/><br/>
        <input type="submit" value="登录" />

        <a href="signup.jsp" style="float:left;padding: 0.6em 0 0 1em">新用户注册</a>
        <a href="forget.jsp" style="float:right;padding: 0.6em 1em 0 0">忘记密码？</a>
    </form>
</div>
<footer>

    <a class="al3xis">Copyright © 2017.MrGarden name All rights reserved.</a>
</footer>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.complexify.js"></script>
<script src="js/signup.js"></script>

<script src="js/login.js"></script>
</body>
</html>