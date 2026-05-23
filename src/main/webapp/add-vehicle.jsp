<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Vehicle - PrimePark</title>
    <style>
        /* PRIMEPARK EXACT UI MATCH */
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #0b1120;
            color: #f8fafc;
            margin: 0;
            padding: 0;
            -webkit-font-smoothing: antialiased;
        }

        /* Navbar Layout */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: #0b1120;
            border-bottom: 1px solid #1e293b;
        }
        .logo { font-size: 24px; font-weight: 800; letter-spacing: 1px; }
        .logo .white { color: #ffffff; }
        .logo .cyan { color: #38bdf8; }
        
        .nav-links { display: flex; gap: 30px; }
        .nav-links a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding-bottom: 5px;
        }
        .nav-links a.active { color: #ffffff; border-bottom: 2px solid #38bdf8; }
        
        .nav-right a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }
        .nav-right a:hover { color: #ffffff; }

        /* Main Form Container */
        .container { 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            min-height: calc(100vh - 80px); 
        }
        
        .form-card {
            background-color: #0f172a;
            border: 1px solid #1e293b;
            border-radius: 12px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        }

        .form-title { font-size: 24px; font-weight: 700; color: #ffffff; margin: 0 0 8px 0; }
        .form-subtitle { color: #94a3b8; font-size: 14px; margin-bottom: 30px; }

        .form-group { margin-bottom: 20px; }
        label {
            display: block;
            color: #f8fafc;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }
        
        input[type="text"], select {
            width: 100%;
            padding: 14px;
            background-color: #0b1120;
            border: 1px solid #334155;
            border-radius: 6px;
            color: #ffffff;
            font-size: 15px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.2s;
        }
        input[type="text"]:focus, select:focus { border-color: #38bdf8; }
        input::placeholder { color: #475569; }
        select { cursor: pointer; }

        .btn-submit {
            width: 100%;
            background-color: #67e8f9;
            color: #0f172a;
            border: none;
            padding: 16px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s;
        }
        .btn-submit:hover { background-color: #22d3ee; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="logo"><span class="white">PRIME</span><span class="cyan">PARK</span></div>
        <div class="nav-links">
            <a href="dashboard.jsp">Overview</a>
            <a href="#" class="active">Vehicles</a>
            <a href="book-slot.jsp">Reservations</a>
            <a href="#">Shared Spaces</a>
        </div>
        <div class="nav-right">
            <a href="dashboard.jsp">Return to Dashboard ➔</a>
        </div>
    </nav>

    <div class="container">
        <div class="form-card">
            <h2 class="form-title">Register New Vehicle</h2>
            <p class="form-subtitle">Add a vehicle to your PrimePark network profile.</p>

            <form action="VehicleServlet" method="POST">
                
                <div class="form-group">
                    <label>LICENSE PLATE</label>
                    <input type="text" name="vehicleNumber" placeholder="E.G., CAA-1234" required>
                </div>

                <div class="form-group">
                    <label>VEHICLE CLASS</label>
                    <select name="type" required>
                        <option value="Standard Car">Standard Car</option>
                        <option value="SUV">SUV</option>
                        <option value="Van">Van</option>
                        <option value="Motorcycle">Motorcycle</option>
                    </select>
                </div>

                <button type="submit" class="btn-submit">Authorize & Save Vehicle</button>
            </form>
        </div>
    </div>

</body>
</html>