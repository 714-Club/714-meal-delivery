$(document).ready(function () {
    changeBlock(0);

    $("#m_shop_submit").click(function () {
        let username = $("#m_shop_username").val();
        let password = $("#m_shop_password").val();
        let code = $("#m_shop_code").val();

        if(username=="")
        {
            alert("用户名不能为空");
            return;
        }
        else if(password=="")
        {
            alert("密码不能为空");
            return;
        }
        else if(code=="")
        {
            alert("验证码不能为空");
            return;
        }
        sendShopToLogin({action:"ShopLogin",username:username,password:password,code:code})

    });

    $("#m_shop_codeImage").click(function () {
        RandowImageCode(this);
    });
    RandowImageCode($("#m_shop_codeImage"));
    function RandowImageCode(image) {
        $(image).attr("src","/foodweb/verify/i?action=getCode&t="+Math.random());
    }

    function sendShopToLogin(data)
    {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/verify/post/i",
            data:data,
            error:function () {
                alert("fail to connect");
                setBtnAbled($("#m_shop_submit"));
            },
            success:function (data) {
                setBtnAbled($("#m_shop_submit"));
               console.log(data);
                if(data["status"]=="200"){
                    window.location.href = "/foodweb/view/newShop";
                }
                else
                {
                    alert(data["message"]);
                }
            }
        });
    }

    function setBtnDisabled(btn){
        $(btn).attr("disabled",true);
    }
    function setBtnAbled(btn){
        $(btn).attr("disabled",false);
    }

    function checkRegShopName(obj){
        let parent = $(obj).parent().parent();
        let feedBack = $(obj).siblings(".form-control-feedback");
        let helpBlock = $(obj).siblings(".help-block");
        let value = $(obj).val();
        let reg = /^[\u4e00-\u9fa5A-Za-z0-9-_]{6,16}$/;

        $(parent).addClass("has-error");
        $(feedBack).addClass("glyphicon-remove");
        if(value.length == 0){
            $(helpBlock).text("名字不能为空");
            return false;
        }else if(value.length<6 || value.length>15){
            $(helpBlock).text("名字长度不符合规则");
            return false;
        }else if(!reg.test(value)) {
            $(helpBlock).text("名字存在不合法字符");
            return false;
        }else{
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("名字合法");
            return true;
        }
    }



    $("#reg_shop_username,#reg_shop_name").blur(function() {
        checkRegShopName(this);
    });

    function checkRegShopPwd(obj){
        let parent = $(obj).parent().parent();
        let feedBack = $(obj).siblings(".form-control-feedback");
        let helpBlock = $(obj).siblings(".help-block");
        let value = $(obj).val();
        let reg = /^[A-Za-z0-9]{6,16}$/;

        $(parent).addClass("has-error");
        $(feedBack).addClass("glyphicon-remove");
        if(value.length == 0){
            $(helpBlock).text("密码不能为空");
            return false;
        }else if(value.length<6 || value.length>15){
            $(helpBlock).text("密码长度不符合规则");
            return false;
        }else if(!reg.test(value)) {
            $(helpBlock).text("密码存在不合法字符");
            return false;
        }else{
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("密码合法");
            return true;
        }
    }

    $("#reg_shop_password").blur(function() {
        checkRegShopPwd(this);
    });

    function checkRegShopPwd1(obj){
        let parent = $(obj).parent().parent();
        let feedBack = $(obj).siblings(".form-control-feedback");
        let helpBlock = $(obj).siblings(".help-block");
        let value = $(obj).val();
        let preValue = $("#reg_shop_password").val();

        if(value==preValue){
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("输入密码一致");
        } else{
            $(parent).removeClass("has-success");
            $(feedBack).removeClass("glyphicon-ok");
            $(parent).addClass("has-error");
            $(feedBack).addClass("glyphicon-remove");
            $(helpBlock).text("输入密码不一致,请重新输入");
        }
    }

    $("#reg_shop_password1").blur(function () {
       checkRegShopPwd1(this);
    });

    function checkRegShopEmail(obj) {
        let parent = $(obj).parent().parent();
        let feedBack = $(obj).siblings(".form-control-feedback");
        let helpBlock = $(obj).siblings(".help-block");
        let reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        let value = $(obj).val();

        $(parent).addClass("has-error");
        $(feedBack).addClass("glyphicon-remove");
        if(value.length == 0){
            $(helpBlock).text("邮箱不能为空");
            return false;
        }else if(!reg.test(value)) {
            $(helpBlock).text("邮箱名不合法");
            return false;
        }else{
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("邮箱合法");
            return true;
        }
    }

    $("#reg_shop_email").blur(function () {
        checkRegShopEmail(this);
    });

    function checkRegShopPhone(obj) {
        let parent = $(obj).parent().parent();
        let feedBack = $(obj).siblings(".form-control-feedback");
        let helpBlock = $(obj).siblings(".help-block");
        let reg = /^1[0-9]{10}$/;
        let value = $(obj).val();

        $(parent).addClass("has-error");
        $(feedBack).addClass("glyphicon-remove");
        if(value.length == 0){
            $(helpBlock).text("电话号码为空");
            return false;
        }else if(!reg.test(value)) {
            $(helpBlock).text("电话号码不合法");
            return false;
        }else{
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("电话号码合法");
            return true;
        }
    }

    $("#reg_shop_phone").blur(function () {
        checkRegShopPhone(this);
    });

    $("#reg_shop_submit").click(function () {
        if ( !(checkRegShopName($("#reg_shop_username,#reg_shop_name")) &&
                checkRegShopPwd($("#reg_shop_password")) &&
                checkRegShopPwd1($("#reg_shop_password1")) &&
                checkRegShopEmail($("#reg_shop_email")) &&
                checkRegShopPhone($("#reg_shop_phone"))) )
            return;
    });

    function changeBlock(index){
        $(".admin-block").hide();
        $(".admin-block").eq(index).show();
    }

    $(".change-block").click(function () {
        let currentBlock = $(this).parents(".admin-block");
        let index = ($(".admin-block").index($(currentBlock)) + 1)%2;

        changeBlock(index);
    });

});