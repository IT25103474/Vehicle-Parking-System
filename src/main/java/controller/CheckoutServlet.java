package controller;

import model.Payment;
import util.FileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resId = request.getParameter("id");

        // 1. Get exact exit time
        LocalDateTime exitTime = LocalDateTime.now();
        String exitStr = exitTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        List<String> reservations = FileHandler.getAllReservations();
        for (String line : reservations) {
            if (line.startsWith(resId) && line.contains("ACTIVE")) {
                String[] parts = line.split(",");
                String userId = parts[1];
                String slotType = parts[2];
                LocalDateTime entryTime = LocalDateTime.parse(parts[3], DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                // 2. Calculate Hours (Minimum 1 hour charge)
                long hours = Duration.between(entryTime, exitTime).toHours();
                if (hours < 1) hours = 1;

                // 3. Dynamic Pricing (Registered = 100/hr, Guest = 150/hr)
                double rate = userId.startsWith("G") ? 150.0 : 100.0;
                if ("EV".equals(slotType)) rate += 50.0;
                double totalFee = rate * hours;

                // 4. Update files immediately
                FileHandler.updateReservationToCompleted(resId, exitStr, totalFee);

                String paymentId = "PAY-" + System.currentTimeMillis();
                FileHandler.savePayment(new Payment(paymentId, resId, userId, totalFee));
                break;
            }
        }

        // Instantly return to dashboard
        response.sendRedirect("dashboard.jsp");
    }
}