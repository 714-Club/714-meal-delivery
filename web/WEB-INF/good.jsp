<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/6
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>进入商家页</title>
    <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
    <link rel="stylesheet" href="/foodweb/static/css/FeedingNet.css">
    <link rel="stylesheet" href="/foodweb/static/css/store_in.css">
    <link rel="stylesheet" href="/foodweb/static/css/base.css">

    <script src="/foodweb/static/js/jquery.min.js"></script>
    <script src="/foodweb/static/js/bootstrap.js"></script>

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
                <li><a href="/foodweb/view/">首页</a></li>
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

<!-- 内容开始 -->
<div class="content container-fluid">
    <!-- 商家信息开始 -->
    <div class="business-info container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <img src="${shop.image}" alt="商店封面" width="500px">
                <h3>${shop.name}</h3>
            </div>
            <div class="col-md-6 col-sm-6">
                <p>简介：${shop.motto}</p>
                <p>联系电话：${shop.phone}</p>
                <p>邮箱：${shop.email}</p>
            </div>
        </div>
    </div>
    <!-- 商家信息结束 -->

    <!-- 商品分类开始 -->
    <div class="food-sort container">
        <ul class="row" id="direction-list">
            <span class="pull-left hidden-xs">分类：</span>
            <li class="col-md-1 col-sm-1"><a class="food-sort-active" href="#">全部</a></li>
            <li class="col-md-1 col-sm-1"><a href="#">肠粉</a></li>
            <li class="col-md-1 col-sm-1"><a href="#">粥面</a></li>
            <li class="col-md-1 col-sm-1"><a href="#">饮料</a></li>
            <li class="col-md-1 col-sm-1"><a href="#">水果</a></li>
            <li class="col-md-1 col-sm-1"><a href="#">美食</a></li>
        </ul>
        <ul class="row">
            <span class="pull-left hidden-xs">活动：</span>
            <li class="col-md-1 col-sm-1"><a href="#">优惠</a></li>
        </ul>
    </div>
    <div>-</div>
    <!-- 商品分类结束 -->
    <!-- 商品列表开始 -->
    <div class="content-foodlist">
        <div class="container">
            <ul class="row">

            <c:forEach items="${goodList}" var="good" >
                <li class="col-md-4 col-sm-6 col-xs-12" direction="<c:out value='${good.direction}' />">
                    <div class="food" >
                        <a href="#">
                            <img src="<c:out value='${good.image}' />" alt="美食">
                            <img class="hidden-xs" src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
                        </a>
                        <h3><c:out value='${good.name}' /></h3>
                        <p>优惠情况</p>
                        <div class="food-price">
                            <span>￥<c:out value='${good.price}' /></span>
                            <a href="#" goodid="<c:out value='${good.id}' />" shopid="<c:out value='${good.shopid}' />" ><img src="/foodweb/static/images/web/添加.png" alt="添加"></a>
                        </div>
                    </div>
                </li>
            </c:forEach>

            </ul>
        </div>
    </div>
    <!-- 商品列表结束 -->
</div>
<!-- 内容结束 -->


<%@include file="jsp/footer.jsp"%>


<div class="back-to-top hidden-xs">
    <a class="btn" href="#" title="回到顶部"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>



<%@include file="jsp/popup.jsp"%>
<%@include file="jsp/shoppingcar.jsp"%>


<!-- js -->
<script src="/foodweb/static/js/FeedingNet.js"></script>
<script src="/foodweb/static/js/base.js" ></script>
">"
</body>

</html>
