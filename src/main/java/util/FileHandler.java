package util;

import model.RegisteredUser;
import model.Vehicle;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    // Creating a safe folder on your computer to prevent Tomcat read/write errors
    private static final String DIRECTORY_PATH = System.getProperty("user.home") + "/ParkingSystemData";
    private static final String USERS_FILE = DIRECTORY_PATH + "/users.txt";
    private static final String VEHICLES_FILE = DIRECTORY_PATH + "/vehicles.txt";

    static {
        File directory = new File(DIRECTORY_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }

    public static void saveUser(RegisteredUser user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USERS_FILE, true))) {
            writer.write(user.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<RegisteredUser> getAllUsers() {
        List<RegisteredUser> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(USERS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 4) {
                    users.add(new RegisteredUser(data[0], data[1], data[2], data[3]));
                }
            }
        } catch (IOException ignored) {}
        return users;
    }

    public static void saveVehicle(Vehicle vehicle) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VEHICLES_FILE, true))) {
            writer.write(vehicle.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(VEHICLES_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 4) {
                    vehicles.add(new Vehicle(data[0], data[1], data[2], data[3]));
                }
            }
        } catch (IOException ignored) {}
        return vehicles;
    }
}