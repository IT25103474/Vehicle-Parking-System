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

        RegisteredUser user = (RegisteredUser) request.getSession().getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String vehicleId = "V" + System.currentTimeMillis();
        String vehicleNumber = request.getParameter("vehicleNumber");
        String type = request.getParameter("type");

        Vehicle newVehicle = new Vehicle(vehicleId, user.getUserId(), vehicleNumber, type);
        FileHandler.saveVehicle(newVehicle);

        response.sendRedirect("dashboard.jsp");
    }
}