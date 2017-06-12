<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/3/11
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray Groupchart = null;
    if ((Groupchart = (JSONArray) request.getAttribute("Groupchart")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="chartGroup"/>
<%
    }
%>
<%
    List<String> group_names = ((List<String>) Groupchart.getJSONObject(0).get("group_names"));
    List<Integer> group_ids = ((List<Integer>) Groupchart.getJSONObject(0).get("group_ids"));
    List<String> pot_names = ((List<String>) Groupchart.getJSONObject(0).get(Groupchart.getJSONObject(0).get("top_name") + "_names"));
    List<Map> potsEndData = ((List<Map>) Groupchart.getJSONObject(pot_names.size() + 1).get("potsEndDatajson"));
%>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <title>图表</title>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="css/style.css">
    <link href="css/circle_default.css" rel="stylesheet" type="text/css"/>
    <script src="js/raphael.js" type="text/javascript"></script>
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/echarts-all.js"></script>
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/modernizr.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <script src="js/DelCookie.js"></script>
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
            background: #88B8E6;
            color: #FFFFFF;
            padding: 15px 25px;
            position: relative;
            margin-left: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed {
            background: #BEDBE9;
            color: #FFFFFF;
            margin-left: 0;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a:before {
            content: "";
            border-left: 24px solid #88B8E6;
            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
            position: absolute;
            top: 0;
            right: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed:before {
            border-left-color: #BEDBE9;
        }

        #accordion .panel-title a:after {
            content: "\f106";
            font-family: 'FontAwesome';
            position: absolute;
            top: 30%;
            right: 15px;
            font-size: 18px;
            color: #FFFFFF;
        }

        #accordion .panel-title a.collapsed:after {
            content: "\f107";
            color: #FFFFFF;
        }

        #accordion .panel-collapse {
            position: relative;
        }

        #accordion .panel-collapse.in:before {
            content: "";
            border-right: 24px solid #BEDBE9;
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

        #someline {
            width: 80%;
            height: 40%;
            margin: 2em auto;
        }

        #someline2 {
            width: 80%;
            height: 40%;
            margin: 2em auto;
        }

        ul.a {
            width: 100%;
            cursor: pointer;
            padding: 0 0px;
            color: white;
        }

        ul.a li {
            list-style-type: none;
            cursor: pointer;
            padding: 5px 0 0 60px;
            color: black;
            width: 90%;
            background: url("images/circle.png") no-repeat 40px;
            background-size: 8px;
            display: none
        }

        .treelist {
            width: 222px;
        }

        ul.a div {
            height: 34px;
            width: 100%;
            padding-left: 27px;
            background: url("images/arrow_right.png") no-repeat;
            background-size: 30px;
            padding-top: 6px;
            color: #333333;
            font-weight: bold;
            font-size: 15px
        }

        .shows {
            display: block
        }
    </style>

</head>
<body id="top">

<header style="display: block;padding: 100px 0 0">
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
<div class="demo" style="padding: 3em 10em 0 0; background-color: #FFFFFF; text-align: left">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <%=Groupchart.getJSONObject(0).get("top_name")%>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="treelist">
                                    <%
                                        for (int i = 0; i < group_ids.size(); i++) {
                                            out.print("\n" +
                                                    "                                    <ul class=\"a\">\n" +
                                                    "                                        <div><a class=\"ul\" href=\"chartGroup?group_id=" + group_ids.get(i) + "\">" + group_names.get(i) + "</a></div>\n");
                                            List<Integer> p_ids = ((List<Integer>) Groupchart.getJSONObject(0).get(group_names.get(i) + "_ids"));
                                            List<String> p_names = ((List<String>) Groupchart.getJSONObject(0).get(group_names.get(i) + "_names"));
                                            for (int j = 0; j < p_ids.size(); j++) {
                                                out.print("<li><a class=\"li\" href=\"chart?pot_id=" + p_ids.get(j) + "\">" + p_names.get(j) + "</a></li>");
                                            }
                                            out.print("\n" +
                                                    "                                    </ul>");
                                        }
                                    %>
                                </div>

                                <span style="float: right;color: #FFFFFF">*点击箭头展开列表</span>

                                <script>

                                    $(".ul").click(function (event) {
//                                        return false;
                                    });

                                    $(".a").click(function () {
                                        $(this).find("li").click(function (event) {
//                                            return false;
                                        });


                                        if ($(this).hasClass("shows")) {
                                            $(this).removeClass("shows");
                                            $(this).find("li").find("ul").removeClass("shows");
                                            $(this).find("li").hide();
                                            $(this).find("div").css("background", "url(images/arrow_right.png) no-repeat").css("background-size", "30px");


                                        } else {
                                            $(this).addClass("shows");
                                            $(this).find("li").show();
                                            $(this).find("li").find("ul").find("li").hide();
                                            $(this).show();
                                            $(this).find("div").eq(0).css("background", "url(images/arrow_down.png) no-repeat").css("background-size", "30px");
                                        }

                                    })
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<div id="someline"></div>
<div id="someline2"></div>
<div class="cricle">
    <div id="content">
        <div id="diagram"></div>
        <div class="get">
            <%
                String colors[] = {"97BE0D", "88B8E6", "D84F5F", "BEDBE9"};
                for (int i = 0; i < pot_names.size(); i++) {
                    out.print("<div class=\"arc\">\n" +
                            "                <span class=\"text\">" + pot_names.get(i) + "</span>\n" +
                            "                <input type=\"hidden\" class=\"percent\" value=\"" + Groupchart.getJSONObject(i + 1).get("water") + "\"/>\n" +
                            "                <input type=\"hidden\" class=\"color\" value=\"#" + colors[i % colors.length] + "\"/>\n" +
                            "            </div>");
                }
            %>
        </div>

        <div class="legend">
            <h1>余量:</h1>
            <div class="surplus">
                <ul>
                    <%
                        for (int i = 0; i < pot_names.size(); i++) {
                            out.print("<li style=\"background: #" + colors[i % colors.length] + "\">" + pot_names.get(i) + "</li>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
    <div id="content2">
        <div id="diagram2"></div>
        <div class="get2">
            <%
                for (int i = 0; i < pot_names.size(); i++) {
                    out.print("<div class=\"arc\">\n" +
                            "                <span class=\"text\">" + pot_names.get(i) + "</span>\n" +
                            "                <input type=\"hidden\" class=\"percent\" value=\"" + Groupchart.getJSONObject(i + 1).get("fertilizer") + "\"/>\n" +
                            "                <input type=\"hidden\" class=\"color\" value=\"#" + colors[i % colors.length] + "\"/>\n" +
                            "            </div>");
                }
            %>
        </div>
    </div>

</div>

<!--==============================footer=================================-->
<footer style="display: block;position: relative;z-index: 10;text-align: left; padding-bottom: 50px;background-color: #53534A">
    <div class="container_12">
        <div class="grid_12 ">
            <div class="copy">
                Copyright &copy; 2017.MrGarden All rights reserved.
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>

<script src="js/init.js" type="text/javascript"></script>

<script>

    $(document).ready(function () {
        var chart1 = document.getElementById("someline");
        var echart1 = echarts.init(chart1);
        var option1 = {
            title: {
                text: '每日平均温度'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: [<%
                for (int i=0;i<pot_names.size();i++){
                    out.print("\'"+pot_names.get(i)+"\'");
                    if (i<pot_names.size()-1)
                        out.print(",");
                }
                %>],
                inactiveColor: '#999',
                //selectedMode: 'single',
//                selected: {
//                    '区域2': false,
//                    '区域3': false,
//                    '区域4': false
//                }
            },
            toolbox: {
                show: true,
                orient: 'horizontal',      // 布局方式，默认为水平布局，可选为：
                                           // 'horizontal' ¦ 'vertical'
                x: 'right',                // 水平安放位置，默认为全图右对齐，可选为：
                                           // 'center' ¦ 'left' ¦ 'right'
                                           // ¦ {number}（x坐标，单位px）
                y: 'top',                  // 垂直安放位置，默认为全图顶端，可选为：
                                           // 'top' ¦ 'bottom' ¦ 'center'
                                           // ¦ {number}（y坐标，单位px）
                color: ['#1e90ff', '#22bb22', '#4b0082', '#d2691e'],
                backgroundColor: 'rgba(0,0,0,0)', // 工具箱背景颜色
                borderColor: '#ccc',       // 工具箱边框颜色
                borderWidth: 0,            // 工具箱边框线宽，单位px，默认为0（无边框）
                padding: 5,                // 工具箱内边距，单位px，默认各方向内边距为5，
                showTitle: true,
                feature: {
                    dataZoom: {
                        show: true,
                        title: {
                            dataZoom: '区域缩放',
                            dataZoomReset: '区域缩放-后退'
                        }
                    },
                    dataView: {
                        show: true,
                        title: '数据视图',
                        readOnly: true,
                        lang: ['数据视图', '关闭', '刷新'],
                        optionToContent: function (opt) {
                            var axisData = opt.xAxis[0].data;
                            var series = opt.series;
                            var table = '<table style="width:100%;text-align:center"><tbody><tr>'
                                + '<td>时间</td>'
                                + '<td>' + series[0].name + '</td>'
                                + '<td>' + series[1].name + '</td>'
                                + '</tr>';
                            for (var i = 0, l = axisData.length; i < l; i++) {
                                table += '<tr>'
                                    + '<td>' + axisData[i] + '</td>'
                                    + '<td>' + series[0].data[i] + '</td>'
                                    + '<td>' + series[1].data[i] + '</td>'
                                    + '</tr>';
                            }
                            table += '</tbody></table>';
                            return table;
                        }
                    },
                    magicType: {
                        show: true,
                        title: {
                            line: '动态类型切换-折线图',
                            bar: '动态类型切换-柱形图',
                            stack: '动态类型切换-堆积',
                            tiled: '动态类型切换-平铺'
                        },
                        type: ['line', 'bar', 'stack', 'tiled']
                    },
                    restore: {
                        show: true,
                        title: '还原',
                        color: 'black'
                    },
                    saveAsImage: {
                        show: true,
                        title: '保存为图片',
                        type: 'jpeg',
                        lang: ['点击本地保存']
                    }
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            calculable: true,
            dataZoom: {
                show: true,
                realtime: true,
                start: 20,
                end: 80
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: function () {
                        var list = [<%
                        for (int i = 0; i < ((List<Integer>) potsEndData.get(0).get("EndDays")).size(); i++) {
                            out.println("\'"+((List<Integer>) potsEndData.get(0).get("EndDays")).get(i)+"\'");
                            if (i<((List<Integer>) potsEndData.get(0).get("EndDays")).size()-1)
                                out.print(",");
                        }
                        %>];
                        return list;
                    }()
                }
            ],
            yAxis: [
                {
                    type: 'value',
//							echarts图表的y轴刻度分段默认为5，因为yAxis的splitNumber默认为5
                    splitNumber: 4
                }
            ],
            series: [
                <%
                for (int i=1;i<potsEndData.size();i++){
                    out.print("{\n" +
"                    name: '"+pot_names.get(i-1)+"',\n" +
"                    type: 'line',\n" +
"                    stack: 'stack',\n" +
"                    areaStyle: {normal: {}},\n" +
"                    data: function () {\n" +
"                        var list = [");
                    for (int j=0;j<((List<Integer>)potsEndData.get(i).get("temperature")).size();j++){
                        if (((List<Integer>)potsEndData.get(i).get("temperature")).get(j)!=-9999)
                            out.print(((List<Integer>)potsEndData.get(i).get("temperature")).get(j));
                        if (j<((List<Integer>)potsEndData.get(i).get("temperature")).size()-1)
                            out.print(",");

                    }
                    out.print("];\n" +
"                        return list;\n" +
"                    }(),\n" +
"                    markLine: {\n" +
"                        data: [\n" +
"                            {type: 'average', name: '平均值'}\n" +
"                        ]\n" +
"                    }\n" +
"                }");
                    if (i<potsEndData.size()-1)
                        out.print(",");
                }
                if (potsEndData.size()==0){
                    out.print("{\n" +
"                    name: '尚无数据',\n" +
"                    type: 'line',\n" +
"                    stack: 'stack',\n" +
"                    areaStyle: {normal: {}},\n" +
"                    data: function () {\n" +
"                        var list = [];\n" +
"                        return list;\n" +
"                    }(),\n" +
"                    markLine: {\n" +
"                        data: [\n" +
"                            {type: 'average', name: '平均值'}\n" +
"                        ]\n" +
"                    }\n" +
"                }");
                }
                %>
            ]
        };


        //---------------
        echart1.setOption(option1);

        var chart2 = document.getElementById("someline2");
        var echart2 = echarts.init(chart2);
        var option2 = {
            title: {
                text: '每日平均湿度'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: [<%
                for (int i=0;i<pot_names.size();i++){
                    out.print("\'"+pot_names.get(i)+"\'");
                    if (i<pot_names.size()-1)
                        out.print(",");
                }
                %>],
                inactiveColor: '#999',
                //selectedMode: 'single',
//                selected: {
//                    '区域2': false,
//                    '区域3': false,
//                    '区域4': false
//                }
            },
            toolbox: {
                show: true,
                orient: 'horizontal',      // 布局方式，默认为水平布局，可选为：
                                           // 'horizontal' ¦ 'vertical'
                x: 'right',                // 水平安放位置，默认为全图右对齐，可选为：
                                           // 'center' ¦ 'left' ¦ 'right'
                                           // ¦ {number}（x坐标，单位px）
                y: 'top',                  // 垂直安放位置，默认为全图顶端，可选为：
                                           // 'top' ¦ 'bottom' ¦ 'center'
                                           // ¦ {number}（y坐标，单位px）
                color: ['#1e90ff', '#22bb22', '#4b0082', '#d2691e'],
                backgroundColor: 'rgba(0,0,0,0)', // 工具箱背景颜色
                borderColor: '#ccc',       // 工具箱边框颜色
                borderWidth: 0,            // 工具箱边框线宽，单位px，默认为0（无边框）
                padding: 5,                // 工具箱内边距，单位px，默认各方向内边距为5，
                showTitle: true,
                feature: {
                    dataZoom: {
                        show: true,
                        title: {
                            dataZoom: '区域缩放',
                            dataZoomReset: '区域缩放-后退'
                        }
                    },
                    dataView: {
                        show: true,
                        title: '数据视图',
                        readOnly: true,
                        lang: ['数据视图', '关闭', '刷新'],
                        optionToContent: function (opt) {
                            var axisData = opt.xAxis[0].data;
                            var series = opt.series;
                            var table = '<table style="width:100%;text-align:center"><tbody><tr>'
                                + '<td>时间</td>'
                                + '<td>' + series[0].name + '</td>'
                                + '<td>' + series[1].name + '</td>'
                                + '</tr>';
                            for (var i = 0, l = axisData.length; i < l; i++) {
                                table += '<tr>'
                                    + '<td>' + axisData[i] + '</td>'
                                    + '<td>' + series[0].data[i] + '</td>'
                                    + '<td>' + series[1].data[i] + '</td>'
                                    + '</tr>';
                            }
                            table += '</tbody></table>';
                            return table;
                        }
                    },
                    magicType: {
                        show: true,
                        title: {
                            line: '动态类型切换-折线图',
                            bar: '动态类型切换-柱形图',
                            stack: '动态类型切换-堆积',
                            tiled: '动态类型切换-平铺'
                        },
                        type: ['line', 'bar', 'stack', 'tiled']
                    },
                    restore: {
                        show: true,
                        title: '还原',
                        color: 'black'
                    },
                    saveAsImage: {
                        show: true,
                        title: '保存为图片',
                        type: 'jpeg',
                        lang: ['点击本地保存']
                    }
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            calculable: true,
            dataZoom: {
                show: true,
                realtime: true,
                start: 20,
                end: 80
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: function () {
                        var list = [<%
                        for (int i = 0; i < ((List<Integer>) potsEndData.get(0).get("EndDays")).size(); i++) {
                            out.println("\'"+((List<Integer>) potsEndData.get(0).get("EndDays")).get(i)+"\'");
                            if (i<((List<Integer>) potsEndData.get(0).get("EndDays")).size()-1)
                                out.print(",");
                        }
                        %>];
                        return list;
                    }()
                }
            ],
            yAxis: [
                {
                    type: 'value',
//							echarts图表的y轴刻度分段默认为5，因为yAxis的splitNumber默认为5
                    splitNumber: 4
                }
            ],
            series: [
                <%
                for (int i=1;i<potsEndData.size();i++){
                    out.print("{\n" +
"                    name: '"+pot_names.get(i-1)+"',\n" +
"                    type: 'line',\n" +
"                    stack: 'stack',\n" +
"                    areaStyle: {normal: {}},\n" +
"                    data: function () {\n" +
"                        var list = [");
                    for (int j=0;j<((List<Integer>)potsEndData.get(i).get("humidity")).size();j++){
                        if (((List<Integer>)potsEndData.get(i).get("humidity")).get(j)!=-9999)
                            out.print(((List<Integer>)potsEndData.get(i).get("humidity")).get(j));
                        if (j<((List<Integer>)potsEndData.get(i).get("humidity")).size()-1)
                            out.print(",");

                    }
                    out.print("];\n" +
"                        return list;\n" +
"                    }(),\n" +
"                    markLine: {\n" +
"                        data: [\n" +
"                            {type: 'average', name: '平均值'}\n" +
"                        ]\n" +
"                    }\n" +
"                }");
                    if (i<potsEndData.size()-1)
                        out.print(",");
                }
                if (potsEndData.size()==0){
                    out.print("{\n" +
"                    name: '尚无数据',\n" +
"                    type: 'line',\n" +
"                    stack: 'stack',\n" +
"                    areaStyle: {normal: {}},\n" +
"                    data: function () {\n" +
"                        var list = [];\n" +
"                        return list;\n" +
"                    }(),\n" +
"                    markLine: {\n" +
"                        data: [\n" +
"                            {type: 'average', name: '平均值'}\n" +
"                        ]\n" +
"                    }\n" +
"                }");
                }
                %>
            ]
        };

        echart2.setOption(option2);

    });

</script>

</body>
</html>
