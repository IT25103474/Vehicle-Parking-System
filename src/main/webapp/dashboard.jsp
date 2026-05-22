<%@ page import="java.util.List" %>
<%@ page import="model.RegisteredUser" %>
<%@ page import="model.Vehicle" %>
<%@ page import="util.FileHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimePark - Control Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .glass-panel { background: rgba(10, 20, 35, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); }
        .glow-card { position: relative; overflow: hidden; }
        .glow-card::before { content: ''; position: absolute; top: -50%; left: -50%; width: 200%; height: 200%; background: radial-gradient(circle, rgba(0,229,255,0.1) 0%, transparent 60%); opacity: 0; transition: opacity 0.3s ease; pointer-events: none; }
        .glow-card:hover::before { opacity: 1; }
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: #030b14; }
        ::-webkit-scrollbar-thumb { background: #1f2937; border-radius: 3px; }
        ::-webkit-scrollbar-thumb:hover { background: #00e5ff; }
    </style>
</head>
<body class="min-h-screen flex flex-col">

    <nav class="w-full bg-[#06101c] border-b border-white/5 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
            <div class="text-2xl font-bold tracking-widest text-white">
                PRIME<span class="text-[#00e5ff]">PARK</span>
            </div>
            <div class="hidden md:flex space-x-8 text-sm font-semibold text-gray-400">
                <a href="dashboard.jsp" class="text-[#00e5ff] border-b-2 border-[#00e5ff] pb-1">Overview</a>
                <a href="add-vehicle.jsp" class="hover:text-white transition-colors">Vehicles</a>
                <a href="book-slot.jsp" class="hover:text-white transition-colors">Reservations</a>
                <a href="shared-space.jsp" class="hover:text-white transition-colors">Shared Spaces</a>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-xs text-gray-500 bg-[#0a1526] px-3 py-1 rounded-full border border-gray-800">Status: Online</span>
                <a href="index.jsp" class="text-xs font-bold text-red-400 hover:text-red-300">Sign Out</a>
            </div>
        </div>
    </nav>

    <main class="flex-1 w-full max-w-7xl mx-auto px-6 py-10">
        <div class="mb-10 flex justify-between items-end">
            <div>
                <h1 class="text-3xl font-bold text-white">System Dashboard</h1>
                <p class="text-gray-500 mt-2">Real-time network overview and entity management.</p>
            </div>
            <div class="flex gap-4">
                <a href="add-vehicle.jsp" class="px-5 py-2.5 text-sm font-bold text-white bg-[#0a1526] border border-gray-700 rounded-lg hover:border-[#00e5ff] transition-colors">Register Vehicle</a>
                <a href="book-slot.jsp" class="px-5 py-2.5 text-sm font-bold text-[#030b14] bg-[#00e5ff] rounded-lg hover:bg-[#00c4cc] hover:shadow-[0_0_15px_rgba(0,229,255,0.3)] transition-all">New Reservation</a>
            </div>
        </div>

        <%
            int maxCapacity = 100;
            int currentlyParked = 0;
            int registeredVehiclesCount = 0;
            double actualTotalRevenue = 0.0;

            try {
                List<Vehicle> allVehicles = util.FileHandler.getAllVehicles();
                if (allVehicles != null) { registeredVehiclesCount = allVehicles.size(); }

                List<String> reservations = util.FileHandler.getAllReservations();
                if (reservations != null) {
                    for(String r : reservations) {
                        if (r.contains("ACTIVE")) currentlyParked++;
                        if (r.contains("COMPLETED")) {
                            String[] parts = r.split(",");
                            if(parts.length >= 7) {
                                try { actualTotalRevenue += Double.parseDouble(parts[6]); } catch(Exception ignored) {}
                            }
                        }
                    }
                }
            } catch (Exception e) {}
        %>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
            <div class="glass-panel rounded-xl p-6 glow-card border-t border-t-[#00e5ff]/30">
                <h3 class="text-gray-500 text-sm font-semibold uppercase tracking-wider mb-2">Currently Parked</h3>
                <p class="text-4xl font-bold text-white"><%= currentlyParked %><span class="text-lg text-gray-500 font-normal">/<%= maxCapacity %></span></p>
            </div>
            <div class="glass-panel rounded-xl p-6 glow-card">
                <h3 class="text-gray-500 text-sm font-semibold uppercase tracking-wider mb-2">Registered Fleet</h3>
                <p class="text-4xl font-bold text-white"><%= registeredVehiclesCount %></p>
            </div>
            <div class="glass-panel rounded-xl p-6 glow-card">
                <h3 class="text-gray-500 text-sm font-semibold uppercase tracking-wider mb-2">Total Revenue</h3>
                <p class="text-4xl font-bold text-[#00e5ff]">LKR <%= String.format("%.2f", actualTotalRevenue) %></p>
            </div>
        </div>

        <div class="glass-panel rounded-xl overflow-hidden mb-8 shadow-lg shadow-[#00e5ff]/5">
            <div class="px-6 py-4 bg-[#06101c] border-b border-[#00e5ff]/20 flex justify-between items-center">
                <h3 class="text-white font-semibold flex items-center gap-2">
                    <span class="w-2 h-2 rounded-full bg-red-500 animate-pulse"></span>
                    Live Parking Activity
                </h3>
            </div>
            <div class="p-0 overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead class="bg-[#0a1526]">
                        <tr class="text-xs uppercase tracking-wider text-gray-500">
                            <th class="px-6 py-3 font-semibold">Res ID</th>
                            <th class="px-6 py-3 font-semibold">User/Guest ID</th>
                            <th class="px-6 py-3 font-semibold">Entry Time</th>
                            <th class="px-6 py-3 font-semibold">Action</th>
                        </tr>
                    </thead>
                    <tbody class="text-sm">
                        <%
                            try {
                                List<String> resList = util.FileHandler.getAllReservations();
                                boolean hasActive = false;
                                for(String r : resList) {
                                    if(r.contains("ACTIVE")) {
                                        hasActive = true;
                                        String[] p = r.split(",");
                                        if (p.length >= 4) {
                        %>
                        <tr class="border-b border-white/5 hover:bg-white/[0.02] transition-colors">
                            <td class="px-6 py-4 font-mono text-white text-xs"><%= p[0] %></td>
                            <td class="px-6 py-4 text-gray-400 font-mono text-xs"><%= p[1] %></td>
                            <td class="px-6 py-4 text-gray-400"><%= p[3] %></td>
                            <td class="px-6 py-4">
                                <a href="checkout?id=<%= p[0] %>" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded text-xs font-bold transition-all shadow-lg shadow-red-500/20">
                                    Checkout & Pay
                                </a>
                            </td>
                        </tr>
                        <%              }
                                    }
                                }
                                if(!hasActive) {
                                    out.print("<tr><td colspan='4' class='text-gray-500 p-6 text-center italic'>No vehicles currently parked.</td></tr>");
                                }
                            } catch (Exception e) {}
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="glass-panel rounded-xl overflow-hidden">
                <div class="px-6 py-4 border-b border-white/5 bg-[#06101c]">
                    <h3 class="text-white font-semibold">Registered Fleet</h3>
                </div>
                <div class="p-0 overflow-x-auto h-[300px] overflow-y-auto">
                    <table class="w-full text-left border-collapse relative">
                        <thead class="sticky top-0 bg-[#0a1526]">
                            <tr class="text-xs uppercase tracking-wider text-gray-500">
                                <th class="px-6 py-3 font-semibold">Plate No.</th>
                                <th class="px-6 py-3 font-semibold">Type</th>
                                <th class="px-6 py-3 font-semibold">Owner ID</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm">
                            <%
                                try {
                                    List<Vehicle> vehiclesList = util.FileHandler.getAllVehicles();
                                    for(Vehicle v : vehiclesList) {
                                        if (v != null && v.getVehicleNumber() != null && !v.getVehicleNumber().trim().isEmpty()) {
                            %>
                            <tr class="border-b border-white/5 hover:bg-white/[0.02] transition-colors">
                                <td class="px-6 py-4 font-bold text-white uppercase"><%= v.getVehicleNumber() %></td>
                                <td class="px-6 py-4 text-gray-400"><%= v.getType() != null ? v.getType() : "N/A" %></td>
                                <td class="px-6 py-4 text-gray-500 font-mono text-xs"><%= v.getOwnerId() %></td>
                            </tr>
                            <%          }
                                    }
                                } catch (Exception e) {}
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="glass-panel rounded-xl overflow-hidden">
                <div class="px-6 py-4 border-b border-white/5 bg-[#06101c]">
                    <h3 class="text-white font-semibold">Authorized Users</h3>
                </div>
                <div class="p-0 overflow-x-auto h-[300px] overflow-y-auto">
                    <table class="w-full text-left border-collapse relative">
                        <thead class="sticky top-0 bg-[#0a1526]">
                            <tr class="text-xs uppercase tracking-wider text-gray-500">
                                <th class="px-6 py-3 font-semibold">Name</th>
                                <th class="px-6 py-3 font-semibold">Email</th>
                                <th class="px-6 py-3 font-semibold">Role</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm">
                            <%
                                try {
                                    List<RegisteredUser> usersList = util.FileHandler.getAllUsers();
                                    for(RegisteredUser u : usersList) {
                                        if (u != null && u.getFullName() != null && !u.getFullName().trim().isEmpty()) {
                            %>
                            <tr class="border-b border-white/5 hover:bg-white/[0.02] transition-colors">
                                <td class="px-6 py-4 font-bold text-white"><%= u.getFullName() %></td>
                                <td class="px-6 py-4 text-gray-400"><%= u.getEmail() %></td>
                                <td class="px-6 py-4 text-[#00e5ff] text-xs font-semibold tracking-wider"><%= u.displayRole() %></td>
                            </tr>
                            <%          }
                                    }
                                } catch (Exception e) {}
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </main>
</body>
</html>