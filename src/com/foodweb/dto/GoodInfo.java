package com.foodweb.dto;

import com.foodweb.domain.Good;

public class GoodInfo extends Good {

    private String staticString;
    private String directionString;

    public GoodInfo(Good good)
    {
        super(good);
        setStaticString(GoodInfo.getStatusToString(good.getStatus()));
        setDirectionString(GoodInfo.getDirectionToString(good.getDirection()));
    }


    public String getStaticString() {
        return staticString;
    }

    public void setStaticString(String staticString) {
        this.staticString = staticString;
    }

    public String getDirectionString() {
        return directionString;
    }

    public void setDirectionString(String directionString) {
        this.directionString = directionString;
    }

    public static String getStatusToString(int status)
    {
        switch (status)
        {
            case 0:return "未上市";
            case 1:return "上市";
            case 2:return "缺货";
            default:return "未知状态";
        }
    }
    public static String getDirectionToString(int direction)
    {
        switch (direction)
        {
            case 0:return "美食";
            case 1:return "肠粉";
            case 2:return "粥面";
            case 3:return "饮料";
            case 4:return "水果";
            default:return "未知分类";
        }
    }
}
