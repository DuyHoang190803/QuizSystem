package controller;

import dal.TermSetDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TermSet;

public class FlashcardTermSetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int termSetId = Integer.parseInt(request.getParameter("termSetId"));
        
        TermSetDAO termSetDAO = new TermSetDAO();
        
        TermSet termSet = termSetDAO.getTermSetById(termSetId);
        
        request.setAttribute("termSet", termSet);
        request.getRequestDispatcher("student/flashcard-term-set.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }
}
