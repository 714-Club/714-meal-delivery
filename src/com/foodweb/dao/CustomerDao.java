package com.foodweb.dao;

import com.foodweb.domain.Customer;
import com.foodweb.util.JdbcUtil;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CustomerDao {
    public static String add(Customer customer,Connection conn) throws SQLException {
        String sql = "insert into customer (id,username,password,email,foodkey) " +
                "values (?,?,?,?,?)";
        String uuid = JdbcUtil.getUUID();
        JdbcUtil.getQueryRunner().update(conn,sql,
                uuid,
                customer.getUsername(),
                customer.getPassword(),
                customer.getEmail(),
                customer.getFoodkey());
        return uuid;
    }
    public static void delete(String id,Connection conn) throws SQLException {
        String sql = "delete from customer where id = ?";
        JdbcUtil.getQueryRunner().update(conn,sql,id);
    }
    public static void update(Customer customer,Connection conn) throws SQLException {
        String sql = "update customer set password = ? ," +
                "email = ? ," +
                "foodkey = ? where id = ?";
        String uuid = JdbcUtil.getUUID();
        JdbcUtil.getQueryRunner().update(conn,sql,
                customer.getPassword(),
                customer.getEmail(),
                customer.getFoodkey(),
                customer.getId());
    }
    public static Customer get(String key,String value) throws SQLException {
        String sql = "select * from customer where "+key +" = ?";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanHandler<Customer>(Customer.class),value);
    }
    public static List<Customer> getAll() throws SQLException {
        String sql = "select * from customer";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<Customer>(Customer.class));
    }

}
