<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/5
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>送餐网 商家入驻</title>
    <link rel="stylesheet" href="/foodweb/static/css/bootstrap.css">
    <link rel="stylesheet" href="/foodweb/static/css/FeedingNet.css">
    <link rel="stylesheet" href="/foodweb/static/css/base.css">
    <link rel="stylesheet" href="/foodweb/static/css/newshop.css">


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
                <li><a class="m-a-active" href="/foodweb/view/newShop">商家入驻</a></li>
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
    <div class="container-fluid">

        <div class="background">
            <div class="container fluid">
                <div class="left col-sm-5">

                </div>
                <div class="right col-sm-5 col-sm-offset-2">
                    <div class="container-fluid admin-block">
                        <div class="row">
                            <div class="h3">登录你的商店</div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="m_shop_username" class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="m_shop_username" placeholder="请输入商店用户名">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="m_shop_password" class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="m_shop_password" placeholder="请输入密码">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="m_shop_code" class="col-sm-3 control-label">验证码：</label>
                                <span class="col-sm-4">
                                    <input type="text" class="form-control" id="m_shop_code" placeholder="验证码">
                                </span >
                                <span class="col-sm-3">
                                    <img src="/foodweb/verify/i?action=getCode" alt="" id="m_shop_codeImage">
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3"><button class="btn change-block">转到注册</button></div>
                                <div class="col-sm-9">
                                    <input type="submit" class="form-control" id="m_shop_submit" value="登录">
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="container-fluid admin-block">
                        <div class="row">
                            <div class="h3">商家注册</div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_username" class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="reg_shop_username" placeholder="6~16位中英文,数字,下划线,减号">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_password" class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="reg_shop_password" placeholder="6~16位字母或数字">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_password1" class="col-sm-3 control-label">验证密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="reg_shop_password1" placeholder="请再次输入密码">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_name" class="col-sm-3 control-label">商店名：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="reg_shop_name" placeholder="6~16位中英文,数字,下划线,减号">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_email" class="col-sm-3 control-label">邮箱：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="reg_shop_email" placeholder="请输入邮箱">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label for="reg_shop_phone" class="col-sm-3 control-label">电话号码：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="reg_shop_phone" placeholder="请输入电话号码">
                                    <span class="glyphicon form-control-feedback"></span>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="reg_shop_code" class="col-sm-3 control-label">验证码：</label>
                                <span class="col-sm-4">
                                    <input type="text" class="form-control" id="reg_shop_code" placeholder="验证码">
                                </span >
                                <span class="col-sm-3">
                                    <img src="/foodweb/verify/i?action=getCode" alt="" id="reg_shop_codeImage">
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3"><button class="btn change-block">转到登录</button></div>
                                <div class="col-sm-9">
                                    <input type="submit" class="form-control" id="reg_shop_submit" value="注册">
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>

    </div>
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

<!-- 弹出层 -->
<div id="fade">
    <div class="popup popup-login">
        <div class="container-fluid">
            <div class="row">
                <div class="h3">登录界面</div>
            </div>
            <div class="row">
                <div class="form-group username">
                    <label for="input-username">用户名</label>
                    <input type="text" class="form-control" id="input-username" placeholder="请输入用户名或者邮箱">
                </div>
            </div>
            <div class="row">
                <div class="form-group password">
                    <label for="input-password">密码</label>
                    <input type="password" class="form-control" id="input-password" placeholder="请输入密码">
                </div>
            </div>
            <div class="row">
                <div class="form-group code">
                        <span class="col-xs-5">
                            <label for="input-code">验证码</label>
                            <input type="text" class="form-control" id="input-code" placeholder="验证码">
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
                <div class="form-group username">
                    <label for="register-username">用户名</label>
                    <input type="text" class="form-control" id="register-username" placeholder="请输入用户名">
                </div>
            </div>
            <div class="row">
                <div class="form-group password">
                    <label for="register-passowrd">密码</label>
                    <input type="password" class="form-control" id="register-passowrd" placeholder="请输入密码">
                    <input type="password" class="form-control" id="register-repassowrd" placeholder="请重新输入密码">
                </div>
            </div>
            <div class="row">
                <div class="form-group username">
                    <label for="register-email">邮箱</label>
                    <input type="text" class="form-control" id="register-email" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="row">
                <div class="form-group code">
                        <span class="col-xs-5">
                            <label for="register-code">验证码</label>
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
<script src="/foodweb/static/js/adminShop.js"></script>
</body>

</html>

