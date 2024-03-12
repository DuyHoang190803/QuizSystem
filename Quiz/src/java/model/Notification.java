/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class Notification {
    private int id;
    private String message;
    private boolean is_read;
    private int user_id;
    private Date created_at;

    public Notification() {
    }

    public Notification(int id, String message, boolean is_read, int user_id, Date created_at) {
        this.id = id;
        this.message = message;
        this.is_read = is_read;
        this.user_id = user_id;
        this.created_at = created_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isIs_read() {
        return is_read;
    }

    public void setIs_read(boolean is_read) {
        this.is_read = is_read;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Notification{" + "id=" + id + ", message=" + message + ", is_read=" + is_read + ", user_id=" + user_id + ", created_at=" + created_at + '}';
    }

    
    
}
