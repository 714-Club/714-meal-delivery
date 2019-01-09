package com.foodweb.util;

import java.io.FileInputStream;
import java.util.Properties;

public class PropertiesUitl {

    public static String getWebName(){
        return "/foodweb/";
    }

    public static Properties getProperties(String path) throws Exception {

        String realPath = PropertiesUitl.class.getClassLoader().getResource(path).getPath();
        FileInputStream in = new FileInputStream(realPath);

        Properties p = new Properties();

        p.load(in);
        return p;
    }

    public static Properties getWebProperties() throws Exception {
        String realPath= PropertiesUitl.class.getClassLoader().getResource("web.properties").getPath();
        FileInputStream in = new FileInputStream(realPath);
        Properties p = new Properties();
        p.load(in);
        return p;
    }

    public static String getWebUrl() throws Exception {
       Properties p = PropertiesUitl.getWebProperties();
        return  p.getProperty("domainname")+":"+p.getProperty("port")+"/"+p.getProperty("project")+"/";
    }

    public static String getHeadImagePath() throws Exception {
        Properties p = PropertiesUitl.getWebProperties();
        return  p.getProperty("headImage");
    }

    public static String getCarouselPath() throws Exception {
        Properties p = PropertiesUitl.getWebProperties();
        return p.getProperty("carousel");
    }

    public static String getGoodPath() throws Exception {
        Properties p = PropertiesUitl.getWebProperties();
        return p.getProperty("good");
    }

    public static String getShopPath() throws Exception{
        Properties p = PropertiesUitl.getWebProperties();
        return p.getProperty("shop");
    }

}
