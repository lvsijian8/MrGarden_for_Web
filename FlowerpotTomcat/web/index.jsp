<%--
  Created by IntelliJ IDEA.
  User: desol
  Date: 2017/3/9
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
    <meta name="format-detection" content="telephone=no" />
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico" />
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
    <script>
        $(document).ready(function(){
            $().UItoTop({ easingType: 'easeOutQuart' });
          /*carousel*/
            var owl=$("#owl");
            owl.owlCarousel({
                items : 1, //10 items above 1000px browser width
                navigation : true,
                pagination :  false
            });
            var owl=$("#owl1");
            owl.owlCarousel({
                items : 1, //10 items above 1000px browser width
                navigation : true,
                pagination :  false
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
        <div class="slogan">glorify the nature around you</div>
      </div>
    </div>
    <div class="clear"></div>
    <div class="menu_block">
      <div class="container_12">
        <div class="grid_12">
          <nav class="horizontal-nav full-width horizontalNav-notprocessed">
            <ul class="sf-menu">
              <li class="current"><a href="index.jsp">首页</a></li>
              <li><a href="index-1.html">图表</a></li>
              <li><a href="index-2.html">设备</a></li>
              <li><a href="index-3.html">价格</a></li>
              <li><a href="Contacts.jsp">联系我们</a></li>
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
  <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - January 27, 2014!</div>
    <div class="container_12">
      <div class="grid_4">
        <div class="block1">
          <div class="img_block">
            <img src="images/page1_img1.jpg" alt="" class="img_inner">
            <span class="l"></span>
            <span class="ll"></span>
            <span class="r"></span>
            <span class="rr"></span>
            <span class="lb"></span>
            <span class="llb"></span>
            <span class="rb"></span>
            <span class="rrb"></span>
          </div>
          <div class="text1">Landscape Design</div><br>
          <a href="#" class="btn">more</a>
        </div>
      </div>
      <div class="grid_4">
        <div class="block1">
          <div class="img_block">
            <img src="images/page1_img2.jpg" alt="" class="img_inner">
            <span class="l"></span>
            <span class="ll"></span>
            <span class="r"></span>
            <span class="rr"></span>
            <span class="lb"></span>
            <span class="llb"></span>
            <span class="rb"></span>
            <span class="rrb"></span>
          </div>
          <div class="text1">Garden Plans</div><br>
          <a href="#" class="btn">more</a>
        </div>
      </div>
      <div class="grid_4">
        <div class="block1">
          <div class="img_block">
            <img src="images/page1_img3.jpg" alt="" class="img_inner">
            <span class="l"></span>
            <span class="ll"></span>
            <span class="r"></span>
            <span class="rr"></span>
            <span class="lb"></span>
            <span class="llb"></span>
            <span class="rb"></span>
            <span class="rrb"></span>
          </div>
          <div class="text1">Planting Design</div><br>
          <a href="#" class="btn">more</a>
        </div>
      </div>
      <div class="clear"></div>
      <div class="grid_8">
        <h3>About Us</h3>
        <div id="owl">
          <div class="item">
            <p>Go to TemplateMonster.com blog to read more about this <span class="col1"><a href="http://sc.chinaz.com/">freebie</a></span>. </p>
            <p>Interested in more examples of <span class="col1"><a href="http://sc.chinaz.com/" rel="nofollow">Exterior Design Website Templates</a></span>? Visit the same name category of premium themes.</p>
            Vivamus at magna non nunc tristique rhoncusiquam nibh ante, egestas id dictum acommodo.
          </div>
          <div class="item">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus obcaecati dicta. Saepe delectus consequuntur atque quaerat sit accusamus aperiam voluptas laboriosam molestias nihil magni sunt nesciunt ad deserunt ea consequatur!
          </div>
        </div>
      </div>
      <div class="grid_4">
        <h3>What We Do</h3>
        <ul class="list">
          <li><a href="#">Front Yards</a></li>
          <li><a href="#">Backyards</a></li>
          <li><a href="#">Garden Ponds</a></li>
          <li><a href="#">Patios</a></li>
          <li><a href="#">Garden Paths &amp; Walkways</a></li>
          <li><a href="#">Landscape Steps &amp; Stairs</a></li>
          <li><a href="#">Garden Arches &amp; Arbors</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="bottom_block">
    <div class="container_12">
      <div class="grid_3">
        <h3>Top Projects</h3>
        <div id="owl1">
          <div class="item">
            <div class="img_block ib1">
              <img src="images/car_img1.jpg" alt="" class=" img_inner">
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
          <div class="item">
            <div class="img_block ib1">
              <img src="images/car_img2.jpg" alt="" class="img_inner">
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
      </div>
      <div class="grid_4 prefix_1">
        <h3>Latest News</h3>
        <p class="col1">
          <time datetime="2014-01-01">04.01.14</time> -
          <a href="#">Your Garden</a>
        </p>
        Curabitur vel lorem sit amet nullaertylllamcr fermentum. In vitae varius augue, eu onse ligula. Etiam dui er laoreet sit amet est ve
      </div>
      <div class="grid_4">
        <h3>Newsletter Sign Up</h3>
        <p>In vitae varius augue, eu onse ligula. Etiam dui er laoreet sit amet est ve commodo </p>
        <form id="newsletter">
          <div class="rel">
            <div class="success">Your subscribe request has been sent!</div>
            <label class="email">
              <input type="email" value="Enter your e-mail here..." >
              <a href="#" class="" data-type="submit">submit</a>
              <span class="error">*This is not a valid email address.</span>
            </label>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!--==============================footer=================================-->
  <footer>
    <div class="container_12">
      <div class="grid_12 ">
        <div class="copy">
          Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
        </div>
      </div>
      <div class="clear"></div>
    </div>
  </footer>
  <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
  </body>
</html>
