package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Reservation {
    private String reservationId;
    private String userId;
    private String slotType;
    private String entryTime;
    private String exitTime;
    private String status;
    private double totalFee;

    // 1. Constructor for REAL-TIME ENTRY (Starts the clock)
    public Reservation(String reservationId, String userId, String slotType) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.slotType = slotType;
        this.entryTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        this.exitTime = "PENDING";
        this.status = "ACTIVE";
        this.totalFee = 0.0;
    }

    // 2. Safety Constructor (Fixes your "int" error if a form sends hours)
    public Reservation(String reservationId, String userId, String slotType, int hours) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.slotType = slotType;
        this.entryTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        this.exitTime = "PENDING";
        this.status = "ACTIVE";
        this.totalFee = 0.0;
    }

    // 3. Constructor for reading from text file
    public Reservation(String id, String user, String type, String entry, String exit, String status, double fee) {
        this.reservationId = id;
        this.userId = user;
        this.slotType = type;
        this.entryTime = entry;
        this.exitTime = exit;
        this.status = status;
        this.totalFee = fee;
    }

    public String toFileString() {
        return reservationId + "," + userId + "," + slotType + "," + entryTime + "," + exitTime + "," + status + "," + totalFee;
    }

    public String getReservationId() { return reservationId; }
    public String getUserId() { return userId; }
    public double getTotalFee() { return totalFee; }
}