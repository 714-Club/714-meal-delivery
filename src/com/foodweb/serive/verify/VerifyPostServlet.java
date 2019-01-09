package com.foodweb.serive.verify;

import com.alibaba.druid.support.spring.stat.annotation.Stat;
import com.foodweb.domain.Customer;
import com.foodweb.domain.Shop;
import com.foodweb.opm.CustomerOpm;
import com.foodweb.opm.ShopOpm;
import com.foodweb.serive.base.PostBaseServlet;
import com.foodweb.util.*;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "VerifyPostServlet",urlPatterns = "/verify/post/i")
public class VerifyPostServlet extends PostBaseServlet {
    public void CustomerRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");

//        String code = request.getParameter(Config.Code);
//        Object VerifyCode = request.getSession().getAttribute(Config.VerifyCode);
        Customer cus = new Customer();
        try {
            cus.setUsername(RequestUtil.getKeyParamater(request,Customer.UserName));
            cus.setEmail(RequestUtil.getKeyParamater(request,Customer.Email));
            cus.setPassword(RequestUtil.getKeyParamater(request,Customer.PassWord));
            cus.setFoodkey(0);

            CustomerOpm.addCustomer(cus);
            ReturnUtil.ToReturn(Status.Succeed,"注册成功",request);

        } catch (Exception e) {
            e.printStackTrace();
            ReturnUtil.ToReturn(Status.Fail,e.getMessage(),request);return;
        }

    }

    public void CustomerLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject jo = (JSONObject)request.getAttribute("jo");

        String code = request.getParameter(Config.Code);
        Object VerifyCode = request.getSession().getAttribute(Config.VerifyCode);

        if(code==null||VerifyCode==null||!code.toLowerCase().equals((String)VerifyCode)){
            ReturnUtil.ToReturn(Status.Fail, Message.ErrorCode,request);return;
        }

        String username = RequestUtil.getKeyParamater(request,Customer.UserName);
        String password = RequestUtil.getKeyParamater(request,Customer.PassWord);
        Customer customer = CustomerOpm.getCustomerByUserName(username);
        if(customer.getPassword().equals(password)){
            request.getSession().setAttribute(Config.LoginID,customer.getId());
            ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
        }
        else
        {
            ReturnUtil.ToReturn(Status.Fail,Message.Fail,request);
        }



    }

    public void ShopRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");

//        String code = request.getParameter(Config.Code);
//        Object VerifyCode = request.getSession().getAttribute(Config.VerifyCode);
        Customer cus = new Customer();
        try {
            cus.setUsername(RequestUtil.getKeyParamater(request,Customer.UserName));
            cus.setEmail(RequestUtil.getKeyParamater(request,Customer.Email));
            cus.setPassword(RequestUtil.getKeyParamater(request,Customer.PassWord));
            cus.setFoodkey(0);

            CustomerOpm.addCustomer(cus);
            ReturnUtil.ToReturn(Status.Succeed,"注册成功",request);

        } catch (Exception e) {
            e.printStackTrace();
            ReturnUtil.ToReturn(Status.Fail,e.getMessage(),request);return;
        }

    }

    public void ShopLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject jo = (JSONObject)request.getAttribute("jo");

        String code = request.getParameter(Config.Code);
        Object VerifyCode = request.getSession().getAttribute(Config.VerifyCode);

        if(code==null||VerifyCode==null||!code.toLowerCase().equals((String)VerifyCode)){
            ReturnUtil.ToReturn(Status.Fail, Message.ErrorCode,request);return;
        }
        String username = RequestUtil.getKeyParamater(request,Shop.UserName);
        String password = RequestUtil.getKeyParamater(request,Shop.PassWord);
        Shop shop = ShopOpm.getShopByUserName(username);
        if(shop==null||!shop.getPassword().equals(password))
        {
            ReturnUtil.ToReturn(Status.Fail,Message.Fail,request);
        }
        else
        {
            request.getSession().setAttribute(Config.ShopID,shop.getId());
            ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
        }
    }
}
