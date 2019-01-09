package com.foodweb.dto;

import com.foodweb.domain.Good;
import com.foodweb.domain.Shoppingcar;

public class ShoppingcarInfo extends Shoppingcar {

    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }

    private Good good;

    public ShoppingcarInfo(){}
    public ShoppingcarInfo(Shoppingcar car){
        super(car);
    }
    public ShoppingcarInfo(Shoppingcar car,Good good){
        super(car);
        this.setGood(good);
    }
}
