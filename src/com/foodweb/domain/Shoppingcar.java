package com.foodweb.domain;

public class Shoppingcar {

    private String id;
    private String goodid;
    private String shopid;
    private int quantity;
    private String cusid;

    public Shoppingcar(){}
    public Shoppingcar(Shoppingcar car){
        this.setId(car.getId());
        this.setGoodid(car.getGoodid());
        this.setShopid(car.getShopid());
        this.setQuantity(car.getQuantity());
        this.setCusid(car.getCusid());
    }
    public String getCusid() {
        return cusid;
    }

    public void setCusid(String cusid) {
        this.cusid = cusid;
    }



    public static final String Id = "id";
    public static final String GoodId = "goodid";
    public static final String ShopId = "shopid";
    public static final String Quantity = "quantity";
    public static final String CusId = "cusid";


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodid() {
        return goodid;
    }

    public void setGoodid(String goodid) {
        this.goodid = goodid;
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
