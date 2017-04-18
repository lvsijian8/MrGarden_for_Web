<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/10
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>联系我们</title>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/TMForm.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/DelCookie.js"></script>
    <script>
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
        })

    </script>
</head>
<body id="top">
<!--==============================header=================================-->
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
                                        out.print("<a style=\"float:left\" >" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "|<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
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
<div class="content">
    <div class="container_12">
        <div class="grid_8">
            <h2>我们在这里</h2>
            <div class="map">
                <div class="img_block fleft">
                    <figure class="img_inner">
                        <iframe src="map.html"></iframe>
                    </figure>
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
        <div class="grid_4">
            <h2>联系我们</h2>
            <form id="form" name="form1">
                <div class="success_wrapper">
                    <div class="success-message">Contact form submitted</div>
                </div>
                <label class="name">
                    <input type="text" id="name" placeholder="姓名:" data-constraints="@Required @JustLetters"
                           onkeyup="this.value=this.value.replace(' ','')"/>
                    <span class="empty-message">*请填写您的用户名.</span>
                    <span class="error-message">*这不是有效的用户名.</span>
                </label>
                <label class="email">
                    <input type="text" id="email" placeholder="E-mail:" data-constraints="@Required @Email"
                           onkeyup="this.value=this.value.replace(' ','')"/>
                    <span class="empty-message">*请填写您的email.</span>
                    <span class="error-message">*这不是有效的email.</span>
                </label>
                <label class="phone">
                    <input type="text" id="tel" placeholder="手机:"
                           data-constraints="@Required @JustNumbers @Length(min=11,max=11)"
                           onkeyup="this.value=this.value.replace(' ','')"/>
                    <span class="empty-message">*请填写您的手机号码.</span>
                    <span class="error-message">*这不是有效的手机号码.</span>
                </label>
                <label class="Message:">
                    <textarea id="txt" placeholder="内容:"
                              data-constraints='@Required @Length(min=5,max=999999)'></textarea>
                    <span class="empty-message">*请填写您要发送的内容.</span>
                    <span class="error-message">*不能少于5个字.</span>
                </label>
                <div>
                    <div class="clear"></div>
                    <div class="btns">
                        <a href="#" data-type="reset" class="btn">重置</a>
                        <a href="#" data-type="submit" class="btn" onclick="reg()">发送</a>
                    </div>
                </div>
            </form>
            <div class="extra_wrapper">
                <p class="pt1">点击发送联系我们，获取我们网站的全天候服务支持。</p>
                <p>如果您需要定制一个特定的花盆，请联系我们来帮助您。</p>
                <address>
                    <dl>
                        <dt>中山大学新华学院 <br>
                            东莞市麻涌镇<br>
                            沿江西一路7号
                        </dt>
                        <dd><span>联系方式:</span>13554773703</dd>
                        <dd>E-mail: 499365864@qq.com</dd>
                    </dl>
                </address>
            </div>
        </div>
    </div>
</div>
<script>
    function reg() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var tel = document.getElementById("tel").value;
        var txt = document.getElementById("txt").value;
        if (email != "" && tel != "" && name != "" && txt != "") {
            var reg1 = /(?!^\d+$)(?!^[a-zA-Z]+$)[a-zA-Z]/;
            isok1 = reg1.test(name);
            if (!isok1) {
                alert("用户名格式不正确，请重新输入！");
                document.getElementById("name").focus();
                return false;
            }
            var reg2 = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            isok2 = reg2.test(email);
            if (!isok2) {
                alert("邮箱格式不正确，请重新输入！");
                document.getElementById("email").focus();
                return false;
            }
            if (tel.length != 11) {
                alert("手机号码格式不正确，请重新输入！");
                document.getElementById("tel").focus();
                return false;
            }
            if (txt.length < 5 || txt.length > 999999) {
                alert("内容格式不正确，请重新输入！");
                document.getElementById("txt").focus();
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
<div style="display:none">
    <script src='https://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
