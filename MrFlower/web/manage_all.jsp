<%--
  Created by IntelliJ IDEA.
  User: lvsijian8
  Date: 2017/5/7
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理全部花盆</title>
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
                        <li><a href="login.jsp">登录|注册</a></li>
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
                                    选择您的花盆
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body" style="padding-left: 2em">
                                <form class="form" method="post">
                                    <input type="radio" id="hwl" name="radio" value="虎尾兰"><label
                                        for="hwl">虎尾兰</label><br/>
                                    <input type="radio" id="gyz" name="radio" value="观音竹"><label for="gyz">观音竹</label>
                                </form>
                                <br/>
                                <a href="addPot.jsp" style="text-decoration:underline;"><img src="images/Add.png"
                                                                                             style="width: 24px;height: auto"><font
                                        size="24" color="red">添加花盆</font></a>
                                <a href="manage_all.jsp" style="text-decoration:underline;float: right;padding-right: 2em"><img src="images/Setting.png"
                                                                                             style="width: 24px;height: auto"><font
                                        size="24" color="#5fe18c">管理全部花盆</font></a>
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

<div style="background-color: #f9f9f9;padding-bottom: 2em">
    <form id="manage_form" action="" method="post">
        <div style="padding:0em 50em 1em 1em;">
            <a name="manage_btn" onclick="nockeck()" style="color: #FFFFFF;padding: 4px 50px;margin-right: 0.6em" class="btn btn-primary radius">
                <img src="images/Watering_all.png" width="16px">&nbsp;&nbsp;浇&nbsp;水</a>
            <a name="manage_btn" onclick="nockeck()" style="color: #FFFFFF;padding: 4px 50px;" class="btn btn-primary radius">
                <img src="images/Bottle_all.png" width="16px">&nbsp;&nbsp;施&nbsp;肥</a>
        </div>

        <script>
            function nockeck() {
                alert("请选择您要操作的花盆!!!");
            }

            function ckeckall() {
                var cks = document.querySelectorAll("input[type=checkbox]:checked");
                if(cks.length>0) {
                    $("a").attr("onclick","submit1()");
                }
                else{
                    $("a").remove("onclick");
                }
            }

            function submit1() {
                document.getElementById('manage_form').submit();
            }

        </script>

        <table class="table table-hover table-outline mb-0 hidden-sm-down" style="width: 80%; margin: 0 auto">
            <thead class="thead-default">
            <tr>
                <th style="width: 2em"><input type="checkbox" id="ckAll" onclick="ckeckall()"></th>
                <th style="width: 10em">花盆名</th>
                <th style="width: 6em">在线状态</th>
                <th style="width: 18em" class="text-center">水量</th>
                <th style="width: 16em" class="text-center">营养液</th>
                <th>上次浇水时间</th>
                <th>上次施肥时间</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆1</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>50%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>20%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>10秒前</strong>
                </td>
                <td>
                    <strong>10秒前</strong>
                </td>
            </tr>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆2</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>10%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>40%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>5分钟前</strong>
                </td>
                <td>
                    <strong>5分钟前</strong>
                </td>
            </tr>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆3</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>74%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>41%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="41" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>1小时前</strong>
                </td>
                <td>
                    <strong>1小时前</strong>
                </td>
            </tr>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆4</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>98%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 98%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>62%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 62%" aria-valuenow="62" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>5小时前</strong>
                </td>
                <td>
                    <strong>5小时前</strong>
                </td>
            </tr>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆5</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>22%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>82%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 82%" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>10小时前</strong>
                </td>
                <td>
                    <strong>10小时前</strong>
                </td>
            </tr>
            <tr>
                <th><input type="checkbox" name="check" onclick="ckeckall()"></th>
                <td>
                    <div>花盆6</div>
                </td>
                <td>
                    <img src="images/Light_On.png" alt="在线" style="height:24px;">在线
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>43%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 43%" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <div class="clearfix">
                        <div class="float-left">
                            <strong>66%</strong>
                        </div>
                    </div>
                    <div class="progress progress-xs">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </td>
                <td>
                    <strong>24小时前</strong>
                </td>
                <td>
                    <strong>24小时前</strong>
                </td>
            </tr>
            </tbody>

        </table>
    </form>
</div>
<script>

    $("#ckAll").click(function() {
        $("input[name='check']").prop("checked", this.checked);
    });

    $("input[name='check']").click(function() {
        var $subs = $("input[name='check']");
        $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
    });

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