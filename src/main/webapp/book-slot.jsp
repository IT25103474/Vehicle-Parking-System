<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guest Parking Entry - PrimePark</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .booking-card {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 { color: #1e293b; text-align: center; margin-top: 0; }
        .form-group { margin-bottom: 15px; }
        label { display: block; color: #334155; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
        }
        .btn-submit:hover { background-color: #2563eb; }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="booking-card">
    <h2>Guest Parking Entry</h2>

    <form action="ParkingActionServlet" method="POST">

        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="fullName" placeholder="Enter Full Name" required>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phone" placeholder="Enter Phone Number" required>
        </div>

        <div class="form-group">
            <label>Vehicle Plate Number</label>
            <input type="text" name="vehicleNumber" placeholder="e.g., CBA-1234" required>
        </div>

        <div class="form-group">
            <label>Select Slot Type</label>
            <select name="slotType" required>
                <option value="Standard">Standard (Rs. 150/hr)</option>
                <option value="VIP">VIP (Rs. 300/hr)</option>
                <option value="EV">EV Charging (Rs. 250/hr)</option>
            </select>
        </div>

        <button type="submit" class="btn-submit">Generate Live Ticket</button>
    </form>

    <a href="login.jsp" class="back-link">Return to Login Screen</a>
</div>

</body>
</html>