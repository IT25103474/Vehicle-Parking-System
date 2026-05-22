package controller;

import model.Payment;
import util.FileHandler;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resId = request.getParameter("resId");
        String userId = request.getParameter("userId");
        String exitTime = request.getParameter("exitTime");
        double totalFee = Double.parseDouble(request.getParameter("totalFee"));

        // 1. Update the existing reservation to COMPLETED
        FileHandler.updateReservationToCompleted(resId, exitTime, totalFee);

        // 2. Generate and save the official Payment Record
        Payment payment = new Payment("PAY-" + System.currentTimeMillis(), resId, userId, totalFee);
        FileHandler.savePayment(payment);

        response.sendRedirect("dashboard.jsp");
    }
}