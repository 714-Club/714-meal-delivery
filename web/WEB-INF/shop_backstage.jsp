<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/25
  Time: 22:22
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
    <title>商店信息中心</title>
    <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
    <link rel="stylesheet" href="/foodweb/static/css/storeInfo.css">

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
                <div class="form-group m-search">
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
                <li><a  class="m-a-active" href="#">商家后台</a></li>
                <li><a href="#">地区</a></li>
                <li><a href="#">语言</a></li>
                <li><a href="#" id="nav-exit">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
</nav>
<!-- 导航栏结束 -->
<!-- 正文开始 -->
<div class="content">
    <div class="content-top"></div>
    <!-- 个人信息开始 -->
    <div class="content-info container">
        <!-- 左边导航栏开始 -->
        <div class="content-info-left col-md-4">
            <div class="col-md-9 col-md-offset-3">
                <h2>商店个人中心</h2>
                <ul>
                    <li>
                        <a class="btn btn-block m-active">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本资料
                        </a>
                    </li>
                    <li>
                        <a class="btn btn-block" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商店商品
                        </a>
                    </li>
                    <li>
                        <a class="btn btn-block" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商店订单
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左边导航栏结束 -->
        <!-- 右边内容开始 -->
        <div class="content-info-right col-md-8">
            <!-- 基本资料开始 -->
            <div id="m-data">
                <h2>基本资料</h2><br><br>
                <a href="#"><img src="/foodweb/static/images/web/肉.png" alt=""></a><br><br>
                <button><img src="/foodweb/static/images//web/设置头像.png" alt="设置头像"></button><br><br><br>
                <div class="form-horizontal col-sm-10">
                    <div class="form-group">
                        <label for="m-data-username" class="col-sm-2 control-label">店名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control m-input-normal" id="m-data-username" placeholder="请输入用户名" readonly="readonly" value="${shop.username}">
                        </div>
                        <div class="col-sm-2 hidden">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-phone" class="col-sm-2">联系手机&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control m-input-normal" id="m-data-phone" placeholder="请输入手机号" readonly="readonly" value="${shop.phone}">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-email" class="col-sm-2">联系邮箱&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control m-input-normal" id="m-data-email" placeholder="请输入邮箱地址" readonly="readonly" value="${shop.email}">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-loginpassword" class="col-sm-2">登录密码&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control m-input-normal" id="m-data-loginpassword" placeholder="请输入登录密码" readonly="readonly" value="********">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-address" class="col-sm-2">商店地址&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control m-input-normal" id="m-data-address" placeholder="请输入商店地址" readonly="readonly" value="${shop.address}">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 基本资料结束 -->

            <!-- 商店商品开始 -->
            <div id="m-goods">
                <h2>商店商品</h2><br><br>
                <div class="col-sm-10 m-add-goods">
                    <!-- <button><img src="./static/images/web/新增商品.png" alt="新增商品"></button><br><br><br> -->
                    <button class="btn m-add-goods-btn">新增商品</button><br><br><br>
                    <%--<form action="/foodweb/shop/i?action=addGood" enctype="multipart/form-data" method="post">--%>

                    <div class="m-goods-list-form">
                        <form action="/foodweb/shop/i?action=addGood" method="post" enctype="multipart/form-data">
                        <div class="col-sm-4">
                            <div class="m-goods-bg-image">
                                <img src="/foodweb/static/images/android/drawable-xhdpi/taylor-grote-327183-unsplash.png" alt="" class="img-presee">
                                <input type="file" id="submit-image" style="display: none" name="image"/>
                            </div>
                        </div>

                        <div class="col-sm-8">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="m-goods-name" class="col-sm-2 control-label">菜名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="m-goods-name" placeholder="这道菜的名字" name="name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="m-goods-type" class="col-sm-2 control-label">分类</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="m-goods-type" name="direction">
                                            <option value="0">美食</option>
                                            <option value="1">肠粉</option>
                                            <option value="2">粥面</option>
                                            <option value="3">饮料</option>
                                            <option value="4">水果</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="m-goods-price" class="col-sm-2 control-label">价格</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">￥</span>
                                            <input type="number" class="form-control" id="m-goods-price" name="price">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="m-goods-discount" class="col-sm-2 control-label">优惠</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="m-goods-discount">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn m-goods-add-discount-btn">增添优惠</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn m-goods-save-btn">保存信息</button>
                                        <button class="btn m-goods-close-btn">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                </div>

                <div class="col-sm-10 m-goods-list">

                    <c:forEach items="${goodList}" var="good" >
                        <div class="row" id="<c:out value="${good.id}"/>">
                        <div class="m-goods-list-left col-sm-4">
                            <img src="<c:out value="${good.image}"/>" alt="菜图">
                        </div>
                        <div class="m-goods-list-right col-sm-8">
                            <div class="pull-right">
                                <button class="btn m-goods-list-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button><br>
                                <button class="btn m-goods-list-delete"><img src="/foodweb/static/images/web/删除.png" alt="删除"></button>
                            </div>
                            <p class="pull-left"><c:out value="${good.name}"/></p><div class="clearfix"></div>
                            <p class="pull-left"><c:out value="${good.directionString}"/></p><div class="clearfix"></div>
                            <p class="pull-left">￥<c:out value="${good.price}"/></p><div class="clearfix"></div>
                            <p class="pull-left">普通商品</p><div class="clearfix"></div>
                        </div>
                        <div class="m-goods-list-form">
                            <div class="col-sm-4">
                                <div class="m-goods-bg-image">
                                    <a><div></div></a>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-horizontal good-item">
                                    <div class="form-group">
                                        <label for="m-goods-name" class="col-sm-2 control-label">菜名</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="<c:out value="${good.id}"/>" placeholder="这道菜的名字" value="<c:out value="${good.name}"/>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="m-goods-type" class="col-sm-2 control-label">分类</label>
                                        <div class="col-sm-10">
                                            <select class="form-control">
                                                <option value="0">美食</option>
                                                <option value="1">肠粉</option>
                                                <option value="2">粥面</option>
                                                <option value="3">饮料</option>
                                                <option value="4">水果</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="m-goods-price" class="col-sm-2 control-label">价格</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon">￥</span>
                                                <input type="number" class="form-control" value="<c:out value="${good.price}"/>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="m-goods-discount" class="col-sm-2 control-label">优惠</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button class="btn m-goods-add-discount-btn">增添优惠</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn m-goods-save-btn">保存信息</button>
                                            <button class="btn m-goods-close-btn">取消</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <hr>
                    </c:forEach>

                </div>

            </div>
            <!-- 商店商品结束 -->

            <!-- 商店订单开始 -->
            <div id="m-order">
                <h2>商店订单</h2><br><br>
                <div class="col-md-10">
                    <div class="m-order-right">
                        <span class="pull-left">下单用户名</span>
                        <button class="pull-right m-order-details-btn">
                            <img src="/foodweb/static/images/web/详情.png" alt="详情">
                        </button>
                        <div class="clearfix"></div>
                        <p class="pull-left">2018 11-26    12:24</p>
                        <div class="clearfix"></div>
                        <p class="m-order-active">订单尚未送达</p>
                        <p class="pull-left">椒盐鸡扒等3样商品</p>
                        <p class="pull-right">￥23</p>
                        <div class="clearfix"></div>
                        <div class="m-order-details">
                            <table>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>优惠</td>
                                    <td>&nbsp;</td>
                                    <td class="m-order-active m-text-right">-￥2</td>
                                </tr>
                                <tr class="m-order-total">
                                    <td>合计</td>
                                    <td>&nbsp;</td>
                                    <td class="m-order-active m-text-right">￥23</td>
                                </tr>
                            </table>
                            <p class="pull-left">订单号：000</p>
                            <div class="clearfix"></div>
                            <p class="pull-left">下单时间：2018-11-26 12:56</p>
                            <div class="clearfix"></div>
                        </div><hr>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="m-order-right">
                        <span class="pull-left">下单用户名</span>
                        <button class="pull-right m-order-details-btn">
                            <img src="/foodweb/static/images/web/详情.png" alt="详情">
                        </button>
                        <div class="clearfix"></div>
                        <p class="pull-left">2018 11-26    12:24</p>
                        <div class="clearfix"></div>
                        <p class="m-order-active">订单尚未送达</p>
                        <p class="pull-left">椒盐鸡扒等3样商品</p>
                        <p class="pull-right">￥23</p>
                        <div class="clearfix"></div>
                        <div class="m-order-details">
                            <table>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>椒盐鸡扒</td>
                                    <td class="m-text-right">x1</td>
                                    <td class="m-text-right">￥5</td>
                                </tr>
                                <tr>
                                    <td>优惠</td>
                                    <td>&nbsp;</td>
                                    <td class="m-order-active m-text-right">-￥2</td>
                                </tr>
                                <tr class="m-order-total">
                                    <td>合计</td>
                                    <td>&nbsp;</td>
                                    <td class="m-order-active m-text-right">￥23</td>
                                </tr>
                            </table>
                            <p class="pull-left">订单号：000</p>
                            <div class="clearfix"></div>
                            <p class="pull-left">下单时间：2018-11-26 12:56</p>
                            <div class="clearfix"></div>
                        </div><hr>
                    </div>
                </div>
            </div>
            <!-- 商店订单结束 -->
        </div>
        <!-- 右边内容结束 -->
    </div>
    <!-- 个人信息结束 -->
</div>
<!-- 正文结束 -->



<!-- js -->
<script src="/foodweb/static/js/jquery.min.js"></script>
<script src="/foodweb/static/js/bootstrap.js"></script>
<script src="/foodweb/static/js/FeedingNet.js"></script>
<script src="/foodweb/static/js/storeInfo.js"></script>
</body>

</html>
