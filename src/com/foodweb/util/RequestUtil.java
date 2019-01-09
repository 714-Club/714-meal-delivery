package com.foodweb.util;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {
    public  String getParamater(HttpServletRequest request, String key) throws Exception {
        String value = request.getParameter(key);
        if(value==null)
        {
            throw new Exception(Message.ILLegalParameter);
        }
        return value;
    }

    //获取一个参数，为空报错
    public static String getKeyParamater(HttpServletRequest request, String key) throws Exception {
        return new RequestUtil().getParamater(request,key);
    }

    //获取一个参数，为空返回Null；
    public static String getPapamater(HttpServletRequest request,String key){
        try {
            return  new RequestUtil().getParamater(request,key);
        } catch (Exception e) {
            return null;
        }
    }

    public static Object getAttribute(HttpServletRequest request,String key){
        return request.getSession().getAttribute(key);
    }
}
