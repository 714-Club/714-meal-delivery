package com.foodweb.serive.verify;

import com.foodweb.domain.Customer;
import com.foodweb.domain.Shop;
import com.foodweb.dto.VerifyCode;
import com.foodweb.opm.CustomerOpm;
import com.foodweb.opm.ShopOpm;
import com.foodweb.serive.base.ServiceBaseServlet;
import com.foodweb.util.Config;
import com.foodweb.util.GraphicHelper;
import com.foodweb.util.JdbcUtil;
import com.foodweb.util.Status;
import net.sf.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "VerifyServlet",urlPatterns = "/verify/i")
public class VerifyServlet extends ServiceBaseServlet {
    public void sendMailToRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        response.setContentType("application/json;charset=utf-8");
//        JSONObject jo = new JSONObject();
//        HttpSession session = request.getSession();
//        //需要发送的邮箱地址
//        String email = request.getParameter("email");
//        if(email==null) return;
//        long nowtime = new Date().getTime()/1000;
//        Object mailtime = session.getAttribute(Config.MailTimes);
//        if((mailtime==null||nowtime-(long)mailtime>=60))
//        {
//                try {
//                    if(VerifyOpm.sendMailToRegister(email,getServletContext(),session))
//                    {
//                        jo.put(Config.Status, Status.Succeed);
//                        jo.put(Config.Message,"邮件发送成功");
//                        jo.put("wait",60);
//                    }
//                    else
//                    {
//                        jo.put(Config.Status,Status.Fail);
//                        jo.put(Config.Message,"邮箱已存在");
//                        jo.put("wait",-1);
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                    jo.put(Config.Status,Status.ServerFail);
//                    jo.put(Config.Message,"服务器发生错误");
//                    jo.put("wait",-1);
//                }
//        }
//        else
//        {
//            jo.put(Config.Status,Status.Fail);
//            jo.put(Config.Message,"邮件发送失败");
//            jo.put("wait",60-(nowtime-(long)mailtime));
//        }

//        response.getWriter().write(jo.toString());
    }

    public void getCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        String p_width = request.getParameter("width");
        String p_height = request.getParameter("height");
        int width = 180;
        int height = 40;
        if(p_width!=null) width = Integer.valueOf(p_width);
        if(p_height!=null) height = Integer.valueOf(p_height);

        final String imgType = "jpeg"; // 指定图片格式 (不是指MIME类型)

        final OutputStream output = response.getOutputStream();

        //获得一个随机的验证码
        VerifyCode vcode = GraphicHelper.randRomVerifyCode(width,height);

        try {
            ImageIO.write(vcode.getImage(), imgType, output);
            session.setAttribute(Config.VerifyCode,vcode.getCode().toLowerCase());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void username(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("application/json;charset=utf-8");
        JSONObject jo = new JSONObject();
        String username = request.getParameter("username");
        if(username==null) return;

        Customer cus = CustomerOpm.getCustomerByUserName(username);
        if(cus==null){
            jo.put(Config.Status,Status.Succeed);
            jo.put(Config.Message,"可以使用");
        }
        else
        {
            jo.put(Config.Status,Status.Fail);
            jo.put(Config.Message,"已存在");
        }
        response.getWriter().write(jo.toString());
    }

    public void shopname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("application/json;charset=utf-8");
        JSONObject jo = new JSONObject();
        String shopname = request.getParameter("shopname");
        if(shopname==null) return;

        Shop shop = ShopOpm.getShopByShopName(shopname);

        if(shop==null){
            jo.put(Config.Status,Status.Succeed);
            jo.put(Config.Message,"可以使用");
        }
        else
        {
            jo.put(Config.Status,Status.Fail);
            jo.put(Config.Message,"已存在");
        }
        response.getWriter().write(jo.toString());
    }

    public void uuid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.getWriter().write(JdbcUtil.getUUID());
    }
}
