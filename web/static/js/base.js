$(document).ready(function () {

    $(".content-foodlist .row>li .food-price>a").click(function () {

        let goodid = $(this).attr("goodid");
        let shopid = $(this).attr("shopid");
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/customer/i",
            data:{action:"addGoodInShop",goodid:goodid,shopid:shopid,quantity:1},
            error:function () {
                alert("fail to connect");
            },
            success:function (data) {
                console.log(data);
                if(data["status"]=="200"){
                    $("#shoppingcar").click();
                    alert("成功添加到购物车！");
                }
                else
                {
                    alert(data["message"]);
                }
            }
        });

        return false;
    });

    $("#direction-list>li>a").each(function (i,e) {
        let direction = i;
        if(direction==0) direction=10;
        if(direction==5) direction=0;
        $(e).attr("direction",direction);

        $(e).click(function () {

            let d = $(this).attr("direction");
            $("#direction-list>li>a").removeClass("food-sort-active");
            $(this).addClass("food-sort-active");
            if(d==10)
            {
                console.log(d);
                $(".content-foodlist ul>li").show();
            }
            else
            {
                $(".content-foodlist ul>li").each(function (i,e) {
                    if($(e).attr("direction")==d)
                    {
                        $(e).show();
                    }
                    else
                    {
                        $(e).hide();
                    }

                })
            }


            return false;
        });

    });



});