package com.foodweb.dao;

import com.foodweb.domain.Good;
import com.foodweb.util.JdbcUtil;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class GoodDao {

    public static String add(Good good, Connection conn) throws SQLException {
        String sql = "insert into good (id,shopid,name,direction,image,price,status) " +
                "values(?,?,?,?,?,?,?)";
        String uuid = JdbcUtil.getUUID();
        JdbcUtil.getQueryRunner().update(conn,sql,
                uuid,
                good.getShopid(),
                good.getName(),
                good.getDirection(),
                good.getImage(),
                good.getPrice(),
                good.getStatus());
        return uuid;
    }
    public static void update(Good good,Connection conn) throws SQLException {
        String sql = "update good set name = ? ," +
                "direction = ? ," +
                "price = ?," +
                "image = ?, " +
                "status = ? where id = ?";
        JdbcUtil.getQueryRunner().update(conn,sql,good.getName(),
                good.getDirection(),
                good.getPrice(),
                good.getImage(),
                good.getStatus(),
                good.getId());
    }

    public static void delete(String id,Connection conn) throws SQLException {

        String str = "delete from good where id = ?";
        JdbcUtil.getQueryRunner().update(conn,str,id);

    }

    public static Good get(String key,String value) throws SQLException {
        String sql = "select * from good where "+key +" = ?";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanHandler<Good>(Good.class),value);
    }

    public static List<Good> getAll() throws SQLException {
        String sql = "select * from good";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<Good>(Good.class));
    }

    public static List<Good> getAllGoodByShop(String shopId) throws SQLException {
        String sql = "select * from good where shopid = ?";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<Good>(Good.class),shopId);
    }
}
