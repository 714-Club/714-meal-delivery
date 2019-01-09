package com.foodweb.dao;

import com.foodweb.domain.CusAddress;
import com.foodweb.util.JdbcUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CusAddressDao {
    public static String add(CusAddress cusAddress, Connection conn) throws SQLException {
        String sql = "insert into cus_address (id,cusid,address,phone,name) " +
                "values (?,?,?,?,?)";
        String uuid = JdbcUtil.getUUID();
        JdbcUtil.getQueryRunner().update(conn,sql,
                uuid,
                cusAddress.getCusid(),
                cusAddress.getAddress(),
                cusAddress.getPhone(),
                cusAddress.getName());
        return uuid;
    }
    public static void update(CusAddress cusAddress,Connection conn){

    }

    public static void delete(String id,Connection conn) throws SQLException {
        String sql = "delete from cus_address where id = ?";
        JdbcUtil.getQueryRunner().update(conn,sql,id);
    }

    public static List<CusAddress> getByCusId(String cusid) throws SQLException {
        String sql = "select * from cus_address where cusid = ? ";
        return JdbcUtil.getDataSourceQueryRunner().query(sql,new BeanListHandler<CusAddress>(CusAddress.class),cusid);
    }
}
