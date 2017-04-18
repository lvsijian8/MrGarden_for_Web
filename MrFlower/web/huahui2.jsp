<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/21
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/images/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>花卉</title>

    <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="css/default.css">

    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            /*height: 100%;*/
            background-color: #eee;
            font-family: 'Raleway';
        }

        ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .icon {
            position: relative;
            width: 32px;
            height: 32px;
            display: block;
            fill: rgba(51, 51, 51, 0.5);
            margin-right: 20px;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        .icon.active {
            fill: #E74C3C;
        }

        .icon.big {
            width: 64px;
            height: 64px;
            fill: rgba(51, 51, 51, 0.5);
        }

        #wrapper {
            width: 900px;
            height: 400px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            justify-content: left;
            overflow: hidden;
        }

        #left-side {
            height: 70%;
            width: 25%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        #left-side ul li {
            padding-top: 10px;
            padding-bottom: 10px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            line-height: 34px;
            color: rgba(51, 51, 51, 0.5);
            font-weight: 500;
            cursor: pointer;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        #left-side ul li:hover {
            color: #333333;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        #left-side ul li:hover > .icon {
            fill: #333;
        }

        #left-side ul li.active {
            color: #333333;
        }

        #left-side ul li.active:hover > .icon {
            fill: #E74C3C;
        }

        #border {
            height: 288px;
            width: 1px;
            background-color: rgba(51, 51, 51, 0.2);
        }

        #border #line.one {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 35px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.two {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 89px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.three {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 143px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.four {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 197px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #right-side {
            height: 300px;
            width: 75%;
            overflow: hidden;
        }

        #right-side #first, #right-side #second, #right-side #third, #right-side #fourth {
            position: absolute;
            height: 300px;
            width: 75%;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
            margin-top: -350px;
            opacity: 0;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
        }

        #right-side #first h1, #right-side #second h1, #right-side #third h1, #right-side #fourth h1 {
            font-weight: 800;
            color: #333;
        }

        #right-side #first p, #right-side #second p, #right-side #third p, #right-side #fourth p {
            color: #333;
            font-weight: 500;
            padding-left: 30px;
            padding-right: 30px;
        }

        #right-side #first.active, #right-side #second.active, #right-side #third.active, #right-side #fourth.active {
            margin-top: 0px;
            opacity: 1;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
        }

        td {
            padding: 1em;
        }

        .plant_img {
            padding-bottom: 2em;
            height: 300px;
            width: auto
        }
    </style>

</head>
<body>
<div id="wrapper">
    <div id="left-side">
        <ul>
            <li class="choose active">
                <img src="images/Image.png">图片
            </li>
            <li class="pay">
                <img src="images/Employee.png" width="48" height="48"> 简介
            </li>
            <li class="wrap">
                <img src="images/Sprout.png" width="48" height="48"> 养护
            </li>
        </ul>
    </div>

    <div id="border">
        <div id="line" class="one"></div>
    </div>

    <div id="right-side">
        <div id="first" class="active">
            <h1><%=request.getParameter("chinese_name")%>
            </h1>
            <img class="plant_img" src="sql_image<%=request.getParameter("image_url")%>">
        </div>
        <div id="second">
            <h1><%=request.getParameter("english_name")%>
            </h1>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#7a7a7a"
                                                                     style="line-height: 25px"><%=request.getParameter("text")%>
            </font>
            </p>
        </div>
        <div id="third">
            <h1><%=request.getParameter("chinese_name")%>
            </h1>
            <table>
                <tr>
                    <td width="100px">浇水</td>
                    <td><img src="images/water_<%=request.getParameter("watering")%>.png" height="40" width="216"></td>
                </tr>
                <tr>
                    <td width="100px">日照</td>
                    <td><img src="images/sun_<%=request.getParameter("sunshine")%>.png" height="40" width="216"></td>
                </tr>
                <tr>
                    <td width="100px">温度</td>
                    <td><img src="images/Temperature_blue.png" height="30" width="30"
                             style="vertical-align:middle;"><%=request.getParameter("temperature_min")%>°C<img
                            src="images/Temperature_red.png" height="30" width="30"
                            style="vertical-align:middle;margin-left: 1em"><%=request.getParameter("temperature_max")%>
                        °C
                    </td>
                </tr>
                <tr>
                    <td width="100px">肥料</td>
                    <td><img src="images/ye_<%=request.getParameter("fertilizer")%>.png" height="40" width="216"></td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script src='js/jquery-2.1.0.min.js'></script>
<script>
    $('.choose').click(function () {
        $('.choose').addClass('active');
        $('.choose > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.wrap').removeClass('active');
        $('.ship').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('#line').addClass('one');
        $('#line').removeClass('two');
        $('#line').removeClass('three');
        $('#line').removeClass('four');
    });
    $('.pay').click(function () {
        $('.pay').addClass('active');
        $('.pay > .icon').addClass('active');
        $('.choose').removeClass('active');
        $('.wrap').removeClass('active');
        $('.ship').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('#line').addClass('two');
        $('#line').removeClass('one');
        $('#line').removeClass('three');
        $('#line').removeClass('four');
    });
    $('.wrap').click(function () {
        $('.wrap').addClass('active');
        $('.wrap > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.choose').removeClass('active');
        $('.ship').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('#line').addClass('three');
        $('#line').removeClass('two');
        $('#line').removeClass('one');
        $('#line').removeClass('four');
    });
    $('.ship').click(function () {
        $('.ship').addClass('active');
        $('.ship > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.wrap').removeClass('active');
        $('.choose').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('#line').addClass('four');
        $('#line').removeClass('two');
        $('#line').removeClass('three');
        $('#line').removeClass('one');
    });
    $('.choose').click(function () {
        $('#first').addClass('active');
        $('#second').removeClass('active');
        $('#third').removeClass('active');
        $('#fourth').removeClass('active');
    });
    $('.pay').click(function () {
        $('#first').removeClass('active');
        $('#second').addClass('active');
        $('#third').removeClass('active');
        $('#fourth').removeClass('active');
    });
    $('.wrap').click(function () {
        $('#first').removeClass('active');
        $('#second').removeClass('active');
        $('#third').addClass('active');
        $('#fourth').removeClass('active');
    });
    $('.ship').click(function () {
        $('#first').removeClass('active');
        $('#second').removeClass('active');
        $('#third').removeClass('active');
        $('#fourth').addClass('active');
    });
</script>
</body>
</html>
