package com.foodweb.dao;

import com.foodweb.domain.Good;
import com.foodweb.domain.Shoppingcar;
import com.foodweb.util.JdbcUtil;
import org.apache.commons.dbutils.handlers.*;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingcarDao {

    public static String add(Shoppingcar car, Connection conn) throws SQLException {
        String sql = "insert into shoppingcar (id,goodid,shopid,quantity,cusid) values (?,?,?,?,?) ";

        String uuid = JdbcUtil.getUUID();

        JdbcUtil.getQueryRunner().update(conn,sql,uuid,
                car.getGoodid(),
                car.getShopid(),
                car.getQuantity(),
                car.getCusid());

        return uuid;
    }

    public static void update(Shoppingcar car,Connection conn) throws SQLException {
        String sql = "update shoppingcar set quantity = ? where id = ? ";

        JdbcUtil.getQueryRunner().update(conn,sql,car.getQuantity(),car.getId());

    }

    public static void delete(String id,Connection conn) throws SQLException {
        String sql = "delete from shoppingcar where id = ? ";

        JdbcUtil.getQueryRunner().update(conn,sql,id);
    }

    public static void deleteAllOfCus(String cusid,Connection conn) throws SQLException {
        String sql = "delete from shoppingcar where cusid = ? ";

        JdbcUtil.getDataSourceQueryRunner().update(conn,sql,cusid);
    }

    public static List<Shoppingcar> getByChoose(String key,String value) throws SQLException {
        String sql = "select * from shoppingcar where "+key+" = ? ";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<Shoppingcar>(Shoppingcar.class),value);
    }

    public static Shoppingcar getGoodOfCus(String cusid,String goodid) throws SQLException {
        String sql = "select * from shoppingcar where cusid = ? and goodid = ? ";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanHandler<Shoppingcar>(Shoppingcar.class),cusid,goodid);
    }

    public static List<String> getAllShopInShoppingcarByCus(String cusid) throws SQLException {
        String sql = "select shopid from shoppingcar where cusid = ? group by shopid ";

        return JdbcUtil.getDataSourceQueryRunner().query(sql,new ColumnListHandler<String>(1), cusid);
    }

    public static List<Shoppingcar> getAllGoodOfShopAndCustomer (String shopid,String cusid) throws SQLException {
        String sql = "select * from shoppingcar where shopid = ? and cusid = ? ";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<>(Shoppingcar.class),shopid,cusid);
    }

    public static BigDecimal getGoodTotalPriceOfCustomer(String cusid) throws SQLException {
        String sql = "select sum((quantity*price)) from shoppingcar,good where good.id = shoppingcar.goodid and cusid = ? ";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new ScalarHandler<>(),cusid);
    }

}
