<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Vehicles - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .glass-panel { background: rgba(10, 20, 35, 0.4); backdrop-filter: blur(12px); border: 1px solid rgba(0, 229, 255, 0.2); }
    </style>
</head>
<body class="min-h-screen flex flex-col relative overflow-hidden">
    <div class="absolute top-0 right-0 w-[400px] h-[400px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[150px] opacity-10 pointer-events-none"></div>

    <nav class="w-full bg-[#06101c]/80 backdrop-blur-md border-b border-white/5 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
            <a href="dashboard.jsp" class="text-2xl font-bold tracking-widest text-white decoration-0">
                PRIME<span class="text-[#00e5ff] drop-shadow-[0_0_10px_rgba(0,229,255,0.5)]">PARK</span>
            </a>
            <div class="hidden md:flex space-x-8 text-sm font-semibold text-gray-400">
                <a href="dashboard.jsp" class="hover:text-white transition-colors">Overview</a>
                <a href="add-vehicle.jsp" class="text-[#00e5ff] border-b-2 border-[#00e5ff] pb-1">Vehicles</a>
                <a href="book-slot.jsp" class="hover:text-white transition-colors">Reservations</a>
                <a href="shared-space.jsp" class="hover:text-white transition-colors">Shared Spaces</a>
            </div>
            <a href="dashboard.jsp" class="text-xs font-bold text-gray-400 hover:text-white transition-colors">Return to Dashboard ➔</a>
        </div>
    </nav>

    <main class="flex-1 flex items-center justify-center p-6 z-10">
            <div class="w-full max-w-lg glass-panel rounded-2xl p-8 shadow-[0_0_40px_rgba(0,229,255,0.05)]">
                <div class="mb-8">
                    <h2 class="text-2xl font-bold text-white">Register New Vehicle</h2>
                    <p class="text-sm text-gray-400 mt-1">Add a vehicle to your PrimePark network profile.</p>
                </div>

                <% if ("exists".equals(request.getParameter("error"))) { %>
                    <div class="bg-red-500/10 border border-red-500/30 text-red-400 p-4 rounded-lg text-sm text-center mb-6 backdrop-blur-sm font-semibold">
                        Error: This license plate is already registered to a vehicle.
                    </div>
                <% } %>

                <form action="addVehicle" method="post" class="space-y-6">
                    <div>
                        <label class="block text-sm font-semibold text-gray-300 mb-2 tracking-wide uppercase">License Plate</label>
                        <input type="text" name="vehicleNumber" placeholder="e.g., CAA-1234" required
                               class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] focus:ring-1 focus:ring-[#00e5ff] transition-all font-mono uppercase">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-300 mb-2 tracking-wide uppercase">Vehicle Class</label>
                        <select name="type" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] focus:ring-1 focus:ring-[#00e5ff] transition-all appearance-none cursor-pointer">
                            <option value="Car">Standard Car</option>
                            <option value="Motorcycle">Motorcycle</option>
                            <option value="Van">Van / SUV</option>
                        </select>
                    </div>

                    <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-4 hover:bg-[#00c4cc] hover:shadow-[0_0_20px_rgba(0,229,255,0.4)] transition-all duration-300 mt-4">
                        Authorize & Save Vehicle
                    </button>
                </form>
            </div>
    </main>
</body>
</html>