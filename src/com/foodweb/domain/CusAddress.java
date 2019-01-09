package com.foodweb.domain;

import net.sf.json.JSONObject;

public class CusAddress {
    private String id;
    private String cusid;
    private String address;
    private String phone;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public static final String Id="id";
    public static final String CusId="cusid";
    public static final String Address="address";
    public static final String Phone ="phone";
    public static final String Name = "name";

    public JSONObject toJson(){
        JSONObject jo = new JSONObject();
        jo.put(CusAddress.Id,id);
        jo.put(CusAddress.CusId,cusid);
        jo.put(CusAddress.Address,address);
        jo.put(CusAddress.Phone,phone);
        jo.put(CusAddress.Name,name);
        return jo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCusid() {
        return cusid;
    }

    public void setCusid(String cusid) {
        this.cusid = cusid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
