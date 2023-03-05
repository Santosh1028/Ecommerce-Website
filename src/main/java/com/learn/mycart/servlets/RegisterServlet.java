package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
                String userName = request.getParameter("username");
                String userEmail = request.getParameter("email");
                String userPassword = request.getParameter("password");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");

                //Server Side Validations....
//                if(userName.isBlank() || userName==""){
//                    System.out.println("Username is Blank..");
//                    return;
//                }
                // Creating user objects to store Data
                User user = new User(userName, userEmail, userPassword, phone, "default.png", address, "normal_user");
                
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();
                
                int userId = (int) session.save(user);
                
                tx.commit();
                session.close();
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registrated Successfully" );
                response.sendRedirect("register.jsp");
                return;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
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
