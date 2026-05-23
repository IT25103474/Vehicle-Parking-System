package model;

/**
 * Guest user entity representing transient parking sessions.
 */
public class UnregisteredUser extends User {
    private String phone;

    // INHERITANCE: Calls base constructor to maintain consistent User identity.
    public UnregisteredUser(String userId, String fullName, String phone) {
        super(userId, fullName);
        this.phone = phone;
    }

    // POLYMORPHISM: Overrides base method to define guest-specific UI behavior.
    @Override
    public String displayRole() {
        return "One-Time Guest";
    }

    // DATA PERSISTENCE: Serializes object state for file-based storage..
    @Override
    public String toFileString() {
        return getUserId() + "," + getFullName() + ",GUEST," + phone;
    }
}