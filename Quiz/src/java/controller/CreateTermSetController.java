package controller;

import dal.TermDAO;
import dal.TermSetDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CreateTermSetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("student/create-term-set.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] terms = request.getParameterValues("term");
        String[] definitions = request.getParameterValues("definition");
        String termSetName = request.getParameter("termSetName");
        String termSetDescription = request.getParameter("termSetDescription");
        int userId = Integer.parseInt(request.getParameter("userId"));
        boolean isPublic = "1".equals(request.getParameter("isPublic"));

        TermDAO termDAO = new TermDAO();
        TermSetDAO termSetDAO = new TermSetDAO();

        int newTermSetId = termSetDAO.addTermSet(userId, termSetName, termSetDescription, isPublic);

        for (int i = 0; i < terms.length; i++) {
            termDAO.addTerm(newTermSetId, terms[i], definitions[i]);
        }
        request.setAttribute("termsetId", newTermSetId);
        String redirectUrl = "view-term-set?termSetId=" + newTermSetId;
        response.sendRedirect(redirectUrl);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
