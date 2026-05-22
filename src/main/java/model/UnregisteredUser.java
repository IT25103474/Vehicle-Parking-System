package model;

public class UnregisteredUser extends User {
    private String phone; // Guests provide a phone instead of email/password

    public UnregisteredUser(String userId, String fullName, String phone) {
        super(userId, fullName);
        this.phone = phone;
    }

    @Override
    public String displayRole() {
        return "One-Time Guest";
    }

    @Override
    public String toFileString() {
        // Saves to the text file perfectly alongside registered users
        return getUserId() + "," + getFullName() + ",GUEST," + phone;
    }
}