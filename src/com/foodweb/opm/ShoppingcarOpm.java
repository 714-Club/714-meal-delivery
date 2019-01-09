package com.foodweb.opm;

import com.foodweb.dao.GoodDao;
import com.foodweb.dao.ShoppingcarDao;
import com.foodweb.domain.Customer;
import com.foodweb.domain.Good;
import com.foodweb.domain.Shoppingcar;
import com.foodweb.dto.ShopCar;
import com.foodweb.dto.ShoppingcarInfo;
import com.foodweb.util.JdbcUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingcarOpm {

    public static void addGood(Shoppingcar car) throws SQLException {

        Shoppingcar tempCar = ShoppingcarDao.getGoodOfCus(car.getCusid(),car.getGoodid());
        Connection conn = JdbcUtil.getConnection();
        if(tempCar==null)
        {

            ShoppingcarDao.add(car,conn);
        }
        else
        {
            tempCar.setQuantity(tempCar.getQuantity()+car.getQuantity());
            ShoppingcarDao.update(tempCar,conn);
        }
        conn.close();
    }

    public static void deleteGood(String id) throws SQLException {
        Connection conn = JdbcUtil.getConnection();

        ShoppingcarDao.delete(id,conn);

        conn.close();
    }

    public static void updateGood(Shoppingcar car) throws SQLException {
        Connection conn = JdbcUtil.getConnection();

        ShoppingcarDao.update(car,conn);
        conn.close();
    }


    public static List<ShopCar> getAllShopCarOfCustomer(String cusid) throws SQLException {

        List<String> shoplist = ShoppingcarDao.getAllShopInShoppingcarByCus(cusid);


        List<ShopCar> shopcarList = new ArrayList<>();



        for(String shopid : shoplist)
        {
            ShopCar car = new ShopCar();
            car.setShop(ShopOpm.getShopById(shopid));
            car.setGoodList(ShoppingcarOpm.getShoppingCarByShopAndCustomer(shopid,cusid));
            shopcarList.add(car);
        }
        return shopcarList;
    }

    public static List<Shoppingcar> getShoppingCarByShopAndCustomer(String shopid,String cusid) throws SQLException {

        List<Shoppingcar> carlist = ShoppingcarDao.getAllGoodOfShopAndCustomer(shopid,cusid);

        List<Shoppingcar> goodcarList = new ArrayList<>();

        for(Shoppingcar car:carlist){

            goodcarList.add(new ShoppingcarInfo(car, GoodDao.get(Good.Id,car.getGoodid())));

        }
        return goodcarList;
    }

    public static BigDecimal getGoodTotalPriceOfCustomer(String cusid) throws SQLException {

        return ShoppingcarDao.getGoodTotalPriceOfCustomer(cusid);

    }

}
