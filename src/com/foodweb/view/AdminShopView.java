package com.foodweb.view;

import com.foodweb.domain.Good;
import com.foodweb.domain.Shop;
import com.foodweb.opm.GoodOpm;
import com.foodweb.opm.ShopOpm;
import com.foodweb.util.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminShopView",urlPatterns = "/view/newShop")
public class AdminShopView extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Object shopId = session.getAttribute(Config.ShopID);

        if(shopId==null)
        {
            request.getRequestDispatcher("/WEB-INF/new_shop.jsp").forward(request,response);
        }
        else
        {
            try {
                Shop shop = ShopOpm.getShopById((String) shopId);
                request.setAttribute("shop",shop);
                List<Good>list = GoodOpm.getAllGoodByShop(shop.getId());
                request.setAttribute("goodList",list );
                request.getRequestDispatcher("/WEB-INF/shop_backstage.jsp").forward(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }
}
