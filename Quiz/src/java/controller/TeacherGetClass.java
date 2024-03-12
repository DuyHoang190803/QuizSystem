/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TeacherDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import model.Classes;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "TeacherGetClass", urlPatterns = {"/teachergetclass"})
public class TeacherGetClass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            TeacherDAO dao = new TeacherDAO();
            HttpSession session = request.getSession();
            int teacherId = (int) session.getAttribute("user_id");
            List<Classes> c = dao.getClassesById(teacherId);
            session.setAttribute("c", c);
            request.getRequestDispatcher("teacher/teacher-class-page.jsp").forward(request, response);
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print("Error: " + ex.getMessage());
        }
    }
}
