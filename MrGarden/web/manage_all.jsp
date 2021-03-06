<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/5/7
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray getManage = null;
    if ((getManage = (JSONArray) request.getAttribute("getManage")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="getManageAll"/>
<%
    }
%>
<%
    List<String> group_names = ((List<String>) getManage.getJSONObject(0).get("group_names"));
    List<Integer> group_ids = ((List<Integer>) getManage.getJSONObject(0).get("group_ids"));
    List<String> pot_names = ((List<String>) getManage.getJSONObject(0).get("pot_names"));
    List<Integer> pot_ids = ((List<Integer>) getManage.getJSONObject(0).get("pot_ids"));
    List<Integer> pot_waters = ((List<Integer>) getManage.getJSONObject(0).get("pot_waters"));
    List<Integer> pot_bottles = ((List<Integer>) getManage.getJSONObject(0).get("pot_bottles"));
    List<Integer> pot_online = ((List<Integer>) getManage.getJSONObject(0).get("pot_online"));
    List<String> lastWaterDates = ((List<String>) getManage.getJSONObject(0).get("lastWaterDates"));
    List<String> lastFertilizerDates = ((List<String>) getManage.getJSONObject(0).get("lastFertilizerDates"));
    List<Integer> pot_unids = null;
    String type = "";
    String speak = null;
    try {
        if ((speak = (String) request.getAttribute("speak")) != null) {
            pot_unids = ((List<Integer>) request.getAttribute("pot_unids"));
            type = (String) request.getAttribute("type");
        }
    } catch (Exception e) {
    }
%>
<html>
<head>
    <title>管理全部节点</title>
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
    <link type="text/css" rel="stylesheet" href="css/framework.css"/>
    <link type="text/css" rel="stylesheet" href="css/main.css"/>
    <link href="css/manage_all_style.css" rel="stylesheet">

    <style type="text/css">
        a:hover, a:focus {
            text-decoration: none;
            outline: none;
        }

        #accordion {
            padding-right: 24px;
            padding-left: 24px;
            z-index: 1;
        }

        #accordion .panel {
            border: none;
            box-shadow: none;
        }

        #accordion .panel-heading {
            padding: 0;
            border-radius: 0;
            border: none;
        }

        #accordion .panel-title {
            padding: 0;
        }

        #accordion .panel-title a {
            display: block;
            font-size: 16px;
            font-weight: bold;
            background: #2A6496;
            color: #47b4d8;
            padding: 15px 25px;
            position: relative;
            margin-left: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed {
            background: #47b4d8;
            color: #2A6496;
            margin-left: 0;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a:before {
            content: "";
            border-left: 24px solid #2A6496;
            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
            position: absolute;
            top: 0;
            right: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed:before {
            border-left-color: #47b4d8;
        }

        #accordion .panel-title a:after {
            content: "\f106";
            font-family: 'FontAwesome';
            position: absolute;
            top: 30%;
            right: 15px;
            font-size: 18px;
            color: #47b4d8;
        }

        #accordion .panel-title a.collapsed:after {
            content: "\f107";
            color: #2A6496;
        }

        #accordion .panel-collapse {
            position: relative;
        }

        #accordion .panel-collapse.in:before {
            content: "";
            border-right: 24px solid #47b4d8;
            border-bottom: 18px solid transparent;
            position: absolute;
            top: 0;
            left: -24px;
        }

        #accordion .panel-body {
            font-size: 14px;
            color: #333;
            background: #e4e4e4;
            border-top: none;
            z-index: 1;
        }
        ul.a{width:100%;cursor:pointer;padding:0 0px;color:white;}
        ul.a li{list-style-type:none;cursor:pointer;padding:5px 0 0 60px;color:black;width:90%;background:url("images/circle.png") no-repeat 40px;background-size:8px;display:none}
        .treelist{width:222px;}
        ul.a div{height:34px;width:100%;padding-left:27px;background:url("images/arrow_right.png") no-repeat;background-size:30px;padding-top:6px;color:#333333;font-weight:bold;font-size:15px}
        .shows{display:block}
        /*tr:nth-child(even) {*/
        /*background: #d8ebfa;*/
        /*}*/
        /*tr:nth-child(odd) {*/
        /*background: White;*/
        /*}*/

    </style>
    <script>

        window.onload = function () {
            <%
                out.print(request.getAttribute("error"));
            %>
        };
    </script>

    <script>

        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
        })
    </script>
</head>
<body id="top">

<header style="display: block;padding: 100px 0 0">
    <div class="container_12">
        <div class="grid_12">
            <h1>
                <a href="index.jsp">
                    <img src="images/logo.png" alt=""/>
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
                                            out.print("<a style=\"float:left\" href=\"editInfo.jsp\">" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "</a>" + "&nbsp;&nbsp;|&nbsp;&nbsp;<a style=\"float:right\" onclick=\"foreach()\">注销</a>");
                                            isLogin = true;
                                            break;
                                        }
                                    }
                                }
                                if (!isLogin)
                                    out.print("<a href=\"login.jsp\">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp<a href=\"signup.jsp\">注册</a>");
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

<div class="demo" style="text-align: start; padding: 3em 10em 0 0; background-color: #f9f9f9;">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <%=getManage.getJSONObject(0).get("top_name")%>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body" style="padding-left: 2em">
                                    <div class="treelist">
                                        <%
                                            for (int i = 0; i < group_ids.size(); i++) {
                                                out.print("\n" +
                                                        "                                    <ul class=\"a\">\n" +
                                                        "                                        <div><a class=\"ul\" href=\"getManageAll?group_id=" + group_ids.get(i) + "\">" + group_names.get(i) + "</a></div>\n");
                                                List<Integer> p_ids = ((List<Integer>) getManage.getJSONObject(0).get(group_names.get(i) + "_ids"));
                                                List<String> p_names = ((List<String>) getManage.getJSONObject(0).get(group_names.get(i) + "_names"));
                                                for (int j = 0; j < p_ids.size(); j++) {
                                                    out.print("<li><a class=\"li\" href=\"equipment?pot_id=" + p_ids.get(j) + "\">" + p_names.get(j) + "</a></li>");
                                                }
                                                out.print("\n" +
                                                        "                                    </ul>");
                                            }
                                        %>
                                    </div>

                                    <script>

                                        $(".ul").click(function(event){
//                                        return false;
                                        });

                                        $(".a").click(function(){
                                            $(this).find("li").click(function(event){
//                                            return false;
                                            });


                                            if($(this).hasClass("shows")){
                                                $(this).removeClass("shows");
                                                $(this).find("li").find("ul").removeClass("shows");
                                                $(this).find("li").hide();
                                                $(this).find("div").css("background","url(images/arrow_right.png) no-repeat").css("background-size","30px");


                                            }else{
                                                $(this).addClass("shows");
                                                $(this).find("li").show();
                                                $(this).find("li").find("ul").find("li").hide();
                                                $(this).show();
                                                $(this).find("div").eq(0).css("background","url(images/arrow_down.png) no-repeat").css("background-size","30px");
                                            }

                                        })
                                    </script>
                                <br/>
                                <a href="addGroup.jsp" style="text-decoration:underline;"><img src="images/PlusGreen.png"
                                                                                             style="width: 24px;height: auto"><font
                                        size="24" color="#5fe18c">添加组</font></a>
                                <a href="delectGroup?group_id=<%=getManage.getJSONObject(0).get("top_id")%>"

                                   style="text-decoration:underline;float: right;padding-right: 2em"><img
                                        src="images/Cancelred.png"
                                        style="width: 24px;height: auto"><font
                                        size="24" color="#FC1717">删除组</font></a>
                                    <br/>
                                    <span style="float: right;color: #FFFFFF">*点击箭头展开列表</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function changePot(id) {
        window.location.href = "equipment?pot_id=" + id;
    }
</script>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<div style="background-color: #f9f9f9;padding-bottom: 2em">
    <form id="manage_form" action="" method="post">
        <div style="padding:0em 40em 1em 1em;">
            <a id="submit11" name="manage_btn" onclick="nockeck()"
               style="color: #FFFFFF;padding: 4px 50px;margin-right: 0.6em"
               class="btn btn-primary radius">
                <img src="images/Watering_all.png" width="16px">&nbsp;&nbsp;浇&nbsp;水</a>
            <a id="submit22" name="manage_btn" onclick="nockeck()" style="color: #FFFFFF;padding: 4px 50px;"
               class="btn btn-primary radius">
                <img src="images/Bottle_all.png" width="16px">&nbsp;&nbsp;施&nbsp;肥</a>
            <%
                if (speak != null && speak.equals("操作成功"))
                    out.print("<a style=\" background-color:#F9F9F9; border: 0; color: green;padding: 4px 50px; cursor: inherit\" disabled=\"disable\" class=\"btn btn-primary radius\">操作成功</a>");
            %>
        </div>

        <script>
            function nockeck() {
                alert("请选择您要操作的节点!!!");
            }

            function ckeckall() {
                var cks = document.querySelectorAll("input[type=checkbox]:checked");
                if (cks.length > 0) {
                    $("#submit11").attr("onclick", "submit1()");
                    $("#submit22").attr("onclick", "submit2()");
                }
                else {
                    $("#submit11").attr("onclick", "nockeck()");
                    $("#submit22").attr("onclick", "nockeck()");
                }
            }

            function submit1() {
                $("#manage_form").attr("action", "waterAll?group_id=<%=getManage.getJSONObject(0).get("top_id")%>");
                document.getElementById('manage_form').submit();
            }

            function submit2() {
                $("#manage_form").attr("action", "bottleAll?group_id=<%=getManage.getJSONObject(0).get("top_id")%>");
                document.getElementById('manage_form').submit();
            }

        </script>

        <table class="table table-hover table-outline mb-0 hidden-sm-down" style="width: 80%; margin: 0 auto">
            <thead class="thead-default">
            <tr>
                <th style="width: 2em"><input type="checkbox" id="ckAll" onchange="ckeckall()"></th>
                <th style="width: 10em">节点名</th>
                <th style="width: 6em">在线状态</th>
                <th style="width: 18em" class="text-center">水量</th>
                <th style="width: 16em" class="text-center">营养液</th>
                <th>上次浇水时间</th>
                <th>上次施肥时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < pot_ids.size(); i++) {
                    String online = "";
                    String unwater = "";
                    String unbottle = "";
                    String disabled = "";
                    String classed = "";
                    String span = "";
                    if (pot_online.get(i) == 1) {
                        online = "<img src=\"images/Light_On.png\" alt=\"在线\" style=\"height:24px;\">在线\n";
                        classed = "class=\"check\"";
                    } else {
                        online = "<img src=\"images/Light_Off.png\" alt=\"离线\" style=\"height:24px;\">离线\n";
                        disabled = "disabled=\"disabled\"";
                        span = "离线不可选";
                    }
                    if (speak != null && speak.equals("no")) {
                        for (int j = 0; j < pot_unids.size(); j++) {
                            if (pot_unids.get(j) == pot_ids.get(i)) {
                                if (type.equals("w"))
                                    unwater = "<span style=\"color: red;padding-left:4em\">水量不足，浇水失败</span>";
                                else
                                    unbottle = "<span style=\"color: red;padding-left:4em\">营养液不足，施肥失败</span>";
                            }
                        }

                    }
                    out.print("<tr>\n" +
                            "                <th><input " + disabled + " type=\"checkbox\" id=\"pot" + pot_ids.get(i) + "\" " + classed + " name=\"" + pot_ids.get(i) + "\" onclick=\"ckeckall()\"></th>\n" +
                            "                <td>\n" +
                            "                    <div>" + pot_names.get(i) + "</div>\n" +
                            "<span style=\"font-size: 14px;color:red\">" + span + "</span>" +
                            "                </td>\n" +
                            "                <td>\n" +
                            online +
                            "                </td>\n" +
                            "                <td>\n" +
                            "                    <div class=\"clearfix\">\n" +
                            "                        <div class=\"float-left\">\n" +
                            "                            <strong>" + pot_waters.get(i) + "%</strong>\n" +
                            unwater +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"progress progress-xs\">\n" +
                            "                        <div class=\"progress-bar bg-success\" role=\"progressbar\" style=\"width: " + pot_waters.get(i) + "%\" aria-valuenow=\"" + pot_waters.get(i) + "\"\n" +
                            "                             aria-valuemin=\"0\" aria-valuemax=\"100\"></div>\n" +
                            "                    </div>\n" +
                            "                </td>\n" +
                            "                <td>\n" +
                            "                    <div class=\"clearfix\">\n" +
                            "                        <div class=\"float-left\">\n" +
                            "                            <strong>" + pot_bottles.get(i) + "%</strong>\n" +
                            unbottle +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"progress progress-xs\">\n" +
                            "                        <div class=\"progress-bar bg-success\" role=\"progressbar\" style=\"width: " + pot_bottles.get(i) + "%\" aria-valuenow=\"" + pot_bottles.get(i) + "\"\n" +
                            "                             aria-valuemin=\"0\" aria-valuemax=\"100\"></div>\n" +
                            "                    </div>\n" +
                            "                </td>\n" +
                            "                <td>\n" +
                            "                    <strong>" + lastWaterDates.get(i) + "</strong>\n" +
                            "                </td>\n" +
                            "                <td>\n" +
                            "                    <strong>" + lastFertilizerDates.get(i) + "</strong>\n" +
                            "                </td>\n" +
                            "                <td>\n" +
                            "                    <a style=\"text-decoration:underline;\" href=\"equipment?pot_id=" + pot_ids.get(i) + "\">管理本节点</a>\n" +
                            "                </td>\n" +
                            "            </tr>");
                }
            %>
            </tbody>
        </table>
        <%
            if (pot_ids.isEmpty()){
                out.println("<br><br><p style=\"text-align: center; font-size: 24px\">当前组尚无任何节点,<a href=\"addPot.jsp\" style=\"text-decoration: underline\">请添加节点.</a></p><br>");
            }
        %>
    </form>
</div>
<script>
    $("#ckAll").click(function () {
        $("input[class='check']").prop("checked", this.checked);
    });

    $("input[class='check']").click(function () {
        var $subs = $("input[class='check']");
        $("#ckAll").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
    });

</script>
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