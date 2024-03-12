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
import model.Question;

public class TeacherEditQuestion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int qid = Integer.parseInt(request.getParameter("qid"));

        try {
            QuestionDAO dao = new QuestionDAO();
            Question q = dao.getQuestionByQuestionId(qid);
            request.setAttribute("q", q);

            request.getRequestDispatcher("/teacher/edit-question.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            System.out.println(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        int questionSetId = Integer.parseInt(request.getParameter("questionSetId"));
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        String[] isCorrects = request.getParameterValues("correct_option[]");

        QuestionDAO dao = new QuestionDAO();
        try {
            // kiem tra question nay phai giong question cu hoac phai khac hoan toan cac question khac
            if (dao.getQuestionByQuestionId(questionId).getQuestion().equalsIgnoreCase(question) || dao.getQuestionByQuestionName(question) == null) {
                // !!! Need to fix
                String[] options = {option1, option2, option3, option4};

                dao.editQuestion(questionId, question, options, isCorrects);

            } else {
                Question q = dao.getQuestionByQuestionId(questionId);
            request.setAttribute("q", q);
                request.setAttribute("mess", "Question existed !");
                request.getRequestDispatcher("/teacher/edit-question.jsp").forward(request, response);
            }

        } catch (ServletException | IOException e) {
            System.out.println(e);
        }
        String url = "viewquestions?qsid=" + questionSetId;
//        request.getRequestDispatcher(url).forward(request, response);
        response.sendRedirect(url);

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

}
