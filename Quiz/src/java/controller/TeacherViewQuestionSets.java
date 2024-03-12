/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import dal.TeacherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.QuestionSet;

/**
 *
 * @author ACER
 */
public class TeacherViewQuestionSets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            HttpSession session = request.getSession();
            int teacherId = (int) session.getAttribute("user_id");
            QuestionDAO dao=new QuestionDAO();
            List<QuestionSet> qs= dao.getQuestionSetByUserId(teacherId);
            request.setAttribute("qs", qs);
        request.getRequestDispatcher("/teacher/teacher-questions-sets.jsp").forward(request, response);
        
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
