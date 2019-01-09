package com.foodweb.opm;

import com.foodweb.dao.GoodDao;
import com.foodweb.domain.Good;
import com.foodweb.domain.Shop;
import com.foodweb.dto.GoodInfo;
import com.foodweb.util.FileUitl;
import com.foodweb.util.JdbcUtil;
import com.foodweb.util.PropertiesUitl;
import org.apache.tomcat.util.http.fileupload.FileItem;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class GoodOpm {

    public static List<Good> getAllOpenGoodByShop(String shopId) throws SQLException {
        List<Good> list =GoodDao.getAllGoodByShop(shopId);

        for(Good good : list){
            if(good.getStatus()==0)
            {
                list.remove(good);
            }
        }
        return list;
    }

    public static List<Good> getAllGoodByShop(String shopId) throws SQLException {
        List<Good> temp =GoodDao.getAllGoodByShop(shopId);

        List<Good> list = new ArrayList<>();

        for(Good good : temp){
            list.add(new GoodInfo(good));
        }
        return list;
    }

    public static boolean addGood(Good good, FileItem item, ServletContext context) throws SQLException{
        Connection connection = JdbcUtil.getConnection();
        connection.setAutoCommit(false);
        try {
            InputStream in = item.getInputStream();
            good.setImage("#");
            String id = GoodDao.add(good,connection);
            String Name = item.getName();
            String suffixname = Name.substring(Name.lastIndexOf("."));
            String fileName = id +suffixname;

            String saveDir = context.getRealPath(PropertiesUitl.getGoodPath());

            String url = PropertiesUitl.getWebName()+PropertiesUitl.getGoodPath()+fileName;

            FileUitl.saveFile(saveDir+fileName,in);

            good.setImage(url);
            good.setId(id);
            GoodDao.update(good,connection);
            connection.commit();
        } catch (Exception e) {
            connection.rollback();
            return false;
        }finally {
            connection.close();
        }
        return  true;
    }

    public static boolean deleteGood(String goodid, Shop shop,ServletContext context) throws SQLException {

        Good good = GoodDao.get(Good.Id,goodid);
        Connection conn = JdbcUtil.getConnection();
        if(!good.getShopid().equals(shop.getId())) return false;

        String suifxing = good.getImage().substring(good.getImage().lastIndexOf("/"));
        try {
            FileUitl.delFile(context.getRealPath(PropertiesUitl.getGoodPath()),suifxing);

            GoodDao.delete(goodid,conn);

        } catch (Exception e) {
            e.printStackTrace();
            conn.close();
            return  false;
        }


        return true;

    }

}
