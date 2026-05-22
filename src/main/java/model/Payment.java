package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Payment {
    private String paymentId;
    private String reservationId;
    private String userId;
    private double amount;
    private String status; // e.g., "SUCCESS" or "FAILED"
    private String timestamp;

    public Payment(String paymentId, String reservationId, String userId, double amount) {
        this.paymentId = paymentId;
        this.reservationId = reservationId;
        this.userId = userId;
        this.amount = amount;
        this.status = "SUCCESS"; // Defaulting to success for the prototype

        // Capturing the exact time of transaction, similar to your snippet
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.timestamp = LocalDateTime.now().format(formatter);
    }

    // Getters
    public String getPaymentId() { return paymentId; }
    public String getReservationId() { return reservationId; }
    public String getUserId() { return userId; }
    public double getAmount() { return amount; }
    public String getStatus() { return status; }
    public String getTimestamp() { return timestamp; }

    // Format for payments.txt
    public String toFileString() {
        return paymentId + "," + reservationId + "," + userId + "," + amount + "," + status + "," + timestamp;
    }
}