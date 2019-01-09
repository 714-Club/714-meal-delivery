<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2019/1/4
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 固定的购物车栏开始 -->
<div class="shopping-cart">
    <div class="container" id="shoppingcar">
        <span>总金额：￥<span id="shoppingcar-price">0</span></span>
        <a href="/foodweb/view/customer?i=3"><img class="img-responsive" src="/foodweb/static/images/web/购物车.png" alt="购物车"></a>
        <button class="btn pull-right">结算</button>
    </div>
</div>
<script src="/foodweb/static/js/shoppingcar.js"></script>
<!-- 固定的购物车栏结束 -->
