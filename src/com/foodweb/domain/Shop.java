package com.foodweb.domain;

import net.sf.json.JSONObject;

import java.util.Date;

public class Shop {
    private String id;
    private String name;
    private String phone;
    private String email;
    private String motto;
    private String address;
    private String image;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    private String password;
    private String username;
    private Date createtime;
    private Date updatetime;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private int status;

    public static final String Id = "id";
    public static final String Name = "name";
    public static final String Phone = "phone";
    public static final String Email = "email";
    public static final String Motto = "motto";
    public static final String Address = "address";
    public static final String Image = "image";
    public static final String Status = "status";
    public static final String UserName = "username";
    public static final String PassWord = "password";
    public static final String UpdateTime = "updatetime";
    public static final String CreateTime = "createtime";

    public JSONObject toJson()
    {
        JSONObject jo = new JSONObject();
        jo.put(Shop.Id,id);
        jo.put(Shop.Name,name);
        jo.put(Shop.Phone,phone);
        jo.put(Shop.Email,email);
        jo.put(Shop.Motto,motto);
        jo.put(Shop.Address,Address);
        jo.put(Shop.Image,image);
        jo.put(Shop.Status,status);
        jo.put(Shop.UserName,username);
        jo.put(Shop.UpdateTime,updatetime.getTime());
        jo.put(Shop.CreateTime,createtime.getTime());

        return jo;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotto() {
        return motto;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
