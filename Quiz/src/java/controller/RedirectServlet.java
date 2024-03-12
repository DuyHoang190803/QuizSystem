/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.NoteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Notification;

/**
 *
 * @author ACER
 */
public class RedirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id= request.getParameter("id");
        NoteDAO noteDAO=new NoteDAO();
        Notification note=noteDAO.getNoteById(Integer.parseInt(id));
        //tao cac duong dan
        String updateUserProfile="updateuser?id=";
        if(note.getMessage().equals("Information is up-to-date")){
            noteDAO.updateIsReadById(Integer.parseInt(id));
            response.sendRedirect(updateUserProfile+note.getUser_id());
        }
        
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
