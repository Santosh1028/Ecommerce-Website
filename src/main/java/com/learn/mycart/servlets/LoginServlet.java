package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learn.mycart.entities.User;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            PrintWriter out = response.getWriter();
            String userName = request.getParameter("email");
            String userPassword = request.getParameter("password");

            //Validations Here....
            //Authentication User
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(userName, userPassword);
            //System.err.println(user);

            HttpSession httpSession = request.getSession();

            if (user == null) {
                //out.println("<h1>Invalid User Details </h1>");
                httpSession.setAttribute("message", "Invalid User Details..");
                response.sendRedirect("login.jsp");
                return;

            } else {
                //out.println("<h1>Welcome"+user.getUserName()+" </h1>");

                //login
                httpSession.setAttribute("current-user", user);
                
                System.out.println(user);

                if (user.getUserType().equals("admin")) {

                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal_user")) {
                    response.sendRedirect("normal.jsp");
                } else {
                    out.println("Not identitfied User..");
                }

                // Admin: admin.jsp
                //Normal: normal.jsp
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
