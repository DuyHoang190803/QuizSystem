package controller;

import dal.TermSetDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class DeleteTermSetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        TermSetDAO termSetDAO = new TermSetDAO();
        HttpSession session = request.getSession();
        
        int termSetId = Integer.parseInt(request.getParameter("termSetId"));
        User user = (User)session.getAttribute("thisUser");

        termSetDAO.deleteTermSet(termSetId);

        String redirectUrl = "view-student-set-list?userId=" + user.getUserId();
        response.sendRedirect(redirectUrl);
    }
}
