$(function() {
    $(".content-info-right>div").hide();
    $(".content-info-right>div").eq(0).show("fast");
    $(".m-goods-list-form").hide();
    $(".m-order-details").hide();


    // 左边导航栏点击后样式变化.右边显示对应内容
    $(".content-info-left li").click(function() {
        var index = $(this).index();
        
        $(this).siblings().children("a").removeClass("m-active");
        $(this).children("a").addClass("m-active");  

        $(".content-info-right>div").hide();
        $(".content-info-right>div").eq(index).show("fast");

    });

    $("#nav-exit").click(function () {

        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/shop/i",
            data:{action:"exit"},
            error:function () {
                alert("fail to connect");
            },
            success:function (data) {
                console.log(data);
                if(data["status"]=="200"){
                    window.location.href="/foodweb/view/newShop"
                }
                else
                {
                    alert(data["message"]);
                }
            }})
        return false;
    });

    // 我的资料界面 点击修改
    $(".m-data-modify").click(function() {
        var element = $(this).parent().parent().find("input");
        element.removeAttr("readonly");
        element.removeClass("m-input-normal");
        element.focus();
    });

    // 我的资料界面 输入框失去焦点
    $("#m-data input").blur(function () { 
        $(this).attr("readonly","readonly");
        $(this).addClass("m-input-normal");
    });

    // 打开、关闭新增商品
    $("#m-goods .m-add-goods-btn").click(function () {
        $("#m-goods .m-add-goods .m-goods-list-form").slideToggle("fast");
    });

    // 打开 修改商品信息
    $("#m-goods .m-goods-list-modify").click(function() {
        $(this).parent().parent().siblings(".m-goods-list-form").show("fast");
    });

    // 关闭表单
    $("#m-goods .m-goods-close-btn").click(function() {
        $(this).parents(".m-goods-list-form").hide("fast");
    });

    // 打开、关闭详情
    $("#m-order .m-order-details-btn").click(function () { 
        $(this).siblings().filter(".m-order-details").slideToggle("fast");
    });

    //点击图片弹出文件框
    $(".img-presee").click(function () {
        $("#submit-image").click();
    });

    //显示缩略图
    $("#submit-image").change(function () {
        if (typeof (FileReader) != "undefined") {
            var dvPreview = $(".img-presee");
            var regex = /(.jpg|.jpeg|.gif|.png|.bmp)$/;
            $($(this)[0].files).each(function () {
                var file = $(this);
                if (regex.test(file[0].name.toLowerCase())) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        dvPreview.attr("src",e.target.result);
                    };
                    reader.readAsDataURL(file[0]);
                } else {
                    alert(file[0].name + " is not a valid image file.");
                    dvPreview.html("");
                    return false;
                }
            });
        } else {
            alert("This browser does not support HTML5 FileReader.");
        }
    });

    $(".m-goods-list .row .m-goods-list-delete").click(function () {
        let row = $(this).parents(".row");
        let id = $(row).attr("id");
        sendGoodTodelete(id,row);
    });

    function sendGoodTodelete(goodid,row) {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/shop/i",
            data:{action:"deleteGood",goodid:goodid},
            error:function () {
                alert("fail to connect");
            },
            success:function (data) {
                console.log(data);
                if(data["status"]=="200"){
                    $(row).remove();
                }
                else
                {
                    alert(data["message"]);
                }
            }

        })
    }

});