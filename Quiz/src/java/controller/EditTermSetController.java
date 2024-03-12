package controller;

import dal.TermDAO;
import dal.TermSetDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import model.Term;
import model.TermSet;
import model.User;

public class EditTermSetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int termSetId = Integer.parseInt(request.getParameter("termSetId"));
        TermSetDAO termSetDao = new TermSetDAO();
        request.setAttribute("termSetInfo", termSetDao.getTermSetById(termSetId));
        request.getRequestDispatcher("student/edit-term-set.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String[] newTerms = request.getParameterValues("term");
        String[] newDefinitions = request.getParameterValues("definition");

        String[] termIdChange = request.getParameterValues("termIdChange");
        String[] termsChange = request.getParameterValues("termChange");
        String[] definitionsChange = request.getParameterValues("definitionChange");

        String termSetName = request.getParameter("termSetName");
        String termSetDescription = request.getParameter("termSetDescription");
        boolean isPublic = "1".equals(request.getParameter("isPublic"));
        int termSetId = Integer.parseInt(request.getParameter("termSetId"));

//        int userId = Integer.parseInt(request.getParameter("userId"));

        String choice = request.getParameter("button");

        String redirectUrl = "view-term-set?termSetId=" + termSetId;

        TermDAO termDAO = new TermDAO();
        TermSetDAO termSetDAO = new TermSetDAO();
        String deleteTermId = request.getParameter("deleteTermId");

        if ("Delete".equals(choice)) {
            String redirectUrl1 = "edit-term-set?termSetId=" + termSetId;
            termDAO.deleteTerm(Integer.parseInt(deleteTermId));
            response.sendRedirect(redirectUrl1);
        } else if ("Update".equals(choice)) {
            termSetDAO.updateTermSet(termSetId, termSetName, termSetDescription, isPublic);
            if (termsChange != null && definitionsChange != null) {
                for (int i = 0; i < termsChange.length; i++) {
                    termDAO.updateTerm(Integer.parseInt(termIdChange[i]), termsChange[i], definitionsChange[i]);
                }
            }
            if (newTerms != null && newDefinitions != null) {
                for (int i = 0; i < newTerms.length; i++) {
                    termDAO.addTerm(termSetId, newTerms[i], newDefinitions[i]);
                }
            }
            response.sendRedirect(redirectUrl);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
