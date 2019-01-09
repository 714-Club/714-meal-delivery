<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/5
  Time: 15:25
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
    <title>商家页</title>
    <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
    <link rel="stylesheet" href="/foodweb/static/css/store.css">
    <link rel="stylesheet" href="/foodweb/static/css/FeedingNet.css">
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
                <li><a class="m-a-active" href="/foodweb/view/shop">商店</a></li>
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

    <!-- 商品列表开始 -->
    <div class="content-foodlist">
        <div class="container">
            <ul class="row">
                <c:forEach items="${shopList}" var="shop" >
                <li class="col-md-4 col-sm-6 col-xs-12">
                    <div class="food">
                        <a href="/foodweb/view/goods?id=<c:out value="${shop.id}"/>">
                            <img src="<c:out value="${shop.image}"/>" alt="商店">
                            <img class="hidden-xs" src="/foodweb/static/images/web/hot拷贝.png" alt="热卖">
                        </a>
                        <div class="food-info">
                            <span class="pull-left">店名 <c:out value="${shop.name}"/></span>
                            <span>月售1120笔</span>
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

<!-- 弹出层 -->
<%@include file="jsp/popup.jsp"%>
<!-- 弹出层 -->

<!-- 购物车 -->
<%@include file="jsp/shoppingcar.jsp"%>
<!-- 购物车 -->

<!-- js -->
<script src="/foodweb/static/js/FeedingNet.js"></script>
</body>

</html>
