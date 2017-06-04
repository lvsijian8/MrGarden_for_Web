<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/6/4
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <link rel="stylesheet" href="css/signup_style.css" />
</head>
<body>

<div id="main">

    <h1>Sign up, it's FREE!</h1>

    <form class="" method="post" action="">

        <div class="row usernmae">
            <input type="text" id="username" name="username" placeholder="用户名" onkeyup="this.value=this.value.replace(' ','')" required/>
            <img id="clear1" src="images/icon_delete.png" width="20px"/>
        </div>

        <div class="row phone">
            <input type="text" id="phone" name="phone" placeholder="手机号" onkeyup="this.value=this.value.replace(' ','')" required/>
            <img id="clear2" src="images/icon_delete.png" width="20px"/>
        </div>

        <div class="row pass">
            <input type="password" id="password1" name="password1" placeholder="密码" onkeyup="this.value=this.value.replace(' ','')" required/>
            <img id="demo_img" onclick="hideShowPsw()" src="images/Invisible.png" width="20px">
        </div>

        <div class="row pass">
            <input type="password" id="password2" name="password2" placeholder="重输密码" onkeyup="this.value=this.value.replace(' ','')" disabled="disable" required/>
            <img id="demo_img2" onclick="hideShowPsw2()" src="images/Invisible.png" width="20px">
        </div>
        <span>111</span>
        <!-- The rotating arrow -->
        <div class="arrowCap"></div>
        <div class="arrow"></div>

        <p class="meterText">Password Meter</p>

        <input type="submit" value="Register" />

        <a href="login.jsp" style="float:left;padding-left: 1em">已有账号？点击登录</a>

    </form>
</div>
<footer>

    <a class="al3xis">Copyright © 2017.MrGarden name All rights reserved.</a>
</footer>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.complexify.js"></script>
<script src="js/signup.js"></script>


</body>
</html>
