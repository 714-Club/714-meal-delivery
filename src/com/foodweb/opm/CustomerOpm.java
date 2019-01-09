package com.foodweb.opm;

import com.foodweb.dao.CustomerDao;
import com.foodweb.domain.Customer;
import com.foodweb.util.JdbcUtil;

import java.sql.Connection;
import java.sql.SQLException;

public class CustomerOpm {
    public static String addCustomer(Customer cus) throws SQLException {
        Connection conn = JdbcUtil.getConnection();
        String uuid = CustomerDao.add(cus,conn );
        conn.close();
        return uuid;
    }

    public static Customer getCustomerById(String id) throws SQLException {
        return CustomerDao.get(Customer.Id,id);
    }

    public static Customer getCustomerByUserName(String username) throws SQLException {
        return CustomerDao.get(Customer.UserName,username);
    }
}
