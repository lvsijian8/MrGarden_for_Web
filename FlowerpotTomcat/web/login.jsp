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
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
</head>
<body>
<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>LOGIN</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
                        <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>SIGN UP</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"> <img src="images/po.jpg" alt="" /> </div>
            </div>
            <div class="cont_forms" >
                <div class="cont_img_back_"> <img src="images/po.jpg" alt="" /> </div>
                <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
                    <h2>LOGIN</h2>
                    <input type="text" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                </div>
                <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>SIGN UP</h2>
                    <input type="text" placeholder="Email" />
                    <input type="text" placeholder="User" />
                    <input type="password" placeholder="Password" />
                    <input type="password" placeholder="Confirm Password" />
                    <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/login.js"></script>
</body>
</html>
