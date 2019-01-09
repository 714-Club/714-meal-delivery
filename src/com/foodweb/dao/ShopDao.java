package com.foodweb.dao;

import com.foodweb.domain.Shop;
import com.foodweb.util.JdbcUtil;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class ShopDao {

    public static String add(Shop shop,Connection conn) throws SQLException {
        String sql = "insert into customer (id,name,phone,email,motto,address,image,status,username,password,createtime,updatetime) " +
                "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        String uuid = JdbcUtil.getUUID();
        Timestamp tm = new Timestamp(new Date().getTime());
        JdbcUtil.getQueryRunner().update(conn,sql,
                uuid,
                shop.getName(),
                shop.getPhone(),
                shop.getEmail(),
                shop.getMotto(),
                shop.getAddress(),
                shop.getImage(),
                0,
                shop.getUsername(),
                shop.getPassword(),
                tm,
                tm);
        return uuid;
    }

    public static void delete(String id,Connection conn) throws SQLException {
        String sql = "delete from shop where id = ?";
        JdbcUtil.getQueryRunner().update(conn,sql,id);
    }

    public static void update(Shop shop,Connection conn) throws SQLException {
        String sql = "update shop set name = ? ," +
                "phone = ? ," +
                "email = ? ," +
                "motto = ? ," +
                "address = ? ," +
                "image = ? ," +
                "status = ? ," +
                "updatetime = ? where id = ?";
        Timestamp tm = new Timestamp(new Date().getTime());
        JdbcUtil.getQueryRunner().update(conn,sql,
                shop.getName(),
                shop.getPhone(),
                shop.getEmail(),
                shop.getMotto(),
                shop.getAddress(),
                shop.getImage(),
                shop.getStatus(),shop.getId(),tm
                );
    }

    public static Shop get(String key,String value) throws SQLException {
        String sql = "select * from shop where " + key + " = ?";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanHandler<Shop>(Shop.class),value);
    }

    public static List<Shop> getAll() throws SQLException {
        String sql = "select * from shop";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<Shop>(Shop.class));
    }

}
