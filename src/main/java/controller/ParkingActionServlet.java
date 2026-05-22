package controller;

import model.RegisteredUser;
import model.UnregisteredUser;
import model.Reservation;
import model.Vehicle;
import util.FileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/parkingAction")
public class ParkingActionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionType = request.getParameter("actionType");

        // --- REGISTERED USER ENTRY ---
        if ("registeredEntry".equals(actionType)) {
            RegisteredUser user = (RegisteredUser) request.getSession().getAttribute("currentUser");
            if (user == null) { response.sendRedirect("login.jsp"); return; }

            String slotType = request.getParameter("slotType");
            Reservation res = new Reservation("R" + System.currentTimeMillis(), user.getUserId(), slotType);
            FileHandler.saveReservation(res.toFileString());
            response.sendRedirect("dashboard.jsp");
        }

        // --- GUEST ENTRY ---
        else if ("guestEntry".equals(actionType)) {
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String vehicleNumber = request.getParameter("vehicleNumber");
            String slotType = request.getParameter("slotType");

            String guestId = "G" + System.currentTimeMillis();
            UnregisteredUser guest = new UnregisteredUser(guestId, fullName, phone);
            Vehicle vehicle = new Vehicle("V" + System.currentTimeMillis(), guestId, vehicleNumber, "Guest");

            // Create the reservation and capture the exact ID
            String resId = "R" + System.currentTimeMillis();
            Reservation res = new Reservation(resId, guestId, slotType);

            // Save all to files
            FileHandler.saveUser(new RegisteredUser(guestId, fullName, "GUEST", phone));
            FileHandler.saveVehicle(vehicle);
            FileHandler.saveReservation(res.toFileString());

            // THE FIX: Redirect the guest directly to their live digital ticket
            response.sendRedirect("guest-ticket.jsp?id=" + resId);
        }
    }
}