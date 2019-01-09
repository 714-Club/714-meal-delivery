package com.foodweb.util;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReturnUtil {

    public static void ToReturn(String status, String message, HttpServletRequest request) throws IOException {
        JSONObject jo = (JSONObject) request.getAttribute("jo");
        jo.put("status",status);
        jo.put("message",message);
    }
}
