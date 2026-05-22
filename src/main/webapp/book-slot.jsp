<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reserve Slot - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .glass-panel { background: rgba(10, 20, 35, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); }
    </style>
</head>
<body class="min-h-screen flex flex-col relative">

    <nav class="w-full bg-[#06101c] border-b border-white/5 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
            <a href="dashboard.jsp" class="text-2xl font-bold tracking-widest text-white decoration-0">
                PRIME<span class="text-[#00e5ff]">PARK</span>
            </a>
            <div class="hidden md:flex space-x-8 text-sm font-semibold text-gray-400">
                <a href="dashboard.jsp" class="hover:text-white transition-colors">Overview</a>
                <a href="add-vehicle.jsp" class="hover:text-white transition-colors">Vehicles</a>
                <a href="book-slot.jsp" class="text-[#00e5ff] border-b-2 border-[#00e5ff] pb-1">Reservations</a>
                <a href="shared-space.jsp" class="hover:text-white transition-colors">Shared Spaces</a>
            </div>
            <a href="dashboard.jsp" class="text-xs font-bold text-gray-400 hover:text-white transition-colors">Cancel ➔</a>
        </div>
    </nav>

    <main class="flex-1 max-w-3xl w-full mx-auto p-6 mt-10">
        <div class="glass-panel rounded-2xl overflow-hidden shadow-2xl">
            <div class="p-8 border-b border-white/5 bg-[#06101c]">
                <h2 class="text-2xl font-bold text-white">Initialize Reservation Protocol</h2>
                <p class="text-gray-500 mt-2 text-sm">Select your slot parameters to generate a dynamic fee calculation.</p>
            </div>

            <div class="p-8 bg-[#0a1526]/50">
                <form action="bookSlot" method="post" class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-semibold text-gray-300 mb-2 uppercase tracking-wide">Facility Type</label>
                            <select id="slotType" name="slotType" onchange="calculatePrice()" class="w-full bg-[#030b14] border border-gray-700 text-white rounded-lg px-4 py-4 focus:border-[#00e5ff] transition-all appearance-none">
                                <option value="Regular">Standard Bay</option>
                                <option value="EV">EV Bay (Charging Enabled)</option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-semibold text-gray-300 mb-2 uppercase tracking-wide">Duration Request (Hours)</label>
                            <input id="hours" type="number" name="hours" min="1" max="24" value="1" oninput="calculatePrice()" required
                                   class="w-full bg-[#030b14] border border-gray-700 text-white rounded-lg px-4 py-4 focus:border-[#00e5ff] transition-all font-mono">
                        </div>
                    </div>

                    <div class="bg-[#030b14] border border-gray-800 rounded-lg p-6 mt-6">
                        <h3 class="text-gray-400 text-xs font-bold uppercase tracking-widest mb-4 border-b border-gray-800 pb-2">Live Fee Calculation</h3>

                        <div class="flex justify-between text-sm mb-2">
                            <span class="text-gray-500">Base Rate (LKR 100 × <span id="displayHours">1</span> hr)</span>
                            <span class="text-white font-mono" id="calcBase">LKR 100.00</span>
                        </div>
                        <div class="flex justify-between text-sm mb-2" id="evRow" style="display: none;">
                            <span class="text-gray-500">EV Surcharge (LKR 50 × <span id="displayEvHours">1</span> hr)</span>
                            <span class="text-white font-mono" id="calcEv">LKR 0.00</span>
                        </div>
                        <div class="flex justify-between text-sm mb-4" id="discountRow" style="display: none;">
                            <span class="text-[#00e5ff]">System Discount (10% for 4+ hours)</span>
                            <span class="text-[#00e5ff] font-mono" id="calcDiscount">- LKR 0.00</span>
                        </div>

                        <div class="flex justify-between items-center border-t border-gray-800 pt-4">
                            <span class="text-white font-bold uppercase tracking-wider">Total Due</span>
                            <span class="text-2xl font-bold text-[#00e5ff] font-mono" id="calcTotal">LKR 100.00</span>
                        </div>
                    </div>

                    <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-4 hover:bg-[#00c4cc] hover:shadow-[0_0_20px_rgba(0,229,255,0.4)] transition-all mt-4">
                        Confirm & Process Payment
                    </button>
                </form>
            </div>
        </div>
    </main>

    <script>
        function calculatePrice() {
            let type = document.getElementById("slotType").value;
            let hours = parseInt(document.getElementById("hours").value) || 0;

            let baseRate = 100;
            let evRate = type === "EV" ? 50 : 0;

            let subtotalBase = baseRate * hours;
            let subtotalEv = evRate * hours;
            let subTotal = subtotalBase + subtotalEv;

            let discount = 0;
            if (hours >= 4) {
                discount = subTotal * 0.10;
                document.getElementById("discountRow").style.display = "flex";
            } else {
                document.getElementById("discountRow").style.display = "none";
            }

            let finalTotal = subTotal - discount;

            // Update UI Elements
            document.getElementById("displayHours").innerText = hours;
            document.getElementById("calcBase").innerText = "LKR " + subtotalBase.toFixed(2);

            if(type === "EV") {
                document.getElementById("evRow").style.display = "flex";
                document.getElementById("displayEvHours").innerText = hours;
                document.getElementById("calcEv").innerText = "LKR " + subtotalEv.toFixed(2);
            } else {
                document.getElementById("evRow").style.display = "none";
            }

            document.getElementById("calcDiscount").innerText = "- LKR " + discount.toFixed(2);
            document.getElementById("calcTotal").innerText = "LKR " + finalTotal.toFixed(2);
        }

        // Run once on load to set initial values
        window.onload = calculatePrice;
    </script>
</body>
</html>