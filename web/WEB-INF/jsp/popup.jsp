<%--
  Created by IntelliJ IDEA.
  User: 82583
  Date: 2018/12/6
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
