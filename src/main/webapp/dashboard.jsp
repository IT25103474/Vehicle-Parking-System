<%@ page import="java.util.List" %>
<%@ page import="model.RegisteredUser" %>
<%@ page import="model.Vehicle" %>
<%@ page import="util.FileHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>System Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #0d6efd; color: white; }
        .btn { padding: 10px 20px; background-color: #198754; color: white; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>System Dashboard</h1>

    <a href="add-vehicle.jsp" class="btn">Register a New Vehicle</a>

    <h3 style="margin-top: 40px;">Registered Users (Read Operation)</h3>
    <table>
        <tr><th>User ID</th><th>Full Name</th><th>Email</th><th>Role (Polymorphism)</th></tr>
        <%
            List<RegisteredUser> users = FileHandler.getAllUsers();
            for(RegisteredUser u : users) {
        %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getFullName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.displayRole() %></td>
        </tr>
        <% } %>
    </table>

    <h3>Registered Vehicles (Read Operation)</h3>
    <table>
        <tr><th>Vehicle ID</th><th>Owner ID</th><th>License Plate</th><th>Type</th></tr>
        <%
            List<Vehicle> vehicles = FileHandler.getAllVehicles();
            for(Vehicle v : vehicles) {
        %>
        <tr>
            <td><%= v.getVehicleId() %></td>
            <td><%= v.getOwnerId() %></td>
            <td><%= v.getVehicleNumber() %></td>
            <td><%= v.getType() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>