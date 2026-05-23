package util;

import model.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class FileHandler {

    // --- CORE DATABASE CONFIGURATION ---
    private static final String DIRECTORY_PATH = System.getProperty("user.home") + "/ParkingSystemData";
    public static final String USERS_FILE = DIRECTORY_PATH + "/users.txt";
    public static final String VEHICLES_FILE = DIRECTORY_PATH + "/vehicles.txt";
    public static final String RESERVATIONS_FILE = DIRECTORY_PATH + "/reservations.txt";
    public static final String PAYMENTS_FILE = DIRECTORY_PATH + "/payments.txt";

    static {
        File dir = new File(DIRECTORY_PATH);
        if (!dir.exists()) dir.mkdirs();
    }

    // =================================================================================
    // CORE SYSTEM UTILITIES (Shared generic methods for File I/O)
    // =================================================================================

    public static void saveToFile(String filePath, String data) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(data);
            writer.newLine();
        } catch (IOException ignored) {}
    }

    public static List<String> readFromFile(String filePath) {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) lines.add(line);
        } catch (IOException ignored) {}
        return lines;
    }

    public static void deleteRecordFromDatabase(String filePath, String idToMatch) {
        List<String> lines = readFromFile(filePath);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                if (!line.startsWith(idToMatch + ",")) { // Exact match filter
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException ignored) {}
    }

    // =================================================================================
    // ZONE 1: REGISTERED USER MANAGEMENT (Member: Tharunya)
    // =================================================================================

    // CREATE
    public static void saveRegisteredUser(RegisteredUser user) {
        saveToFile(USERS_FILE, user.toFileString());
    }

    // READ
    public static List<RegisteredUser> getAllRegisteredUsers() {
        List<RegisteredUser> users = new ArrayList<>();
        for (String line : readFromFile(USERS_FILE)) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && !parts[2].equalsIgnoreCase("GUEST")) {
                users.add(new RegisteredUser(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return users;
    }

    // UPDATE
    public static void updateRegisteredUser(String userId, String newName, String newEmail) {
        List<String> lines = readFromFile(USERS_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USERS_FILE))) {
            for (String line : lines) {
                if (line.startsWith(userId + ",")) {
                    String[] parts = line.split(",");
                    writer.write(parts[0] + "," + newName + "," + newEmail + "," + parts[3]);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }

    // DELETE
    public static void deleteRegisteredUser(String userId) {
        deleteRecordFromDatabase(USERS_FILE, userId);
    }

    // =================================================================================
    // ZONE 2: UNREGISTERED / GUEST MANAGEMENT
    // =================================================================================

    // CREATE
    public static void saveGuest(UnregisteredUser guest) {
        saveToFile(USERS_FILE, guest.toFileString());
    }

    // READ
    public static List<UnregisteredUser> getAllGuests() {
        List<UnregisteredUser> guests = new ArrayList<>();
        for (String line : readFromFile(USERS_FILE)) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && parts[2].equalsIgnoreCase("GUEST")) {
                guests.add(new UnregisteredUser(parts[0], parts[1], parts[3]));
            }
        }
        return guests;
    }

    // UPDATE
    public static void updateGuestPhone(String guestId, String newPhone) {
        List<String> lines = readFromFile(USERS_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USERS_FILE))) {
            for (String line : lines) {
                if (line.startsWith(guestId + ",")) {
                    String[] parts = line.split(",");
                    writer.write(parts[0] + "," + parts[1] + ",GUEST," + newPhone);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }

    // DELETE
    public static void deleteGuest(String guestId) {
        deleteRecordFromDatabase(USERS_FILE, guestId);
    }

    // =================================================================================
    // ZONE 3: VEHICLE MANAGEMENT
    // =================================================================================

    // CREATE
    public static void saveVehicle(Vehicle vehicle) {
        saveToFile(VEHICLES_FILE, vehicle.toFileString());
    }

    // READ
    public static List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        for (String line : readFromFile(VEHICLES_FILE)) {
            String[] parts = line.split(",");
            if (parts.length >= 4) {
                vehicles.add(new Vehicle(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return vehicles;
    }

    // UPDATE
    public static void updateVehicleColor(String vehicleId, String newColor) {
        List<String> lines = readFromFile(VEHICLES_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VEHICLES_FILE))) {
            for (String line : lines) {
                if (line.startsWith(vehicleId + ",")) {
                    String[] parts = line.split(",");
                    writer.write(parts[0] + "," + parts[1] + "," + parts[2] + "," + newColor);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }

    // DELETE
    public static void deleteVehicle(String vehicleId) {
        deleteRecordFromDatabase(VEHICLES_FILE, vehicleId);
    }

    // =================================================================================
    // ZONE 4: RESERVATION & PARKING SLOTS
    // =================================================================================

    // CREATE
    public static void saveReservation(String resData) {
        saveToFile(RESERVATIONS_FILE, resData);
    }

    // READ
    public static List<String> getAllReservations() {
        return readFromFile(RESERVATIONS_FILE);
    }

    // UPDATE (Completing a reservation)
    public static void updateReservationToCompleted(String resId, String exitTime, double fee) {
        List<String> lines = readFromFile(RESERVATIONS_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(RESERVATIONS_FILE))) {
            for (String line : lines) {
                if (line.startsWith(resId + ",")) {
                    String[] parts = line.split(",");
                    writer.write(parts[0] + "," + parts[1] + "," + parts[2] + "," + parts[3] + "," + exitTime + ",COMPLETED," + fee);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }

    // DELETE
    public static void deleteReservation(String resId) {
        deleteRecordFromDatabase(RESERVATIONS_FILE, resId);
    }

    // =================================================================================
    // ZONE 5: PAYMENT MANAGEMENT
    // =================================================================================

    // CREATE
    public static void savePayment(Payment payment) {
        saveToFile(PAYMENTS_FILE, payment.toFileString());
    }

    // READ
    public static List<String> getAllPayments() {
        return readFromFile(PAYMENTS_FILE);
    }

    // UPDATE (Refunding or adjusting a payment)
    public static void updatePaymentAmount(String paymentId, double newAmount) {
        List<String> lines = readFromFile(PAYMENTS_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PAYMENTS_FILE))) {
            for (String line : lines) {
                if (line.startsWith(paymentId + ",")) {
                    String[] parts = line.split(",");
                    writer.write(parts[0] + "," + parts[1] + "," + newAmount + "," + parts[3]);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }

    // DELETE
    public static void deletePayment(String paymentId) {
        deleteRecordFromDatabase(PAYMENTS_FILE, paymentId);
    }

    // =================================================================================
    // ZONE 6: ADMIN, SECURITY & VALIDATION LOGIC
    // =================================================================================

    public static boolean isVehicleRegistered(String plateNumber) {
        for (Vehicle v : getAllVehicles()) {
            if (v.getVehicleNumber().equalsIgnoreCase(plateNumber)) return true;
        }
        return false;
    }

    public static boolean isEmailRegistered(String email) {
        for (RegisteredUser u : getAllRegisteredUsers()) {
            if (u.getEmail().equalsIgnoreCase(email)) return true;
        }
        return false;
    }

    public static RegisteredUser verifyLogin(String email, String password) {
        for (RegisteredUser u : getAllRegisteredUsers()) {
            if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password)) return u;
        }
        return null;
    }
}