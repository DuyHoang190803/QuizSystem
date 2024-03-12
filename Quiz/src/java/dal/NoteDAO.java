/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Notification;

/**
 *
 * @author ACER
 */
public class NoteDAO extends DBContext {

    public List<Notification> getNoteByUserId(int user_id) {
        try {
            List<Notification> list = new ArrayList<>();

            String sql = "select * from Notifications\n"
                    + "where user_id=?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                n.setMessage(rs.getString("message"));
                n.setIs_read(rs.getBoolean("is_read"));
                n.setUser_id(user_id);
                n.setCreated_at(rs.getDate("created_at"));
                list.add(n);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(NoteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertNewMessage(String message, int user_id) {
        String sql = "insert into Notifications(message,user_id,created_at)\n"
                + "values (?,?,GETDATE());";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, message);
            stm.setInt(2, user_id);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void updateIsReadById(int id) {
        String sql = "update Notifications \n"
                + "set is_read = ? \n"
                + "where id= ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, true);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public Notification getNoteById(int id) {
        String sql = "select * from Notifications where id=?;";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Notification c = new Notification();
                c.setId(rs.getInt("id"));
                c.setMessage(rs.getString("message"));
                c.setIs_read(rs.getBoolean("is_read"));
                c.setUser_id(rs.getInt("user_id"));
                c.setCreated_at(rs.getDate("created_at"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NoteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        NoteDAO dao = new NoteDAO();
        System.out.println("1:"+dao.getNoteById(1));
//        dao.insertNewMessage("Thống kê vượt chỉ tiêu", 1);
        List<Notification> list = dao.getNoteByUserId(2);
        for (Notification l : list) {
            System.out.println(l.toString());
        }
    }
}
