/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ACER
 */
public class ProcessAvatarSelection extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String selectedAvatar=request.getParameter("selectedAvatar");
        String id= request.getParameter("userId");
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        try {
            //true sẽ thay bằng điều kiện kích hoạt
            if(true){
                userDAO.updateAvatarById(selectedAvatar, Integer.parseInt(id));
            }
            User acc= userDAO.getAccountById(Integer.parseInt(id));
            request.setAttribute("acc", acc);
            session.setAttribute("acc",acc);
            request.getRequestDispatcher("user-profile.jsp").forward(request, response);
            
            
        } catch (Exception ex) {
            Logger.getLogger(UpdateUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
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
