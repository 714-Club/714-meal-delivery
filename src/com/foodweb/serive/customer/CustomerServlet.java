package com.foodweb.serive.customer;

import com.foodweb.dao.CusAddressDao;
import com.foodweb.domain.CusAddress;
import com.foodweb.domain.Customer;
import com.foodweb.domain.Shop;
import com.foodweb.domain.Shoppingcar;
import com.foodweb.dto.ShoppingcarInfo;
import com.foodweb.opm.ShoppingcarOpm;
import com.foodweb.serive.base.LoginBaseServlet;
import com.foodweb.util.*;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer/i")
public class CustomerServlet extends LoginBaseServlet {
    public void status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jo = (JSONObject)request.getAttribute("jo");
        Customer cus = (Customer)request.getAttribute(Config.Customer);

        ReturnUtil.ToReturn(Status.Succeed, Message.SuccessGet,request);
        jo.put("customer",cus.toJson());
    }

    public void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jo = (JSONObject)request.getAttribute("jo");

        request.getSession().removeAttribute(Config.LoginID);
        ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
    }

    public void addAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jo = (JSONObject)request.getAttribute("jo");
        Customer cus = (Customer)request.getAttribute(Config.Customer);
        CusAddress cusAddress = new CusAddress();

            cusAddress.setCusid(cus.getId());
        try {
            cusAddress.setAddress(RequestUtil.getKeyParamater(request,CusAddress.Address));
            cusAddress.setPhone(RequestUtil.getKeyParamater(request,CusAddress.Phone));
            cusAddress.setName(RequestUtil.getKeyParamater(request,CusAddress.Name));
            CusAddressDao.add(cusAddress,JdbcUtil.getConnection());
        } catch (Exception e) {
            e.printStackTrace();
        }
        ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
    }

    public void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        JSONObject jo = (JSONObject)request.getAttribute("jo");

        String cusAddressId = request.getParameter("CusAddressId");
        if(cusAddressId==null){
            ReturnUtil.ToReturn(Status.Fail,Message.ILLegalParameter,request);return;
        }
        CusAddressDao.delete(cusAddressId,JdbcUtil.getConnection());
        ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
    }

    //添加商品到购物车
    public void addGoodInShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        JSONObject jo = (JSONObject) request.getAttribute("jo");
        Customer cus = (Customer) request.getAttribute(Config.Customer);

        Shoppingcar car = new Shoppingcar();

        try {
            car.setGoodid(RequestUtil.getKeyParamater(request,Shoppingcar.GoodId));
            car.setQuantity(Integer.valueOf(RequestUtil.getKeyParamater(request, Shoppingcar.Quantity)));
            car.setShopid(RequestUtil.getKeyParamater(request,Shoppingcar.ShopId));
            car.setCusid(cus.getId());

            ShoppingcarOpm.addGood(car);

            ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);

        } catch (Exception e) {
            e.printStackTrace();
            ReturnUtil.ToReturn(Status.Fail,Message.ILLegalParameter,request);
        }

    }

    public void deleteGoodInShopCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");
        Customer cus = (Customer) request.getAttribute(Config.Customer);

        String carid = request.getParameter("carid");
        if(carid==null){
            ReturnUtil.ToReturn(Status.Fail,Message.ILLegalParameter,request);return;
        }
            ShoppingcarOpm.deleteGood(carid);
            ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);

    }

    public void updateShoppingCarQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");
        Customer cus = (Customer) request.getAttribute(Config.Customer);

        String carid = request.getParameter("carid");
        String quantity = request.getParameter("quantity");

        if(carid==null||quantity==null)
        {
            ReturnUtil.ToReturn(Status.Fail,Message.ILLegalParameter,request);return;
        }

        Shoppingcar car = new Shoppingcar();

        car.setId(carid);
        car.setQuantity(Integer.valueOf(quantity));

        ShoppingcarOpm.updateGood(car);

        ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);

    }

    public static void getGoodTotalPriceOfCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");
        Customer cus = (Customer) request.getAttribute(Config.Customer);


        jo.put("TotalPrice",ShoppingcarOpm.getGoodTotalPriceOfCustomer(cus.getId()));
        jo.put(Config.Status,Status.Succeed);
        jo.put(Config.Message,Message.Success);

    }





}
