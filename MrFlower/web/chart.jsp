<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/3/11
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONArray Potchart = null;
    if ((Potchart = (JSONArray) request.getAttribute("Potchart")) == null) {//若是直接访问chart.jsp则先跳转chart,再跳转回来
%>
<jsp:forward page="chart"/>
<%
    }
%>
<%
    List<String> pot_names = ((List<String>) Potchart.getJSONObject(0).get("pot_names"));
    List<Integer> pot_ids = ((List<Integer>) Potchart.getJSONObject(0).get("pot_ids"));
    List<Integer> humidity = ((List<Integer>) Potchart.getJSONObject(0).get("humidity"));
    List<Integer> temperature = ((List<Integer>) Potchart.getJSONObject(0).get("temperature"));
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
            background: #212833;
            color: #FFFFFF;
            padding: 15px 25px;
            position: relative;
            margin-left: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed {
            background: #1A3D41;
            color: #FFFFFF;
            margin-left: 0;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a:before {
            content: "";
            border-left: 24px solid #212833;
            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
            position: absolute;
            top: 0;
            right: -24px;
            transition: all 0.3s ease 0s;
        }

        #accordion .panel-title a.collapsed:before {
            border-left-color: #1A3D41;
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
            border-right: 24px solid #1A3D41;
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
    </style>
    <script>
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});
        })
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
                                    <%
                                        if ((Integer) Potchart.getJSONObject(0).get("checked") != 0)
                                            out.print(pot_names.get((Integer) Potchart.getJSONObject(0).get("checked")));
                                        else
                                            out.print("选择您的花盆");
                                    %>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <form>
                                    <%
                                        for (int i = 0; i < pot_names.size(); i++) {
                                            String checked1 = "";
                                            if ((Integer) Potchart.getJSONObject(0).get("checked") == i)
                                                checked1 = "checked";
                                            out.print("<input " + checked1 + " type=\"radio\" id=\"huahua" + i + "\" name=\"radio\" onclick=\"changePot(" + pot_ids.get(i) + ")\"><label for=\"huahua" + i + "\" onclick=\"changePot(" + pot_ids.get(i) + ")\">" + pot_names.get(i) + "</label>");
                                            if (i + 1 < pot_names.size())
                                                out.print("<br/>");
                                        }
                                    %>
                                </form>
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
        window.location.href = "chart?pot_id=" + id;
    }
</script>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<div class="charts-container cf" style="padding-bottom: 3em">
    <div class="chart" id="graph-1-container">
        <h2 class="title">温度(0-90°C)</h2>
        <div class="chart-svg">
            <svg class="chart-line" id="chart-1" viewBox="0 0 80 40">
                <defs>
                    <clipPath id="clip" x="0" y="0" width="80" height="40">
                        <rect id="clip-rect" x="-80" y="0" width="77" height="38.7"/>
                    </clipPath>

                    <linearGradient id="gradient-1">
                        <stop offset="0" stop-color="#00d5bd"/>
                        <stop offset="100" stop-color="#24c1ed"/>
                    </linearGradient>

                    <linearGradient id="gradient-2">
                        <stop offset="0" stop-color="#954ce9"/>
                        <stop offset="0.3" stop-color="#954ce9"/>
                        <stop offset="0.6" stop-color="#24c1ed"/>
                        <stop offset="1" stop-color="#24c1ed"/>
                    </linearGradient>

                    <linearGradient id="gradient-3" x1="0%" y1="0%" x2="0%" y2="100%">>
                        <stop offset="0" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0.07"/>
                        <stop offset="0.5" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0.13"/>
                        <stop offset="1" stop-color="rgba(0, 213, 189, 1)" stop-opacity="0"/>
                    </linearGradient>

                    <linearGradient id="gradient-4" x1="0%" y1="0%" x2="0%" y2="100%">>
                        <stop offset="0" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0.07"/>
                        <stop offset="0.5" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0.13"/>
                        <stop offset="1" stop-color="rgba(149, 76, 233, 1)" stop-opacity="0"/>
                    </linearGradient>

                </defs>
            </svg>
            <h3 class="valueX">时间/天</h3>
        </div>
        <div class="chart-values">
            <p class="h-value"><%= Potchart.getJSONObject(0).get("out_t")%>°C</p><%------------------%>
            <p class="percentage-value"></p>
            <p class="total-gain"></p>
        </div>
        <div class="triangle green"></div>
    </div>
    <div class="chart" id="graph-2-container">
        <h2 class="title">湿度(0-90%)</h2>
        <div class="chart-svg">
            <svg class="chart-line" id="chart-2" viewBox="0 0 80 40">
            </svg>
            <h3 class="valueX">时间/天</h3>
        </div>
        <div class="chart-values">
            <p class="h-value"><%= Potchart.getJSONObject(0).get("out_h")%>%</p><%------------------%>
            <p class="percentage-value"></p>
            <p class="total-gain"></p>
        </div>
        <div class="triangle red"></div>
    </div>
    <div class="chart circle" id="circle-1">
        <h2 class="title">水位</h2>
        <div class="chart-svg align-center">
            <h2 class="circle-percentage"></h2>
            <svg class="chart-circle" id="chart-3" width="50%" viewBox="0 0 100 100">
                <path class="underlay" d="M5,50 A45,45,0 1 1 95,50 A45,45,0 1 1 5,50"/>
            </svg>
        </div>
        <div class="triangle green"></div>
    </div>
    <div class="chart circle" id="circle-2">
        <h2 class="title">营养液</h2>
        <div class="chart-svg align-center">
            <h2 class="circle-percentage"></h2>
            <svg class="chart-circle" id="chart-4" width="50%" viewBox="0 0 100 100">
                <path class="underlay" d="M5,50 A45,45,0 1 1 95,50 A45,45,0 1 1 5,50"/>
            </svg>
        </div>
        <div class="triangle red"></div>
    </div>
</div>


<script src='js/snap.svg-min.js'></script>
<script>
    var chart_1_y = [
        //25, 25, 40, 30, 12, 20, 23, 25, 27, 23, 24, 28, 99, 101
        <%

            for(int i=0;i<temperature.size();i++){
                out.print(temperature.get(i)+",");
            }
        %>
    ];
    var chart_2_y = [
//        80, 65, 65, 40, 55, 34, 54, 50, 60, 64, 55, 27, 24, 30,
        <%
            for(int i=0;i<humidity.size();i++){
                out.print(humidity.get(i)+",");
            }
        %>
    ];

    drawCircle('#chart-3', 1, <%
            if(Potchart.getJSONObject(0).get("water")==null||Potchart.getJSONObject(0).get("water").equals("0"))
                out.print("1");
            else
                out.print(Potchart.getJSONObject(0).get("water"));
        %>, '#circle-1');
    drawCircle('#chart-4', 2, <%
            if(Potchart.getJSONObject(0).get("fertilizer")==null||Potchart.getJSONObject(0).get("fertilizer").equals("0"))
                out.print("1");
            else
                out.print(Potchart.getJSONObject(0).get("fertilizer"));
        %>, '#circle-2');
    drawLineGraph('#chart-1', chart_1_y, '#graph-1-container', 1);
    drawLineGraph('#chart-2', chart_2_y, '#graph-2-container', 2);

    var chart_h = 40;
    var chart_w = 80;
    var stepX = 77 / 14;

    //

    function point(x, y) {
        0;
        0;
    }
    /* DRAW GRID */
    function drawGrid(graph) {
        var graph = Snap(graph);
        var g = graph.g();
        g.attr('id', 'grid');
        for (i = 0; i <= stepX + 2; i++) {
            var horizontalLine = graph.path(
                "M" + 0 + "," + stepX * i + " " +
                "L" + 77 + "," + stepX * i);
            horizontalLine.attr('class', 'horizontal');
            g.add(horizontalLine);
        }
        for (i = 0; i <= 14; i++) {
            var horizontalLine = graph.path(
                "M" + stepX * i + "," + 38.7 + " " +
                "L" + stepX * i + "," + 0);
            horizontalLine.attr('class', 'vertical');
            g.add(horizontalLine);
        }
    }
    drawGrid('#chart-2');
    drawGrid('#chart-1');

    function drawLineGraph(graph, points, container, id) {


        var graph = Snap(graph);


        /*END DRAW GRID*/

        /* PARSE POINTS */
        var myPoints = [];
        var shadowPoints = [];

        function parseData(points) {
            for (i = 0; i < points.length; i++) {
                var p = new point();
                var pv = points[i] / 100 * 40;
                p.x = 83.7 / points.length * i + 1;
                p.y = 40 - pv;
                if (p.x > 78) {
                    p.x = 78;
                }
                myPoints.push(p);
            }
        }

        var segments = [];

        function createSegments(p_array) {
            for (i = 0; i < p_array.length; i++) {
                var seg = "L" + p_array[i].x + "," + p_array[i].y;
                if (i === 0) {
                    seg = "M" + p_array[i].x + "," + p_array[i].y;
                }
                segments.push(seg);
            }
        }

        function joinLine(segments_array, id) {
            var line = segments_array.join(" ");
            var line = graph.path(line);
            line.attr('id', 'graph-' + id);
            var lineLength = line.getTotalLength();

            line.attr({
                'stroke-dasharray': lineLength,
                'stroke-dashoffset': lineLength
            });
        }

        function calculatePercentage(points, graph) {
            var initValue = points[0];
            var endValue = points[points.length - 1];
            var sum = endValue - initValue;
            var prefix;
            var percentageGain;
            var stepCount = 1300 / sum;

            function findPrefix() {
                if (sum > 0) {
                    prefix = "+";
                } else {
                    prefix = "";
                }
            }

            var percentagePrefix = "";

            function percentageChange() {
                percentageGain = initValue / endValue * 100;

                if (percentageGain > 100) {
                    console.log('over100');
                    percentageGain = Math.round(percentageGain * 100 * 10) / 100;
                } else if (percentageGain < 100) {
                    console.log('under100');
                    percentageGain = Math.round(percentageGain * 10) / 10;
                }
                if (initValue > endValue) {

                    percentageGain = endValue / initValue * 100 - 100;
                    percentageGain = percentageGain.toFixed(2);

                    percentagePrefix = "";
                    $(graph).find('.percentage-value').addClass('negative');
                } else {
                    percentagePrefix = "+";
                }
                if (endValue > initValue) {
                    percentageGain = endValue / initValue * 100;
                    percentageGain = Math.round(percentageGain);
                }
            }

            percentageChange();
            findPrefix();

            var percentage = $(graph).find('.percentage-value');
            var totalGain = $(graph).find('.total-gain');
            var hVal = $(graph).find('.h-value');

            function count(graph, sum) {
                var totalGain = $(graph).find('.total-gain');
                var i = 0;
                var time = 1300;
                var intervalTime = Math.abs(time / sum);
                var timerID = 0;
                if (sum > 0) {
                    var timerID = setInterval(function () {
                        i++;
                        totalGain.text(percentagePrefix + i);
                        if (i === sum) clearInterval(timerID);
                    }, intervalTime);
                } else if (sum < 0) {
                    var timerID = setInterval(function () {
                        i--;
                        totalGain.text(percentagePrefix + i);
                        if (i === sum) clearInterval(timerID);
                    }, intervalTime);
                }
            }

            count(graph, sum);

            percentage.text(percentagePrefix + percentageGain + "%");
            totalGain.text("0%");
            setTimeout(function () {
                percentage.addClass('visible');
                hVal.addClass('visible');
            }, 1300);

        }


        function showValues() {
            var val1 = $(graph).find('.h-value');
            var val2 = $(graph).find('.percentage-value');
            val1.addClass('visible');
            val2.addClass('visible');
        }

        function drawPolygon(segments, id) {
            var lastel = segments[segments.length - 1];
            var polySeg = segments.slice();
            polySeg.push([78, 38.4], [1, 38.4]);
            var polyLine = polySeg.join(' ').toString();
            var replacedString = polyLine.replace(/L/g, '').replace(/M/g, "");

            var poly = graph.polygon(replacedString);
            var clip = graph.rect(-80, 0, 80, 40);
            poly.attr({
                'id': 'poly-' + id,
                /*'clipPath':'url(#clip)'*/
                'clipPath': clip
            });
            clip.animate({
                transform: 't80,0'
            }, 1300, mina.linear);
        }

        parseData(points);

        createSegments(myPoints);
        calculatePercentage(points, container);
        joinLine(segments, id);

        drawPolygon(segments, id);


        /*$('#poly-'+id).attr('class','show');*/

        /* function drawPolygon(segments,id){
         var polySeg = segments;
         polySeg.push([80,40],[0,40]);
         var polyLine = segments.join(' ').toString();
         var replacedString = polyLine.replace(/L/g,'').replace(/M/g,"");
         var poly = graph.polygon(replacedString);
         poly.attr('id','poly-'+id)
         }
         drawPolygon(segments,id);*/
    }
    function drawCircle(container, id, progress, parent) {
        var paper = Snap(container);
        var prog = paper.path("M5,50 A45,45,0 1 1 95,50 A45,45,0 1 1 5,50");
        var lineL = prog.getTotalLength();
        var oneUnit = lineL / 100;
        var toOffset = lineL - oneUnit * progress;
        var myID = 'circle-graph-' + id;
        prog.attr({
            'stroke-dashoffset': lineL,
            'stroke-dasharray': lineL,
            'id': myID
        });

        var animTime = 1300;
        /*progress / 100*/

        prog.animate({
            'stroke-dashoffset': toOffset
        }, animTime, mina.easein);

        function countCircle(animtime, parent, progress) {
            var textContainer = $(parent).find('.circle-percentage');
            var i = 0;
            var time = 1300;
            var intervalTime = Math.abs(time / progress);
            var timerID = setInterval(function () {
                i++;
                textContainer.text(i + "%");
                if (i === progress) clearInterval(timerID);
            }, intervalTime);
        }

        countCircle(animTime, parent, progress);
    }

    //


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
