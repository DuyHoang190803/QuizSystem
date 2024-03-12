/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
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
public class TeacherCreateQuestionSet extends HttpServlet {
   
 
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String setName=request.getParameter("setName");
        String isPublic= request.getParameter("isPublic");
        QuestionDAO dao= new QuestionDAO();
        QuestionSet q= new QuestionSet();
        if(isPublic != null && isPublic.equals("true")){
        q.setIsPublic(true);
        }else{
            q.setIsPublic(false);
        }
        q.setQuestionSetName(setName);
        q.setUserId((int) session.getAttribute("user_id"));
        dao.createQuestionSet(q);
        List<QuestionSet> qs= dao.getQuestionSetByUserId((int) session.getAttribute("user_id"));
        request.setAttribute("qs", qs);
        request.getRequestDispatcher("/teacher/teacher-questions-sets.jsp").forward(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
