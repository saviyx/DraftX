package lk.jiat.draftx.web.servlet;


import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.draftx.ejb.local.LoginService;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {

    @EJB
    private LoginService loginService;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)

        throws ServletException, IOException{
        System.out.println("awoo");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            System.out.println(email + " " + password);

            boolean login = loginService.login(email, password);
            System.out.println("Login result: " + login);

        if(login){
                HttpSession session = request.getSession();
                session.setAttribute("user", email);

                response.sendRedirect( request.getContextPath() + "/home");
            }else {
                response.sendRedirect("login.jsp");
            }
        }



}
