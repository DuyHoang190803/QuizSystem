/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.NoteDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ACER
 */
public class UpdateUserProfile extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateUserProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String userId=request.getParameter("id");
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        try {
            User u= userDAO.getAccountById(Integer.parseInt(userId));
            session.setAttribute("acc", u);
            request.getRequestDispatcher("user-profile.jsp").forward(request, response);
            
            
        } catch (Exception ex) {
            Logger.getLogger(UpdateUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fullName=request.getParameter("fullName");
        String userName=request.getParameter("userName");
        String phoneNumber=request.getParameter("phoneNumber");
        String dob=request.getParameter("dob");
        String id= request.getParameter("userId");
        UserDAO userDAO = new UserDAO();
        try {
            if(!(isValidPhoneNumber(phoneNumber))){
                request.setAttribute("mess", "Invalid phone number");
                request.getRequestDispatcher("user-profile.jsp").forward(request, response);
            } else if(!isValidDob(dob)){
                request.setAttribute("mess", "You're not enough 18 years old.");
                request.getRequestDispatcher("user-profile.jsp").forward(request, response);
            }
            
            else{
                userDAO.updateUserById(fullName, userName, phoneNumber, dob, Integer.parseInt(id));
                //notification here
                NoteDAO noteDAO= new NoteDAO();
                noteDAO.insertNewMessage("Information is up-to-date", Integer.parseInt(id));
                
            }
//            User acc= userDAO.getAccountById(Integer.parseInt(id));
//            session.setAttribute("acc", acc);
    if(userDAO.getUserById(Integer.parseInt(id)).getRoleId()==1){
            response.sendRedirect("homes");
    } else if(userDAO.getUserById(Integer.parseInt(id)).getRoleId()==3){
        response.sendRedirect("teacherhome");
    }
//            request.getRequestDispatcher("home").forward(request, response);
            
            
        } catch (ServletException | IOException | NumberFormatException ex) {
            Logger.getLogger(UpdateUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    private boolean isValidPhoneNumber(String phoneNumber) {
        return phoneNumber.matches("\\d{10}");
    }
    private boolean isValidDob(String dobString) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = dateFormat.parse(dobString);

            Date currentDate = new Date();
            long ageMilli = currentDate.getTime() - dob.getTime();
            long ageYear = ageMilli / (1000 * 60 * 60 * 24 * 365L);

            return ageYear >= 18;
        } catch (ParseException e) {
            return false;
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
