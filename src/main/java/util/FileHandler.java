package util;

import model.RegisteredUser;
import model.Vehicle;
import model.Reservation;
import model.Payment;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String DIRECTORY_PATH = System.getProperty("user.home") + "/ParkingSystemData";
    public static final String USERS_FILE = DIRECTORY_PATH + "/users.txt";
    public static final String VEHICLES_FILE = DIRECTORY_PATH + "/vehicles.txt";
    public static final String RESERVATIONS_FILE = DIRECTORY_PATH + "/reservations.txt";
    public static final String PAYMENTS_FILE = DIRECTORY_PATH + "/payments.txt";

    static {
        File dir = new File(DIRECTORY_PATH);
        if (!dir.exists()) dir.mkdirs();
    }

    // --- GENERIC READ/WRITE ---
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

    // --- SPECIFIC SAVE METHODS ---
    public static void saveUser(RegisteredUser user) { saveToFile(USERS_FILE, user.toFileString()); }
    public static void saveVehicle(Vehicle vehicle) { saveToFile(VEHICLES_FILE, vehicle.toFileString()); }
    public static void saveReservation(String resData) { saveToFile(RESERVATIONS_FILE, resData); }
    public static void savePayment(Payment payment) { saveToFile(PAYMENTS_FILE, payment.toFileString()); }

    // --- SPECIFIC GET ALL METHODS ---
    public static List<RegisteredUser> getAllUsers() {
        List<RegisteredUser> users = new ArrayList<>();
        for (String line : readFromFile(USERS_FILE)) {
            String[] parts = line.split(",");
            if (parts.length >= 4) {
                users.add(new RegisteredUser(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return users;
    }

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

    public static List<String> getAllReservations() { return readFromFile(RESERVATIONS_FILE); }
    public static List<String> getAllPayments() { return readFromFile(PAYMENTS_FILE); }

    // --- MISSING DUPLICATE CHECKS (FIXES YOUR ERROR) ---
    public static boolean isVehicleRegistered(String plateNumber) {
        for (Vehicle v : getAllVehicles()) {
            if (v.getVehicleNumber().equalsIgnoreCase(plateNumber)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isEmailRegistered(String email) {
        for (RegisteredUser u : getAllUsers()) {
            if (u.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }

    // --- LOGIN VERIFICATION ---
    public static RegisteredUser verifyLogin(String email, String password) {
        for (RegisteredUser u : getAllUsers()) {
            if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    // --- DELETE OPERATIONS ---
    public static void deleteRecord(String filePath, String idToMatch) {
        List<String> lines = readFromFile(filePath);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                if (!line.contains(idToMatch)) {
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException ignored) {}
    }

    // --- UPDATE OPERATION (Checkout Reservation) ---
    public static void updateReservationToCompleted(String resId, String exitTime, double fee) {
        List<String> lines = readFromFile(RESERVATIONS_FILE);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(RESERVATIONS_FILE))) {
            for (String line : lines) {
                if (line.startsWith(resId)) {
                    String[] parts = line.split(",");
                    String updatedLine = parts[0] + "," + parts[1] + "," + parts[2] + "," + parts[3] + "," + exitTime + ",COMPLETED," + fee;
                    writer.write(updatedLine);
                } else {
                    writer.write(line);
                }
                writer.newLine();
            }
        } catch (IOException ignored) {}
    }
}