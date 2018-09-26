package com.zq.xssdemo.modules.msg.entity;

import java.util.Date;

public class Msg {

    public Msg(){}

    private int id;

    private int userId;

    private String username;

    private String message;

    private Date time;

    private String date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "id=" + id +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", message='" + message + '\'' +
                ", time=" + time +
                '}';
    }
}
