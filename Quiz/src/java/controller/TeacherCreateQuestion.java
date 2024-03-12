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
import java.util.List;
import model.Option;
import model.Question;

/**
 *
 * @author ACER
 */
public class TeacherCreateQuestion extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TeacherCreateQuestion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TeacherCreateQuestion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int qsid= Integer.parseInt(request.getParameter("qsid"));
        request.setAttribute("qsid", qsid);   
        request.getRequestDispatcher("/teacher/create-question.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String questionSetId = request.getParameter("questionSetId");
        int qsid=Integer.parseInt(questionSetId);
        String[] isCorrects = request.getParameterValues("correct_option[]");
        
        QuestionDAO dao = new QuestionDAO();
        try{
        //1. Create question
        if(dao.getQuestionByQuestionNameAndSet(question, qsid)== null){
            dao.createQuestion(question, qsid);
            //2. Add options into question
            Question q = dao.getQuestionByQuestionNameAndSet(question, qsid);
            int questionId = q.getQuestionID();

            dao.insertOption(questionId, option1, option2, option3, option4);
        
          
        
            //3. Set correct answers
            for (String isCorrect : isCorrects) {
                if (isCorrect.equalsIgnoreCase("option1")) {
                    dao.setIsCorrect(option1, questionId);
                } else if (isCorrect.equalsIgnoreCase("option2")) {
                    dao.setIsCorrect(option2, questionId);
                } else if (isCorrect.equalsIgnoreCase("option3")) {
                    dao.setIsCorrect(option3, questionId);
                } else if (isCorrect.equalsIgnoreCase("option4")) {
                    dao.setIsCorrect(option4, questionId);
                }
            }
            

            
            
        }
        else{
            request.setAttribute("qsid", questionSetId);
            request.setAttribute("mess", "Question existed !");
            request.getRequestDispatcher("/teacher/create-question.jsp").forward(request, response);
        }
        

        
        
        }catch(NumberFormatException e){
            
        }
        String url = "viewquestions?qsid=" + questionSetId;
//        request.getRequestDispatcher(url).forward(request, response);
        response.sendRedirect(url);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
