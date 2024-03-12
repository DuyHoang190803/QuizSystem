package controller;

import dal.TermSetDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.TermSet;
import model.User;

public class ViewTermSetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int termSetId = Integer.parseInt(request.getParameter("termSetId"));
        User thisUser = (User) session.getAttribute("thisUser");

        TermSetDAO termSetDAO = new TermSetDAO();
        UserDAO userDAO = new UserDAO();

        //check authorization
        TermSet termSet = termSetDAO.getTermSetById(termSetId);
        if (termSet.getUserId() == thisUser.getUserId() || termSet.isIsPublic()) {
            User user = userDAO.getUserById(termSet.getUserId());

            request.setAttribute("user", user);
            request.setAttribute("termSet", termSet);
            request.getRequestDispatcher("student/view-term-set.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
