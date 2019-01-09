package com.foodweb.serive.shop;

import com.foodweb.dao.GoodDao;
import com.foodweb.domain.Good;
import com.foodweb.domain.Shop;
import com.foodweb.opm.GoodOpm;
import com.foodweb.serive.base.ShopLoginBaseServlet;
import com.foodweb.util.*;
import net.sf.json.JSONObject;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ShopServlet",urlPatterns = "/shop/i")
public class ShopServlet extends ShopLoginBaseServlet {
    public void addGood(HttpServletRequest request, HttpServletResponse response) throws Exception {

        JSONObject jo =(JSONObject) request.getAttribute("jo");
        Shop shop =(Shop) request.getAttribute(Config.Shop);


        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        upload.setHeaderEncoding("utf-8");
        List<FileItem> fileItemList = null;
        Good good = new Good();
        try {
            fileItemList = upload.parseRequest(new ServletRequestContext(request));
            //field 是text的name,string 是text 值
            good.setName(fileItemList.get(1).getString());
            good.setDirection(Integer.valueOf(fileItemList.get(2).getString()));
            good.setPrice(Double.valueOf(fileItemList.get(3).getString()));
            good.setStatus(1);
            good.setShopid(shop.getId());


            System.out.println(good.getName());
            good.setName(new String(good.getName().getBytes("iso-8859-1"),"utf-8"));


            if(GoodOpm.addGood(good,fileItemList.get(0),getServletContext()))
            {
                ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
            }
            else
            {
                ReturnUtil.ToReturn(Status.Fail,Message.Fail,request);
            }


        } catch (FileUploadException e) {
            e.printStackTrace();
            jo.put(Config.Message,"文件上传发生错误");
            jo.put(Config.Status,Status.RequestFail);
        } catch (Exception e) {
            e.printStackTrace();
            jo.put(Config.Message,"文件存储发生错误");
            jo.put(Config.Status,Status.ServerFail);
        }
    }

    public void updateGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void deleteGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Shop shop = (Shop) request.getAttribute(Config.Shop);
        String goodid = request.getParameter("goodid");

        try {
            if(GoodOpm.deleteGood(goodid,shop,getServletContext()))
            {
                ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);
            }
            else
            {
                ReturnUtil.ToReturn(Status.Fail,Message.Fail,request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            ReturnUtil.ToReturn(Status.Fail,Message.Fail,request);
        }

    }

    public static void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().removeAttribute(Config.ShopID);
        ReturnUtil.ToReturn(Status.Succeed,Message.Success,request);

    }
}
