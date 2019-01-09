//导航栏js
$(document).ready(function(){
    
    setNavNoCustomer();
    randomCode();






    $(".navbar-right #nav-username").click(function(){

        if($(this).text()=="登录"){

            showMenu("login");

        }
        else
        {
            window.location.href="/foodweb/view/customer";
        }



        return false;
    });
    $(".navbar-right #nav-register").click(function(){
        showMenu("register");
    });


    $("#fade .popup").click(function(){
        //阻止默认事件
        return false;
    });

    $("#fade").click(function(){
        $(this).children("*").slideUp();
        $(this).fadeOut();
    });

    function showMenu(menu){
        $("#fade").show();
        $("#fade .popup").hide();
        $("#fade .popup-"+menu).slideDown();
    }

    function setNavNoCustomer(){
        $(".navbar-right #nav-username").text("登录");
        $(".navbar-right #nav-register").css("display","");
    }

    function setNavHasCustomer(customer){

        $(".navbar-right #nav-username").text(customer["username"]);
        $(".navbar-right #nav-register").css("display","none");

    }
    $("#fade #btn-sendMail").click(function(){

        if($("#register-email").val()==""){
            alert("邮箱不能为空");
            return;
        }
        setMailButtonStatusInSend();
    });
    function setMailButtonStatusInSend(){
        const btnMail = $("#fade #btn-sendMail");
        $(btnMail).removeClass("btn-primary");
        $(btnMail).addClass("btn-success");
        $(btnMail).attr("disabled",true);
        let time = 60;
        $(btnMail).text("("+time+")");
        
        let key = setInterval(function(){
            time=time-1;
            $(btnMail).text("("+time+")");
            if(time==-1){
                setMailBtnInit();
                clearInterval(key);
            }
        },1000);

    }

    function setMailBtnInit(){
        const btnMail = $("#fade #btn-sendMail");
        $(btnMail).removeClass("btn-success");
        $(btnMail).addClass("btn-primary");
        $(btnMail).attr("disabled",false);
        $(btnMail).text("获取验证码");
    }

    $("#fade .submit-register").click(function(){
        let username = $("#register-username").val();
        let password = $("#register-passowrd").val();
        let repassword = $("#register-repassowrd").val();
        let code = $("#register-code").val();
        let email = $("#register-email").val();

        if(username==""){
            alert("用户名不能为空");
            return;
        }
        else if(password=="")
        {
            alert("密码不能为空");
            return;
        }
        else if(password!=repassword)
        {
            alert("两次密码不一致");
            return;
        }
        else if(email==""){
            alert("邮箱不能为空");
            return;
        }
        else  if(code=="")
        {
            alert("验证码不能为空");
            return;
        }


        setBtnDisabled(this);
        sendCustomerToRegister({action:"CustomerRegister",username:username,password:password,code:code,email:email});


    });

    $("#image-code").click(function(){
        randomCode();
    });

    function randomCode(){
        $("#image-code").attr("src","/foodweb/verify/i?action=getCode&t="+Math.random());
    }

    $(".submit-login").click(function () {
        let username = $("#input-username").val();
        let password = $("#input-password").val();
        let code = $("#input-code").val();

        if(username=="")
        {
            alert("用户名不能为空");return;
        }
        else if(password=="")
        {
            alert("密码不能为空");return;
        }
        else if(code=="")
        {
            alert("验证码不能为空");
            return;
        }
        setBtnDisabled(this);
        sendCustomerToLogin({action:"CustomerLogin",username:username,password:password,code:code});
    });

    function setInputStatusToWarnning(btn){
        $(btn).addClass("error");
    }
    function setInputStatusToNormal(btn){
        $(btn).removeClass("error");
    }

    function sendCustomerToLogin(customer){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/verify/post/i",
            data:customer,
            error:function () {
                alert("fail to connect");
                setBtnAbled($("#fade .submit-login"));
                randomCode();
            },
            success:function (data) {
                setBtnAbled($("#fade .submit-login"));
                randomCode();
                console.log(data);
                if(data["status"]=="200"){
                    window.location.href="/foodweb/view/";
                }
                else
                {
                    alert(data["message"]);
                }
            }
        });
    }

    function sendCustomerToRegister(customer){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/foodweb/verify/post/i",
            data: customer,
            error: function () {
                alert("fail to connect");
                setBtnAbled($("#fade .submit-register"));
            },
            success: function (data) {
                setBtnAbled($("#fade .submit-register"));
                console.log(data);
                if (data["status"] == "200") {
                    window.location.href = "/foodweb/view/";
                }
                else {
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

    getCustomerMessage();

    function getCustomerMessage(){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/foodweb/customer/i",
            data:{action:"status"},
            error: function () {
                alert("fail to connect");
            },
            success: function (data) {
                console.log(data);
                if (data["status"] == "200") {
                    setNavHasCustomer(data["customer"]);
                }
                else {
                    setNavNoCustomer();
                }
            }
        });
    }


    $("[data-toggle='popover']").popover({
        html : true,
        delay:{show:100, hide:100},
        content: "<img src=\"/foodweb/static/images/web/二维码.jpg\" width=\"80px\" alt=\"分享\">"
    });

    $("#input-username,#input-password").blur(function () {
        let parent = $(this).parent();
        let feedBack = $(this).siblings(".form-control-feedback");
        let helpBlock = $(this).siblings(".help-block");
        let value = $(this).val();

        $(parent).removeClass("has-error");
        $(feedBack).removeClass("glyphicon-remove");
        $(parent).removeClass("has-success");
        $(feedBack).removeClass("glyphicon-ok");
        if(value.length == 0){
            $(parent).addClass("has-error");
            $(feedBack).addClass("glyphicon-remove");
            return false;
        }else{
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            return true;
        }
    });


    $("#register-username").blur(function() {
        let parent = $(this).parent();
        let feedBack = $(this).siblings(".form-control-feedback");
        let helpBlock = $(this).siblings(".help-block");
        let value = $(this).val();
        let reg = /^[\u4e00-\u9fa5A-Za-z0-9-_]{6,16}$/;

        $(parent).addClass("has-error");
        $(feedBack).addClass("glyphicon-remove");
        if(value.length == 0){
            $(helpBlock).text("用户名不能为空");
            return false;
        }else if(value.length<6 || value.length>15){
            $(helpBlock).text("用户名长度不符合规则");
            return false;
        }else if(!reg.test(value)) {
            $(helpBlock).text("用户名存在不合法字符");
            return false;
        }else{
            $(parent).removeClass("has-error");
            $(feedBack).removeClass("glyphicon-remove");
            $(parent).addClass("has-success");
            $(feedBack).addClass("glyphicon-ok");
            $(helpBlock).text("用户名合法");
            return true;
        }

    });

    $("#register-passowrd").blur(function() {
        let parent = $(this).parent();
        let feedBack = $(this).siblings(".form-control-feedback");
        let helpBlock = $(this).siblings(".help-block");
        let value = $(this).val();
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

    });

    $("#register-repassowrd").blur(function () {
        let parent = $(this).parent();
        let feedBack = $(this).siblings(".form-control-feedback");
        let helpBlock = $(this).siblings(".help-block");
        let value = $(this).val();
        let preValue = $("#register-passowrd").val();

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
    });

    $("#register-email").blur(function () {
        let parent = $(this).parent();
        let feedBack = $(this).siblings(".form-control-feedback");
        let helpBlock = $(this).siblings(".help-block");
        let reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        let value = $(this).val();

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
    });

});