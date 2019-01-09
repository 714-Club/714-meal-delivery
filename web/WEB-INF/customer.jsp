<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/5
  Time: 15:44
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
    <title>个人信息</title>
    <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
    <link rel="stylesheet" href="/foodweb/static/css/FeedingNet.css">
    <link rel="stylesheet" href="/foodweb/static/css/personalInfo.css">

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
                <li><a href="#">关于我们</a></li>
                <li><a href="#">地区</a></li>
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
    <div class="content-top"></div>
    <!-- 个人信息开始 -->
    <div class="content-info container">
        <!-- 左边导航栏开始 -->
        <div class="content-info-left col-md-4">
            <div class="col-md-9 col-md-offset-3">
                <h2>个人中心</h2>
                <ul id="choose-list" index="${index}">
                    <li>
                        <a class="btn btn-block m-active" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的资料
                        </a>
                    </li>
                    <li>
                        <a class="btn btn-block" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的地址
                        </a>
                    </li>
                    <li>
                        <a class="btn btn-block" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的订单
                        </a>
                    </li>
                    <li>
                        <a class="btn btn-block" href="javascript:void(0);">
                            <img src="/foodweb/static/images/web/Shape101.png" alt="导航项">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购物车
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左边导航栏结束 -->
        <!-- 右边内容开始 -->
        <div class="content-info-right col-md-8">
            <!-- 我的资料开始 -->
            <div id="m-data">
                <h2>我的资料</h2><br><br>
                <a href="#"><img src="/foodweb/static/images/web/肉.png" alt=""></a><br><br>
                <button><img src="/foodweb/static/images//web/设置头像.png" alt="设置头像"></button><br><br><br>
                <div class="form-horizontal col-sm-10">
                    <div class="form-group">
                        <label for="m-data-username" class="col-sm-2 control-label">用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control m-input-normal" id="m-data-username" placeholder="请输入用户名" readonly="readonly" value="${customer.username}">
                        </div>
                        <div class="col-sm-2 hidden">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-phone" class="col-sm-2">手机号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control m-input-normal" id="m-data-phone" placeholder="请输入手机号" readonly="readonly">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-email" class="col-sm-2">邮箱地址&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control m-input-normal" id="m-data-email" placeholder="请输入邮箱地址" readonly="readonly" value="${customer.email}">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-loginpassword" class="col-sm-2">登录密码&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control m-input-normal" id="m-data-loginpassword" placeholder="请输入登录密码" readonly="readonly" value="*****">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-data-paypassword" class="col-sm-2">支付密码&nbsp;:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control m-input-normal" id="m-data-paypassword" placeholder="请输入支付密码" readonly="readonly" value="*****">
                        </div>
                        <div class="col-sm-2">
                            <button class="m-data-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 我的资料结束 -->
            <!-- 我的地址开始 -->
            <div id="m-address">
                <h2>我的地址</h2><br><br>
                <button class="pull-left"><img src="/foodweb/static/images/web/添加地址.png" alt="添加地址"></button>

                <div class="clearfix"></div>
                <%--<form class="form-horizontal col-sm-10">--%>
                    <div class="form-group">
                        <label for="m-address-username" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="m-address-username" placeholder="请输入姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-address-phone" class="col-sm-2">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="m-address-phone" placeholder="请输入手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m-address-address" class="col-sm-2">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="m-address-address" placeholder="请输入地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="m-address-comfirm" class="btn btn-primary">确定</button>

                            <button class="btn btn-danger">取消</button>
                        </div>
                    </div>
                <%--</form>--%>
                <div class="clearfix"></div>
                <hr>

                <!-- 地址 -->
               <c:forEach items="${addressList}" var="address" >
                <div class="m-address-item col-sm-10">
                    <img class="pull-left" src="/foodweb/static/images/web/地址.png" alt="地址">
                    <span class="pull-left">
                        <c:out value="${address.name}"/>
                    </span>
                    <p class="pull-left">先生</p>
                    <span class="pull-left">
                            <c:out value="${address.phone}"/>
                    </span>
                    <span class="pull-left">
                            <c:out value="${address.address}"/>
                    </span>
                    <div class="pull-right">
                        <button class="m-address-modify"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                        <button class="m-address-delete"><img src="/foodweb/static/images/web/删除.png" alt="删除"></button>
                    </div>
                    <div class="clearfix"></div>
                    <form class="form-horizontal col-sm-10">
                        <div class="form-group">
                            <label for="m-address-username" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  placeholder="请输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m-address-phone" class="col-sm-2">手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m-address-address" class="col-sm-2">地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  placeholder="请输入地址">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit"><img src="/foodweb/static/images/web/修改.png" alt="修改"></button>
                            </div>
                        </div>
                    </form>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <hr>
                </c:forEach>
                <!-- 地址 -->

            </div>
            <!-- 我的地址结束 -->
            <!-- 我的订单开始 -->
            <div id="m-order">
                <h2>我的订单</h2><br><br>
                <div class="col-md-10">
                    <div class="col-md-4">
                        <img src="/foodweb/static/images/android/drawable-xhdpi/taylor-grote-327183-unsplash.png" alt="店图">
                    </div>
                    <div class="col-md-8 m-order-right">
                        <span class="pull-left">老友记（店名）</span>
                        <button class="pull-right m-order-details-btn">
                            <img src="/foodweb/static//images/web/详情.png" alt="详情">
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
                    <div class="col-md-4">
                        <img src="/foodweb/static/images/android/drawable-xhdpi/taylor-grote-327183-unsplash.png" alt="店图">
                    </div>
                    <div class="col-md-8 m-order-right">
                        <span class="pull-left">老友记（店名）</span>
                        <button class="pull-right m-order-details-btn">
                            <img src="/foodweb/static//images/web/详情.png" alt="详情">
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
            <!-- 我的订单结束 -->
            <!--  购物车开始 -->
            <div id="m-shoppingcart">
                <h2>购物车</h2><br><br>
                <div class="col-sm-10">

                    <c:forEach items="${shopcarList}" var="shopcar" >

                        <table class="table">
                        <caption>
                            <div class="pull-left">
                                <img src="/foodweb/static/images/web/shopicon.png" alt="门店" width="25px">&nbsp;&nbsp;&nbsp;<a href="/foodweb/view/goods?id=<c:out value="${shopcar.shop.id}"/> "><c:out value="${shopcar.shop.name}"/></a>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-default cart-delete">删除</button>
                                <button class="btn btn-primary">结算</button>
                            </div>
                        </caption>
                        <c:forEach items="${shopcar.goodList}" var="good" >
                        <tr carid ="<c:out value="${good.id}"/>">
                            <td>
                                <input type="checkbox" >
                            </td>
                            <td>
                                <div class="col-sm-4">
                                    <a href="#"><img class="img-responsive" src="<c:out value="${good.good.image}"/>" width="120px" alt="食物"></a>
                                </div>
                                <div class="col-sm-8">
                                    <h4><c:out value="${good.good.name}"/></h4>
                                    <p>￥<c:out value="${good.good.price}"/></p>
                                    <div class="input-group col-sm-6 quantity">
                                        <span class="input-group-addon">数量</span>
                                        <input type="number" min="1" class="form-control" placeholder="数量" value="<c:out value="${good.quantity}"/>">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>

                    </c:forEach>


                </div>
                <div class="clearfix"></div>
            </div>
            <!--  购物车结束 -->
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
<script src="/foodweb/static/js/personalInfo.js"></script>
</body>

</html>
