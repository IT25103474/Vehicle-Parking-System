<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Vehicle</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; padding-top: 50px; }
        .card { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 300px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #198754; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="card">
        <h2 style="text-align: center;">Register Vehicle</h2>
        <form action="addVehicle" method="post">
            <input type="text" name="vehicleNumber" placeholder="License Plate (e.g. CAA-1234)" required>
            <select name="type">
                <option value="Car">Car</option>
                <option value="Motorcycle">Motorcycle</option>
                <option value="Van">Van</option>
            </select>
            <button type="submit">Add Vehicle</button>
        </form>
        <br>
        <a href="dashboard.jsp" style="display:block; text-align:center; text-decoration:none; color:#0d6efd;">Back to Dashboard</a>
    </div>
</body>
</html>