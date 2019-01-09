package com.foodweb.domain;

import java.util.Date;

public class Order {
    private String id;
    private String goodid;
    private String shopid;
    private int quantity;
    private int status;
    private double price;
    private Date createtime;
    private Date updatetime;

    public static final String Id = "id";
    public static final String GoodId = "goodid";
    public static final String ShopId = "shopid";
    public static final String Quantity = "quantity";
    public static final String Status = "status";
    public static final String Price = "price";
    public static final String CreateTime = "createtime";
    public static final String UpdateTime = "updatetime";

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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
