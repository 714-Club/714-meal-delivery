package com.foodweb.domain;

import net.sf.json.JSONObject;

public class Customer {
    private String id;
    private String username;
    private String password;
    private String email;
    private int foodkey;

    public static final String Id = "id";
    public static final String UserName = "username";
    public static final String PassWord = "password";
    public static final String Email = "email";
    public static final String FoodKey = "foodkey";

    public JSONObject toJson(){
        JSONObject jo = new JSONObject();
        jo.put(Customer.Id,id);
        jo.put(Customer.UserName,username);
//        jo.put(Customer.PassWord,password);
        jo.put(Customer.Email,email);
        jo.put(Customer.FoodKey,foodkey);

        return jo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getFoodkey() {
        return foodkey;
    }

    public void setFoodkey(int foodkey) {
        this.foodkey = foodkey;
    }
}
