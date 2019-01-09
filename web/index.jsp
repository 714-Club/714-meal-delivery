<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/11/25
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>送餐网首页</title>
  <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
  <link rel="stylesheet" href="/foodweb/static/css/FeedingNet.css">
  <link rel="stylesheet" href="/foodweb/static/css/base.css">

</head>

<body>
<!-- 导航栏开始 -->
<nav class="navbar navbar-inverse navbar-fixed-top m-navbar-show">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1"
              aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="/foodweb/static/images/web/LOGO.png" alt="LOGO"></a>
    </div>

    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <form class="navbar-form navbar-right">
        <div class="form-group">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="搜索">
            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span>&thinsp;</button>
                            </span>
          </div>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a class="m-a-active" href="/foodweb/view/">首页</a></li>
        <li><a href="/foodweb/view/shop">商店</a></li>
        <li><a href="/foodweb/view/newShop">商家入驻</a></li>
        <li><a href="#">关于我们</a></li>
        <li><a href="#">语言</a></li>
        <li><a href="#" id="nav-username">登录</a></li>
        <li><a href="#" id="nav-register">注册</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>
<!-- 导航栏结束 -->


<!-- 正文开始 -->
<div class="content">
  <div class="content-top">
    <div class="container">
      <div class="row">
        <div class="col-md-5 col-sm-7 col-xs-12 .visible-xs-block">
          <h1>精选韶院优质餐馆</h1>
          <div class="clearfix"></div>
          <h2>给您贴心的订餐体验</h2>
          <div class="clearfix"></div>
          <div>
            <a href="/foodweb/view/shop">
              <button class="btn" type="button" id="btn-shop">进入商家点餐</button>
            </a>
            <p class="text-center">服务无止境，美味不停歇</p>
          </div>
        </div>
        <div class="col-md-7 col-sm-5 .hidden-xs-block"></div>
      </div>
    </div>
  </div>
  <!-- 食物列表开始 -->
  <div class="content-foodlist">
    <div class="container">
      <h2 class="text-center">人气美食</h2>
      <ul class="row">
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
        <li class="col-md-4 col-sm-6 col-xs-12">
          <div class="food">
            <a href="#">
              <img src="/foodweb/static/images/" alt="美食">
              <img src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
            </a>
            <h3>这道菜的名称</h3>
            <p>店名</p>
            <div class="food-price">
              <span>￥36</span>
              <a href="#"><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <!-- 食物列表结束 -->
  <div class="content-bottom"></div>
</div>
<!-- 正文结束 -->
<!-- 底部开始 -->
<div class="footer">
  <div class="container">
    <ul class="row">
      <li class="col-sm-3 text-center">
        <h5>关注我们</h5>
        <p><img src="/foodweb/static/images/web/二维码.jpg" width="80px" alt="二维码"></p>
      </li>
      <li class="col-sm-3 text-center">
        <h5>联系我们</h5>
        <p>客服电话(美国): 909-606-6688</p>
        <p>客服电话(澳洲): 1300-999-990</p>
      </li>
      <li class="col-sm-3 text-center">
        <h5>招聘中心</h5>
        <p>招商电话: +61410058888</p>
        <p>Email: helen@easi.com.au</p>
      </li>
      <li class="col-sm-3 text-center">
        <h5>分享中心</h5>
        <p>
          <a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="hover">
            <img src="/foodweb/static/images/web/wechat.png" width="40px" alt="微信分享">
          </a>
          <a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="hover">
            <img src="/foodweb/static/images/web/QQ.png" width="40px" alt="QQ分享">
          </a>
          <a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="hover">
            <img src="/foodweb/static/images/web/微博.png" width="40px" alt="微博分享">
          </a>
        </p>
      </li>
      <div class="clearfix"></div>
      <p class="text-center">Copyright © 2018.<strong>XGZX</strong> All rights reserved 粤ICP证666号</p>
    </ul>

  </div>
</div>
<!-- 底部结束 -->

<!-- 固定的购物车栏开始 -->
<div class="shopping-cart">
  <div class="container" id="shoppingcar">
    <span>总金额：￥<span id="shoppingcar-price">0</span></span>
    <a href="/foodweb/view/customer?i=3"><img class="img-responsive" src="/foodweb/static/images/web/购物车.png" alt="购物车"></a>
    <button class="btn pull-right">结算</button>
  </div>
</div>

<!-- 弹出层 -->
<div id="fade">
  <div class="popup popup-login">
    <div class="container-fluid">
      <div class="row">
        <div class="h3">登录界面</div>
      </div>
      <div class="row">
        <div class="form-group username has-feedback">
          <label class="control-label" for="input-username">用户名</label>
          <input type="text" class="form-control" id="input-username" placeholder="请输入用户名或者邮箱">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group password has-feedback">
          <label class="control-label" for="input-password">密码</label>
          <input type="password" class="form-control" id="input-password" placeholder="请输入密码">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group code">
                        <span class="col-xs-5">
                            <label class="control-label" for="input-code">验证码</label>
                            <input type="text" class="form-control" id="input-code" placeholder="验证码">
                            <span class="help-block"></span>
                        </span>
          <span class="col-xs-6 col-xs-offset-1">
                            <img src="/foodweb/verify/i?action=getCode" alt="图片加载不出" title="点击更换验证码" id="image-code">
                        </span>
        </div>
      </div>
      <div class="row btn-box">
        <button class="btn btn-primary submit-login">登录</button>
      </div>
    </div>
  </div>

  <div class="popup popup-register">
    <div class="container-fluid">
      <div class="row">
        <div class="h3">注册界面</div>
      </div>
      <div class="row">
        <div class="form-group username has-feedback">
          <label class="control-label" for="register-username">用户名</label>
          <input type="text" class="form-control" id="register-username" placeholder="6~16位中英文,数字,下划线,减号">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group password has-feedback">
          <label class="control-label" for="register-passowrd">密码</label>
          <input type="password" class="form-control" id="register-passowrd" placeholder="6~16位字母或数字">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group username has-feedback">
          <input type="password" class="form-control" id="register-repassowrd" placeholder="请再次输入密码">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group username has-feedback ">
          <label class="control-label" for="register-email">邮箱</label>
          <input type="text" class="form-control" id="register-email" placeholder="请输入邮箱">
          <span class="glyphicon form-control-feedback"></span>
          <span class="help-block"></span>
        </div>
      </div>
      <div class="row">
        <div class="form-group code">
                        <span class="col-xs-5">
                            <label class="control-label" for="register-code">验证码</label>
                            <input type="text" class="form-control" id="register-code" placeholder="验证码">
                        </span>
          <span class="col-xs-3 col-xs-offset-1">
                            <button class="btn btn-primary code-btn" id="btn-sendMail">获取验证码</button>
                        </span>
        </div>
      </div>
      <div class="row btn-box">
        <button class="btn btn-primary submit-register">注册</button>
      </div>
    </div>
  </div>
</div>
<!-- 弹出层 -->




<!-- js -->
<script src="/foodweb/static/js/jquery.min.js"></script>
<script src="/foodweb/static/js/bootstrap.js"></script>
<script src="/foodweb/static/js/FeedingNet.js"></script>
<script src="/foodweb/static/js/shoppingcar.js"></script>

</body>

</html>
