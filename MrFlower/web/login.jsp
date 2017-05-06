<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/10
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录|注册</title>
    <link rel="stylesheet" href="css/login_style.css">
    <link href="css/fonts.css" rel="stylesheet">
    <link rel='stylesheet prefetch' href="css/fonts.css">


    <script language="javascript">

        window.onload = function () {
            <%
                out.print(request.getAttribute("error"));
            %>
        };

        function pd() {
            var psw1 = document.getElementById("password2").value;
            var psw2 = document.getElementById("password3").value;
            if (psw1 != psw2) {
                alert("对不起!重复密码不等于登录密码");
            }

        }

    </script>
</head>
<body>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>登录</h2>
                        <p>点击登录按钮进入.</p>
                        <button class="btn_login" onClick="cambiar_login()">登录</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>注册</h2>
                        <p>点击注册按钮加入我们.</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">注册</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"><img src="images/po.jpg" alt=""/></div>
            </div>
            <div class="cont_forms">
                <div class="cont_img_back_"><img src="images/po.jpg" alt=""/></div>
                <form action="loginWeb" method="post">
                    <div class="cont_form_login"><a href="#" onClick="ocultar_login_sign_up()"><i
                            class="material-icons">&#xE5C4;</i></a>
                        <h2>登录</h2>
                        <input type="text" placeholder="用户名" required onkeyup="this.value=this.value.replace(' ','')"
                               name="user_name"/>
                        <input type="password" placeholder="密码" id="password1" required

                               onkeyup="this.value=this.value.replace(' ','')" name="user_pwd"/><br/><br/>
                        <div style="float: right;padding-right: 2em"><input type="checkbox" name="remember"
                                                                            style="width: 15px"><font color="#757575">&nbsp;&nbsp;记住密码</font>
                        </div>
                        <br><br>
                        <button class="btn_login" onClick="login()" type="submit">登录</button>
                        <%--<input class="btn_login" onClick="login()" type="submit" value="登录"/>--%>
                    </div>
                </form>
                <form action="signupWeb" method="post">
                    <div class="cont_form_sign_up"><a href="#" onClick="ocultar_login_sign_up()"><i
                            class="material-icons">&#xE5C4;</i></a>
                        <h2>注册</h2>
                        <input type="tel" id="tel" placeholder="手机号" pattern="[0-9]{11}"
                               onkeyup="this.value=this.value.replace(' ','')" name="user_phone"/>
                        <input type="text" placeholder="用户名" required="required"
                               onkeyup="this.value=this.value.replace(' ','')" name="user_name"/>
                        <input type="password" placeholder="密码" id="password2" required="required"
                               onkeyup="this.value=this.value.replace(' ','')" name="user_pwd"/>
                        <input type="password" placeholder="再次输入密码" id="password3" onblur="pd()" required="required"
                               onkeyup="this.value=this.value.replace(' ','')"/>
                        <button type="submit" class="btn_sign_up">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="js/login.js"></script>
</body>
</html>