<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Live Pass - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }</style>
</head>
<body class="min-h-screen flex items-center justify-center p-6 relative overflow-hidden">

    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[400px] h-[400px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[150px] opacity-20 pointer-events-none"></div>

    <div class="w-full max-w-md bg-[#0a1526] border border-[#00e5ff]/30 rounded-2xl p-8 shadow-[0_0_40px_rgba(0,229,255,0.1)] relative z-10 text-center">

        <div class="w-16 h-16 mx-auto bg-[#00e5ff]/10 rounded-full flex items-center justify-center mb-4 border border-[#00e5ff]/30">
            <svg class="w-8 h-8 text-[#00e5ff]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        </div>

        <h2 class="text-2xl font-bold text-white mb-1">Access Granted</h2>
        <p class="text-gray-400 text-sm mb-6">The barrier is open. You may now park.</p>

        <div class="bg-[#030b14] rounded-lg p-6 border border-gray-800 mb-8">
            <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">Your Digital Ticket ID</p>
            <p class="text-3xl font-mono text-[#00e5ff] font-bold tracking-wider"><%= request.getParameter("id") %></p>

            <div class="mt-6 flex items-center justify-center gap-2 text-sm text-gray-400">
                <span class="w-2 h-2 rounded-full bg-red-500 animate-pulse"></span>
                Time is actively recording...
            </div>
        </div>

        <p class="text-sm text-gray-500 mb-6">Keep this page open. When you are ready to leave the premises, click below to stop your timer and generate your final bill.</p>

        <a href="checkout?id=<%= request.getParameter("id") %>" class="block w-full bg-red-500 text-white font-bold rounded-lg px-4 py-4 hover:bg-red-600 transition-all shadow-lg shadow-red-500/20">
            Stop Timer & Pay Now
        </a>
    </div>

</body>
</html>