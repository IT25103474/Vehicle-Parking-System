package controller;

import model.RegisteredUser;
import model.Reservation;
import util.FileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/bookSlot")
public class ReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RegisteredUser user = (RegisteredUser) request.getSession().getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String slotType = request.getParameter("slotType");

        // Starts the timer! (Uses the clean constructor)
        String resId = "R" + System.currentTimeMillis();
        Reservation res = new Reservation(resId, user.getUserId(), slotType);

        FileHandler.saveReservation(res.toFileString());
        response.sendRedirect("dashboard.jsp");
    }
}