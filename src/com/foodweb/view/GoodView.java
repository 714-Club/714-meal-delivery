package com.foodweb.view;

import com.foodweb.domain.Shop;
import com.foodweb.opm.GoodOpm;
import com.foodweb.opm.ShopOpm;
import com.foodweb.util.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "GoodView",urlPatterns = "/view/goods")
public class GoodView extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            String shopid = request.getParameter(Shop.Id);
            Shop shop = ShopOpm.getShopById(shopid);

            if(shopid==null||shop==null)
            {
                request.getRequestDispatcher("/WEB-INF/shop.jsp").forward(request,response);
            }
            else
            {
                request.setAttribute("shop", shop);
                request.setAttribute("goodList", GoodOpm.getAllOpenGoodByShop(shopid));
                request.getRequestDispatcher("/WEB-INF/good.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
