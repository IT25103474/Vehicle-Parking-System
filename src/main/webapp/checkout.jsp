<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Process Payment - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }</style>
</head>
<body class="h-screen flex items-center justify-center p-6">
    <div class="w-full max-w-md bg-[#0a1526] border border-[#00e5ff]/30 rounded-2xl p-8 shadow-[0_0_40px_rgba(0,229,255,0.1)]">
        <h2 class="text-2xl font-bold text-white mb-2 border-b border-gray-800 pb-4">Checkout Summary</h2>

        <div class="space-y-3 mt-6 mb-6">
            <div class="flex justify-between text-sm"><span class="text-gray-500">Reservation ID</span><span class="text-white font-mono"><%= request.getAttribute("resId") %></span></div>
            <div class="flex justify-between text-sm"><span class="text-gray-500">Entry Time</span><span class="text-white"><%= request.getAttribute("entryTime") %></span></div>
            <div class="flex justify-between text-sm"><span class="text-gray-500">Exit Time</span><span class="text-[#00e5ff]"><%= request.getAttribute("exitTime") %></span></div>
            <div class="flex justify-between text-sm"><span class="text-gray-500">Total Duration</span><span class="text-white"><%= request.getAttribute("hours") %> Hours</span></div>
            <hr class="border-gray-800 my-4">
            <div class="flex justify-between text-lg font-bold"><span class="text-white">Amount Due</span><span class="text-[#00e5ff]">LKR <%= request.getAttribute("totalFee") %></span></div>
        </div>

        <form action="processPayment" method="post">
            <input type="hidden" name="resId" value="<%= request.getAttribute("resId") %>">
            <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
            <input type="hidden" name="exitTime" value="<%= request.getAttribute("exitTime") %>">
            <input type="hidden" name="totalFee" value="<%= request.getAttribute("totalFee") %>">

            <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-4 hover:bg-[#00c4cc] transition-all">
                Collect Payment & Complete
            </button>
        </form>
        <a href="dashboard.jsp" class="block text-center mt-4 text-sm text-gray-500 hover:text-white">Cancel</a>
    </div>
</body>
</html>