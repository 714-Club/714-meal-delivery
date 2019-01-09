package com.foodweb.serive.base;

import com.foodweb.dao.ShopDao;
import com.foodweb.domain.Customer;
import com.foodweb.domain.Shop;
import com.foodweb.opm.CustomerOpm;
import com.foodweb.opm.ShopOpm;
import com.foodweb.util.Config;
import com.foodweb.util.Message;
import com.foodweb.util.ReturnUtil;
import com.foodweb.util.Status;
import net.sf.json.JSONObject;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;

@WebServlet(name = "ShopLoginBaseServlet")
public class ShopLoginBaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        JSONObject jo = new JSONObject();
        request.setAttribute("jo",jo);
        HttpSession session = request.getSession();
        Object shopId = session.getAttribute(Config.ShopID);
        String action = request.getParameter(Config.Action);
        if(shopId==null||action=="") {
            jo.put(Config.Status, Status.Fail);
            jo.put(Config.Message, Message.Fail);
        }
        else
        {
            try{
                Shop shop = ShopOpm.getShopById((String)shopId);
                request.setAttribute(Config.Shop,shop);

                Class clazz = this.getClass();
                Method method = clazz.getMethod(action,HttpServletRequest.class,HttpServletResponse.class);

                if(method!=null)
                {
                    method.invoke(this,request,response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                ReturnUtil.ToReturn(Status.Fail,Message.ErrorSql,request);
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
                jo.put(Config.Status,Status.RequestFail);
                jo.put("message","没有找到该方法");
            } catch (Exception e) {
                e.printStackTrace();
                ReturnUtil.ToReturn(Status.ServerFail, Message.Fail,request);
            }
        }

        response.getWriter().write(jo.toString());
    }
}
