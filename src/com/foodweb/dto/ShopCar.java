package com.foodweb.dto;

import com.foodweb.domain.Good;
import com.foodweb.domain.Shop;
import com.foodweb.domain.Shoppingcar;

import java.util.List;

public class ShopCar {

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    private Shop shop;

    public List<Shoppingcar> getGoodList() {
        return goodList;
    }

    public void setGoodList(List<Shoppingcar> goodList) {
        this.goodList = goodList;
    }

    private List<Shoppingcar> goodList;

}
