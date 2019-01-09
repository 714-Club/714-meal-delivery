package com.foodweb.view;

import com.foodweb.dao.CusAddressDao;
import com.foodweb.opm.CustomerOpm;
import com.foodweb.opm.ShoppingcarOpm;
import com.foodweb.util.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CustomerView",urlPatterns = "/view/customer")
public class CustomerView extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Object loginId = request.getSession().getAttribute(Config.LoginID);

        if(loginId==null)
        {
            response.sendRedirect("/index.jsp");
        }
        else
        {
            String index = request.getParameter("i");
            if(index==null)index = "0";
            try {
                request.setAttribute("addressList", CusAddressDao.getByCusId((String)loginId));
                request.setAttribute("customer", CustomerOpm.getCustomerById((String)loginId));
                request.setAttribute("shopcarList",ShoppingcarOpm.getAllShopCarOfCustomer((String)loginId));
                request.setAttribute("index",index);
                request.getRequestDispatcher("/WEB-INF/customer.jsp").forward(request,response);


            } catch (SQLException e) {
                e.printStackTrace();
            }

        }




    }
}
