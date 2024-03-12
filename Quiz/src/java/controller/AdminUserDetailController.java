/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.User;
import utils.ParseUtils;

/**
 *
 * @author Admin
 */
public class AdminUserDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = ParseUtils.parseIntWithDefault(request.getParameter("id"), -1);
        UserDAO userDAO = new UserDAO();
        User u = userDAO.getUserById(id);
        request.setAttribute("userd", u);
        request.setAttribute("id", id);
        request.getRequestDispatcher("/admin/user-detail.jsp").include(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = ParseUtils.defaultIfEmpty(request.getParameter("action"), "");
        int id = ParseUtils.parseIntWithDefault(request.getParameter("id"), -1);
        switch (action) {
            case "Grant Role":
                processGrantRole(request, response);
                break;
            case "Save Profile":
                processSaveProfile(request, response);
                break;
        }
        response.sendRedirect("/quiz/admin/admin-user-detail?id=" + id);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processSaveProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = ParseUtils.parseIntWithDefault(request.getParameter("id"), -1);
        String fullName = ParseUtils.defaultIfEmpty(request.getParameter("fullName"), "");
        String username = ParseUtils.defaultIfEmpty(request.getParameter("username"), "");
        String email = ParseUtils.defaultIfEmpty(request.getParameter("email"), "");
        Date dob = ParseUtils.parseDateWithDefault(request.getParameter("dob"), null);
        String phone = ParseUtils.defaultIfEmpty(request.getParameter("phone"), "");
        AdminDAO AdminDetail = new AdminDAO();
        AdminDetail.updateUserById(fullName, username, email, phone, dob, id);
        request.setAttribute("profileStatus", "Update profile successfully!");
        processRequest(request, response);
    }
    private void processGrantRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = ParseUtils.parseIntWithDefault(request.getParameter("id"), -1);
        int roleId = ParseUtils.parseIntWithDefault(request.getParameter("roleId"), -1);
        UserDAO userDAO = new UserDAO();
        userDAO.updateUserRole(roleId, id);
        request.setAttribute("grantRoleStatus", "Grant role successfully!");
        processRequest(request, response);
    }
}
