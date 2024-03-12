package controller;

import dal.TermSetDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.TermSet;
import model.User;

public class ViewTermSetListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        TermSetDAO termSetDAO = new TermSetDAO();
        UserDAO userDAO = new UserDAO();
        
        User user = userDAO.getUserById(userId);
        List<TermSet> termSets = termSetDAO.getTermSetsByUserId(userId);

        request.setAttribute("user", user);
        request.setAttribute("termSets", termSets);
        request.getRequestDispatcher("student/view-student-set-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
