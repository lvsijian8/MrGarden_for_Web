<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/4/17
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray PlantList = null;
    if ((PlantList = (JSONArray) request.getAttribute("PlantList")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="getPlant"/>
<%
    }
%>
<%
    List<String> plant_names = ((List<String>) PlantList.getJSONObject(0).get("plant_names"));
    List<Integer> plant_ids = ((List<Integer>) PlantList.getJSONObject(0).get("plant_ids"));
%>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>添加花盆</title>
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

<div style="background-color: white;padding-left: 20em; padding-bottom: 2em">
    <!--the newDevice form-->
    <div class="twelve wide column" style="width: 80%">
        <div class="pageHeader">
            <div class="segment">
                <h3 class="ui dividing header">
                    <div class="content" style="padding: 20px 0">
                        <img src="images/Plus_Math.png" width="30px" height="auto">添加花盆
                        <div class="sub header">将您的设备连接到云端</div>
                    </div>
                </h3>
            </div>
        </div>
        <div class="ui form fluid vertical segment">
            <form name="form" action="append" method="post">
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">选择花的类型</h5>
                        <div class="col-sm-8">
                            <div id="bts-ex-4" class="selectpicker" data-live="true">
                                <button data-id="prov" type="button"
                                        class="btn btn-lg btn-block btn-default dropdown-toggle">
                                    <span class="placeholder">Choose an option</span>
                                    <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu">
                                    <div class="live-filtering" data-clear="true" data-autocomplete="true"
                                         data-keys="true">
                                        <label class="sr-only" for="input-bts-ex-4">Search in the list</label>
                                        <div class="search-box">
                                            <div class="input-group">
											<span class="input-group-addon" id="search-icon3">
											<span class="fa fa-search"></span>
											<a href="#" class="fa fa-times hide filter-clear"><span class="sr-only">Clear filter</span></a>
											</span>
                                                <input type="text" placeholder="Search in the list" id="input-bts-ex-4"
                                                       class="form-control live-search" aria-describedby="search-icon3"
                                                       tabindex="1"/>
                                            </div>
                                        </div>
                                        <div class="list-to-filter">
                                            <ul class="list-unstyled" id="test" style="padding-left: 1em">
                                                <%
                                                    for (int i = 0; i < plant_names.size(); i++) {
                                                        out.print("<li class=\"filter-item items\" data-filter=\"" + plant_names.get(i) + "\" onclick=\"tofid(" + plant_ids.get(i) + ")\">" + plant_names.get(i) + "</li>");
                                                    }
                                                %>
                                                <%--<li class="filter-item items" data-filter="item 1" onclick="tofid(1)">item 1</li>--%>
                                            </ul>
                                            <div class="no-search-results">
                                                <div class="alert alert-warning" role="alert"><i
                                                        class="fa fa-warning margin-right-sm"></i>我们暂时没有<strong>'<span></span>'</strong>
                                                    这种植物哦.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="fid" value="" id="fromfid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">花盆名</h5>
                        <div class="ui small left labeled icon input">
                            <input type="text" placeholder="给您的花盆起个名,您容易记住就行，30个字符内……" id="device_title"
                                   name="flowername"/>
                        </div>
                    </div>
                    <div class="field"></div>
                </div>
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">描述</h5>
                        <textarea placeholder="不超过30个字符……"></textarea>
                    </div>
                </div>
                <div class="two fields">
                    <div class="field">
                        <h5 style="color: #555555;">事件设置</h5>
                        <table style="width: 800px">
                            <tr>
                                <td colspan="2">浇水设置</td>
                                <td colspan="2">施肥设置</td>
                            </tr>
                            <tr>
                                <td>浇水时间间隔设置(天)</td>
                                <td><input id="range" type="range" min="1" max="30" value="1"
                                           style="float: left;width: 200px" onchange="value_change()"
                                           name="num_water_day">
                                    <output id="output">1</output>
                                </td>
                                <td>施肥时间间隔设置(天)</td>
                                <td><input id="range1" type="range" min="1" max="30" value="1"
                                           style="float: left;width: 200px" onchange="value_change1()"
                                           name="num_bottle_day">
                                    <output id="output1">1</output>
                                </td>
                            </tr>
                            <tr>
                                <td>浇水时间设置</td>
                                <td><input name="num_water_time" type="number" value="10"
                                           style="width: 100px;height: 30px">点
                                </td>
                                <td>施肥时间设置</td>
                                <td><input name="num_bottle_time" type="number" value="10"
                                           style="width: 100px;height: 30px">点
                                </td>
                            </tr>
                            <tr>
                                <td>浇水量(ml)</td>
                                <td><input name="num_water_ml" type="number" value="50" min="10" max="200" step="10"
                                           style="width: 120px;height: 30px"></td>
                                <td>施肥量(ml)</td>
                                <td><input name="num_bottle_ml" type="number" value="50" min="10" max="200" step="10"
                                           style="width: 120px;height: 30px"></td>
                            </tr>
                        </table>
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
    function value_change() {
        var number = document.getElementById("range").value;
        document.getElementById("output").value = number;
    }
    function value_change1() {
        var number = document.getElementById("range1").value;
        document.getElementById("output1").value = number;
    }
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
