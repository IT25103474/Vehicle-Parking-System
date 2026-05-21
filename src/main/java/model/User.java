package model;

public abstract class User {
    private String userId;
    private String fullName;

    public User(String userId, String fullName) {
        this.userId = userId;
        this.fullName = fullName;
    }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    // Polymorphism: Abstract method to be overridden
    public abstract String displayRole();
    public abstract String toFileString();
}