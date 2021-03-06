package com.foodweb.serive.base;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "ServiceBaseServlet")
public class ServiceBaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
//        HeaderUitl.setHeaderAccess(request,response);
        String action = request.getParameter("action");
        if(action==null) return;
        try {

            Class clazz = this.getClass();
            Method method = clazz.getMethod(action,HttpServletRequest.class,HttpServletResponse.class);

            if(method!=null) {
                method.invoke(this, request, response);
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
