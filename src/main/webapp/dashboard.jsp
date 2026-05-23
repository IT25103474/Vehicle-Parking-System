<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="util.FileHandler" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>System Dashboard - PrimePark</title>
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

        /* Navbar */
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
        .nav-right { display: flex; align-items: center; gap: 20px; font-size: 13px; font-weight: 600; }
        .status-pill { border: 1px solid #334155; padding: 4px 12px; border-radius: 20px; color: #64748b; }
        .sign-out { color: #ef4444; text-decoration: none; }

        /* Main Container */
        .container { padding: 40px; max-width: 1400px; margin: 0 auto; }

        /* Header Section */
        .header-section { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 40px; }
        .header-title h1 { margin: 0 0 10px 0; font-size: 32px; font-weight: 700; color: #ffffff; }
        .header-title p { margin: 0; color: #64748b; font-size: 16px; }
        .header-actions { display: flex; gap: 15px; }
        .btn-outline {
            background: transparent; border: 1px solid #334155; color: #ffffff;
            padding: 12px 24px; border-radius: 6px; font-weight: 600; cursor: pointer; text-decoration: none;
        }
        .btn-cyan {
            background: #67e8f9; border: none; color: #0f172a;
            padding: 12px 24px; border-radius: 6px; font-weight: 700; cursor: pointer; text-decoration: none;
        }

        /* Stats Row */
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 40px; }
        .stat-card {
            background-color: #0f172a; border: 1px solid #1e293b; border-radius: 12px; padding: 25px;
        }
        .stat-label { color: #64748b; font-size: 12px; font-weight: 700; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 15px; }
        .stat-value { font-size: 42px; font-weight: 700; color: #ffffff; margin: 0; }
        .stat-value.cyan-text { color: #38bdf8; }
        .stat-sub { font-size: 16px; color: #64748b; }

        /* Tables */
        .table-card {
            background-color: #0f172a; border: 1px solid #1e293b; border-radius: 12px; padding: 25px; margin-bottom: 20px;
        }
        .table-header { display: flex; align-items: center; margin-bottom: 20px; gap: 10px; }
        .red-dot { width: 8px; height: 8px; background-color: #ef4444; border-radius: 50%; }
        .table-title { font-size: 16px; font-weight: 700; color: #ffffff; margin: 0; }

        table { width: 100%; border-collapse: collapse; text-align: left; }
        th { color: #64748b; font-size: 12px; font-weight: 700; text-transform: uppercase; padding: 15px 10px; border-bottom: 1px solid #1e293b; }
        td { padding: 15px 10px; color: #cbd5e1; font-size: 14px; border-bottom: 1px solid #1e293b; }
        tr:last-child td { border-bottom: none; }

        .empty-state { text-align: center; color: #64748b; font-style: italic; padding: 30px !important; }

        /* Delete Button */
        .btn-delete-small {
            background-color: transparent; border: 1px solid #ef4444; color: #ef4444;
            padding: 4px 10px; border-radius: 4px; font-size: 12px; font-weight: 600; cursor: pointer;
            transition: all 0.2s;
        }
        .btn-delete-small:hover { background-color: #ef4444; color: #ffffff; }

        /* Bottom Grid */
        .bottom-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="logo"><span class="white">PRIME</span><span class="cyan">PARK</span></div>
        <div class="nav-links">
            <a href="#" class="active">Overview</a>
            <a href="#">Vehicles</a>
            <a href="#">Reservations</a>
            <a href="#">Shared Spaces</a>
        </div>
        <div class="nav-right">
            <span class="status-pill">Status: Online</span>
            <a href="login.jsp" class="sign-out">Sign Out</a>
        </div>
    </nav>

    <div class="container">

        <div class="header-section">
            <div class="header-title">
                <h1>System Dashboard</h1>
                <p>Real-time network overview and entity management.</p>
            </div>
            <div class="header-actions">
                <a href="add-vehicle.jsp" class="btn-outline">Register Vehicle</a>
                <a href="book-slot.jsp" class="btn-cyan">New Reservation</a>
            </div>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-label">Currently Parked</div>
                <div class="stat-value">0<span class="stat-sub">/100</span></div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Registered Fleet</div>
                <div class="stat-value">1</div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Total Revenue</div>
                <div class="stat-value cyan-text">LKR 100.00</div>
            </div>
        </div>

        <div class="table-card">
            <div class="table-header">
                <div class="red-dot"></div>
                <h2 class="table-title">Live Parking Activity</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Res ID</th>
                        <th>User/Guest ID</th>
                        <th>Entry Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="4" class="empty-state">No vehicles currently parked.</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="bottom-grid">

            <div class="table-card">
                <div class="table-header">
                    <h2 class="table-title">Registered Fleet</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Action</th>
                            <th>Vehicle ID</th>
                            <th>Plate</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                List<Vehicle> vehicleList = util.FileHandler.getAllVehicles();
                                if(vehicleList != null && !vehicleList.isEmpty()) {
                                    for(Vehicle v : vehicleList) {
                        %>
                        <tr>
                            <td>
                                <form action="DeleteVehicleServlet" method="POST" style="margin: 0;">
                                    <input type="hidden" name="vehicleId" value="<%= v.getVehicleId() %>">
                                    <button type="submit" class="btn-delete-small" onclick="return confirm('Delete this vehicle?');">Delete</button>
                                </form>
                            </td>
                            <td style="font-family: monospace; color: #94a3b8;"><%= v.getVehicleId() %></td>
                            <td style="color: #f8fafc; font-weight: 600;"><%= v.getVehicleNumber() %></td>
                            <td><%= v.getType() %></td>
                        </tr>
                        <%
                                    }
                                } else { out.print("<tr><td colspan='4' class='empty-state'>No vehicles registered.</td></tr>"); }
                            } catch(Exception e) { out.print("<tr><td colspan='4' class='empty-state'>Error loading database.</td></tr>"); }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2 class="table-title">Authorized Users</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                List<RegisteredUser> usersList = util.FileHandler.getAllRegisteredUsers();
                                if(usersList != null && !usersList.isEmpty()) {
                                    for(RegisteredUser u : usersList) {
                        %>
                        <tr>
                            <td style="font-family: monospace; color: #94a3b8;"><%= u.getUserId() %></td>
                            <td style="color: #f8fafc; font-weight: 600;"><%= u.getFullName() %></td>
                            <td><%= u.getEmail() %></td>
                        </tr>
                        <%
                                    }
                                } else { out.print("<tr><td colspan='3' class='empty-state'>No users registered.</td></tr>"); }
                            } catch(Exception e) { out.print("<tr><td colspan='3' class='empty-state'>Error loading database.</td></tr>"); }
                        %>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

</body>
</html>