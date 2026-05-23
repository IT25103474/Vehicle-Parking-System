package controller;

import model.Vehicle;
import model.RegisteredUser;
import util.FileHandler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Get the data from your JSP form.
        String vehicleNumber = request.getParameter("vehicleNumber");
        String type = request.getParameter("type"); // Captures the dropdown value

        // 2. Generate a unique Vehicle ID
        String vehicleId = "V" + System.currentTimeMillis();

        // 3. Get the Owner ID from the current session (or fallback for demo purposes)
        HttpSession session = request.getSession();
        RegisteredUser user = (RegisteredUser) session.getAttribute("currentUser");
        String ownerId = (user != null) ? user.getUserId() : "ADMIN_01";

        // 4. Create the object and save using your FileHandler
        if (vehicleNumber != null && type != null && !vehicleNumber.trim().isEmpty()) {
            Vehicle newVehicle = new Vehicle(vehicleId, ownerId, vehicleNumber, type);
            FileHandler.saveVehicle(newVehicle);
        }

        // 5. Redirect back to the dashboard to show the live update
        response.sendRedirect("dashboard.jsp");
    }
}