package model;

public class Vehicle {
    private String vehicleId;
    private String ownerId;
    private String vehicleNumber;
    private String type;

    public Vehicle(String vehicleId, String ownerId, String vehicleNumber, String type) {
        this.vehicleId = vehicleId;
        this.ownerId = ownerId;
        this.vehicleNumber = vehicleNumber;
        this.type = type;
    }

    public String getVehicleId() { return vehicleId; }
    public String getOwnerId() { return ownerId; }
    public String getVehicleNumber() { return vehicleNumber; }
    public String getType() { return type; }

    public String toFileString() {
        return vehicleId + "," + ownerId + "," + vehicleNumber + "," + type;
    }
}