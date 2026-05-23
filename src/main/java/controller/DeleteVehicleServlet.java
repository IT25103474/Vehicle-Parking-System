package controller;

import util.FileHandler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleId = request.getParameter("vehicleId");

        if (vehicleId != null && !vehicleId.trim().isEmpty()) {
            // Calls your specific Zone 3 method!
            FileHandler.deleteVehicle(vehicleId);
        }

        // Refresh the dashboard to show the vehicle is gone
        response.sendRedirect("dashboard.jsp");
    }
}