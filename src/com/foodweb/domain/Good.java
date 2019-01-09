package com.foodweb.domain;

import net.sf.json.JSONObject;

public class Good {
    private String id;
    private String shopid;
    private String name;
    private int direction;
    private String image;
    private double price;
    private int status;

    public static final String Id = "id";
    public static final String ShopId = "shopid";
    public static final String Name = "name";
    public static final String Direction = "direction";
    public static final String Image = "image";
    public static final String Price = "price";
    public static final String Status = "status";

    public Good(){}
    public Good(Good good){
        setId(good.getId());
        setShopid(good.getShopid());
        setDirection(good.getDirection());
        setImage(good.getImage());
        setStatus(good.getStatus());
        setPrice(good.getPrice());
        setName(good.getName());
    }

    public JSONObject toJson(){
        JSONObject jo = new JSONObject();
        jo.put(Good.Id,id);
        jo.put(Good.ShopId,shopid);
        jo.put(Good.Name,name);
        jo.put(Good.Direction,direction);
        jo.put(Good.Image,image);
        jo.put(Good.Price,price);
        jo.put(Good.Status,status);
        return jo;
    }


    public String getId() {
        return id;
    }

    public static String getShopId() {
        return ShopId;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDirection() {
        return direction;
    }

    public void setDirection(int direction) {
        this.direction = direction;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
