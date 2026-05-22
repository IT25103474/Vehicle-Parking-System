<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guest Parking - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .glass-panel { background: rgba(10, 20, 35, 0.6); backdrop-filter: blur(12px); border: 1px solid rgba(0, 229, 255, 0.2); }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6">
    <div class="w-full max-w-xl glass-panel rounded-2xl p-8 shadow-[0_0_40px_rgba(0,229,255,0.05)]">
        <div class="mb-8 border-b border-gray-800 pb-4">
            <h2 class="text-2xl font-bold text-white">One-Time Guest Parking</h2>
            <p class="text-sm text-gray-400 mt-1">No account required. Fill details to generate your pass.</p>
        </div>

       <form action="parkingAction" method="post" class="space-y-6">
                   <input type="hidden" name="actionType" value="guestEntry">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-xs font-semibold text-gray-400 mb-2 uppercase">Full Name</label>
                    <input type="text" name="fullName" required class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:border-[#00e5ff] outline-none">
                </div>
                <div>
                    <label class="block text-xs font-semibold text-gray-400 mb-2 uppercase">Phone Number</label>
                    <input type="text" name="phone" required class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:border-[#00e5ff] outline-none">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                    <label class="block text-xs font-semibold text-gray-400 mb-2 uppercase">License Plate</label>
                    <input type="text" name="vehicleNumber" required placeholder="CAA-1234" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 font-mono uppercase focus:border-[#00e5ff] outline-none">
                </div>
                <div>
                    <label class="block text-xs font-semibold text-gray-400 mb-2 uppercase">Slot Type</label>
                    <select name="slotType" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:border-[#00e5ff] outline-none">
                        <option value="Regular">Standard</option>
                        <option value="EV">EV Bay</option>
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-semibold text-gray-400 mb-2 uppercase">Hours</label>
                    <input type="number" name="hours" min="1" value="1" required class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:border-[#00e5ff] outline-none font-mono">
                </div>
            </div>

            <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-4 hover:bg-[#00c4cc] transition-all mt-4">
                Confirm & Print Pass
            </button>
            <a href="index.jsp" class="block text-center text-sm text-gray-500 hover:text-white mt-4">Cancel</a>
        </form>
    </div>
</body>
</html>