package controller;

import model.RegisteredUser;
import util.FileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Block duplicate registrations
        if (FileHandler.isEmailRegistered(email)) {
            response.sendRedirect("index.jsp?error=exists");
            return;
        }

        String userId = "U" + System.currentTimeMillis();
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        RegisteredUser newUser = new RegisteredUser(userId, fullName, email, password);
        FileHandler.saveRegisteredUser(newUser);

        // Auto-login the user after registration
        request.getSession().setAttribute("currentUser", newUser);
        response.sendRedirect("dashboard.jsp");
    }
}