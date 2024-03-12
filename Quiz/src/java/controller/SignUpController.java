package controller;

import dal.UserDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class SignUpController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String mess;
            UserDAO dao = new UserDAO();
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String phoneNumber = request.getParameter("phoneNumber");
            String place = request.getParameter("place");
            String dateString = request.getParameter("date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(dateString); 
            java.sql.Date date = new java.sql.Date(utilDate.getTime());
            String userCode = request.getParameter("UserCode");
            int roleId;
            if (role.equals("student")) {
                roleId = 1;
            } else {
                roleId = 3;
            }
            if (dao.getUserByEmail(email) != null) {
                mess = "Email is already exist! Try other email";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {
                mess = "Sign Up Successful!";
                request.setAttribute("mess", mess);
                User user = new User(username, roleId, email, password, role, phoneNumber, date, place, userCode);
                dao.addUser(user);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.println(ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
