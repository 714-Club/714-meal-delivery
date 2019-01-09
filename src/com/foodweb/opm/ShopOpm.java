package com.foodweb.opm;

import com.foodweb.dao.ShopDao;
import com.foodweb.domain.Shop;
import com.foodweb.util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class ShopOpm {
    public static Shop getShopByShopName(String shopname) throws SQLException {
        return ShopDao.get(Shop.Name,shopname);
    }

    public static Shop getShopById(String id) throws SQLException {
        return ShopDao.get(Shop.Id,id);
    }

    public static List<Shop> getAllOpenShop() throws SQLException {

        List<Shop>list = ShopDao.getAll();

        for (Shop s:list)
        {
            if(s.getStatus()==0)
            {
                list.remove(s);
            }
        }

        return list;
    }

    public static Shop getShopByUserName(String username) throws SQLException {
        return ShopDao.get(Shop.UserName,username);
    }
}
