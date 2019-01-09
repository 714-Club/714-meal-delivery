$(document).ready(function () {

    $("#shoppingcar").click(function () {

        updateShoppingcar();

    });

    updateShoppingcar();

    function updateShoppingcar() {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:"/foodweb/customer/i",
            data:{action:"getGoodTotalPriceOfCustomer"},
            error:function () {
                alert("fail to connect");
            },
            success:function (data) {
                console.log(data);
                if(data["status"]=="200"){
                    $("#shoppingcar-price").text(data["TotalPrice"]);
                }
                else
                {
                    $("#shoppingcar-price").text("0");
                }
            }
        })
    }


})