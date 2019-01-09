$(function(){
    changeIndex(0);
    $(".m-order-details").hide();
    $(".m-address-item>form").hide();
    $("#m-address>form").hide();


    //根据index选择对应的内容
    function changeIndex(index) {
        let a = $(".content-info-left li").children("a");
        let div = $(".content-info-right>div");

        a.removeClass("m-active");
        a.eq(index).addClass("m-active");
        div.hide();
        div.eq(index).show("fast");
    }

    let index = $("#choose-list").attr("index");
    changeIndex(index);

    // 左边导航栏点击后样式变化.右边显示对应内容
    $(".content-info-left li").click(function() {
        changeIndex($(this).index());
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

    // 打开/关闭修改地址内容
    $(".m-address-modify").click(function () {
        $(".m-address-item>form").hide();
        $(".m-address-modify,.m-address-delete").show();
        $(this).hide();
        $(this).siblings(".m-address-delete").hide();
        $(this).parent().siblings("form").show("fast");

        var el = $(this).parent().siblings("span");
        var input = $(this).parent().siblings("form").find("input");
        for (let index = 0; index < el.length; index++) {                     
            input.eq(index).val(el.eq(index).text());
        }
        
    });

    //打开/关闭添加地址
    $("#m-address>button").click(function () {
        $("#m-address>form").toggle();
    });

    // 打开、关闭详情
    $("#m-order .m-order-details-btn").click(function () {
        $(this).siblings().filter(".m-order-details").slideToggle("fast");
    });
    
    $("#m-address-comfirm").click(function(){
        
        let phone  = $("#m-address-phone").val();
        let address = $("#m-address-address").val();
        let name = $("#m-address-username").val();

        if(name==null||phone==null||address==null)
        {
            alert("信息不完整");
            return;
        }
        sendToAddAddress({action:"addAddress",phone:phone,name:name,address:address},this);
        return false;
    });

    function sendToAddAddress(address,btn){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/customer/i",
            data:address,
            error:function(){
                alert("fail to connect");
            },
            success:function(data){
                console.log(data);

                if(data["status"]=="200"){
                    alert("添加地址成功");
                }
                else
                {

                }
            }
        })
    }

    $(".cart-delete").click(function () {
        let parent = $(this).parents("table");
        let selectCheckBox= parent.find("input:checkbox:checked");
        let checkBox =  parent.find("input:checkbox");


        $(selectCheckBox).each(function () {

            let tr = $(this).parents("tr");
            let carid = $(tr).attr("carid");
            console.log(carid);

            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/foodweb/customer/i",
                data:{action:"deleteGoodInShopCar",carid:carid},
                error:function(){
                    alert("fail to connect");
                },
                success:function(data){
                    console.log(data);

                    tr.remove();

                }
            })

        });

    });

    $("#m-shoppingcart table .quantity>input").change(function () {
        let carid = $(this).parents("tr").attr("carid");
        let quantity = $(this).val();
        console.log(quantity)

        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/customer/i",
            data:{action:"updateShoppingCarQuantity",carid:carid,quantity:quantity},
            error:function(){
                alert("fail to connect");
            },
            success:function(data){
                console.log(data);
            }
        })

    })



});
