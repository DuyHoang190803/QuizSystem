/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Question;

/**
 *
 * @author ACER
 */
public class TeacherViewQuestions extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String qsid=request.getParameter("qsid");
        int id= Integer.parseInt(qsid);
        QuestionDAO dao= new QuestionDAO();
        List<Question> list = dao.getQuestionByQsid(id);
        request.setAttribute("qsid", id);
        request.setAttribute("questions", list);
        request.getRequestDispatcher("/teacher/teacher-questions-page.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
