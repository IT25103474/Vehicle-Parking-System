package model;

public class RegisteredUser extends User {
    private String email;
    private String password;

    public RegisteredUser(String userId, String fullName, String email, String password) {
        super(userId, fullName);
        this.email = email;
        this.password = password;
    }

    public String getEmail() { return email; }
    public String getPassword() { return password; }

    @Override
    public String displayRole() {
        return "Registered Driver";
    }

    @Override
    public String toFileString() {
        return getUserId() + "," + getFullName() + "," + email + "," + password;
    }
}