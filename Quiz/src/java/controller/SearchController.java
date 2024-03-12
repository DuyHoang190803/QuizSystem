/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TermSetDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.TermSet;
import model.User;

public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if (user != null) {

            String searchValue = request.getParameter("searchValue");
            session.setAttribute("searchValue", searchValue);

            TermSetDAO termSetList = new TermSetDAO();
            List<TermSet> list1 = termSetList.getTermSetsByName(searchValue);
            int page, numPerPage = 8;
            int size = list1.size();
            int num = (size % 8 == 0 ? (size / 8) : (size / 8) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numPerPage;
            end = Math.min(page * numPerPage, size);
            List<TermSet> list = termSetList.getListByPage(list1, start, end);

            request.setAttribute("list", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.getRequestDispatcher("search.jsp").forward(request, response);

        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null) {
            TermSetDAO termSetList = new TermSetDAO();
            String searchByTermSet = request.getParameter("searchByTermSet");
            String searchByClass = request.getParameter("searchByClass");

            if (searchByTermSet != null && searchByTermSet != "") {
                List<TermSet> list = termSetList.getTermSetsByName(searchByTermSet);
                request.setAttribute("list", list);

                request.getRequestDispatcher("search.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("search.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
