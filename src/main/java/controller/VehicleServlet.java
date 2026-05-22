package controller;

import model.RegisteredUser;
import model.Vehicle;
import util.FileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addVehicle")
public class VehicleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Check if the user is actively logged in
        RegisteredUser user = (RegisteredUser) request.getSession().getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String vehicleNumber = request.getParameter("vehicleNumber");

        // 2. Block duplicate license plates
        if (FileHandler.isVehicleRegistered(vehicleNumber)) {
            response.sendRedirect("add-vehicle.jsp?error=exists");
            return;
        }

        // 3. Generate a unique ID and gather the remaining form data
        String vehicleId = "V" + System.currentTimeMillis();
        String type = request.getParameter("type");

        // 4. Create the Vehicle object and save it using FileHandler
        Vehicle newVehicle = new Vehicle(vehicleId, user.getUserId(), vehicleNumber, type);
        FileHandler.saveVehicle(newVehicle);

        // 5. Return to the dashboard to see the updated fleet
        response.sendRedirect("dashboard.jsp");
    }
}