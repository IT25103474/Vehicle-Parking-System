<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimePark Solutions</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .neon-blue { text-shadow: 0 0 15px rgba(0, 229, 255, 0.6); }
        .glass-panel { background: rgba(10, 20, 35, 0.6); backdrop-filter: blur(12px); border: 1px solid rgba(0, 229, 255, 0.2); }
    </style>
</head>
<body class="min-h-screen flex flex-col relative overflow-hidden">
    <div class="absolute top-[-20%] left-[-10%] w-[500px] h-[500px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[150px] opacity-10 pointer-events-none"></div>

    <nav class="w-full px-8 py-6 flex justify-between items-center z-10 border-b border-white/5">
        <div class="text-2xl font-bold tracking-widest text-white">
            PRIME<span class="text-[#00e5ff] neon-blue">PARK</span>
        </div>
        <div class="flex items-center">
            <a href="guest-book.jsp" class="px-6 py-2.5 rounded-full bg-[#0a1526] border border-gray-700 text-white text-sm font-semibold hover:bg-[#00e5ff] hover:text-[#030b14] hover:border-[#00e5ff] transition-all duration-300 mr-4">Quick Park (Guest)</a>

            <a href="login.jsp" class="px-6 py-2.5 rounded-full border border-gray-600 text-sm font-semibold hover:border-[#00e5ff] hover:text-[#00e5ff] transition-all duration-300">Sign In</a>
        </div>
    </nav>

    <div class="flex-1 flex items-center justify-between max-w-7xl w-full mx-auto px-8 z-10">
        <div class="max-w-xl">
            <h1 class="text-5xl font-bold text-white leading-tight mb-6">
                Next-Generation <br><span class="text-[#00e5ff]">Parking Solutions.</span>
            </h1>
            <p class="text-gray-400 text-lg mb-8">Experience seamless reservations, real-time availability, and secure management with PrimePark's advanced ecosystem.</p>

            <% if ("guest".equals(request.getParameter("success"))) { %>
                <div class="inline-block bg-[#00e5ff]/10 border border-[#00e5ff]/30 text-[#00e5ff] px-6 py-3 rounded-lg text-sm font-semibold">
                    Guest Pass Generated! You may now proceed to the entrance.
                </div>
            <% } %>
        </div>

        <div class="w-full max-w-md glass-panel p-8 rounded-2xl shadow-[0_0_30px_rgba(0,229,255,0.05)]">
            <h3 class="text-2xl font-bold text-white mb-6">Join the Network</h3>

            <% if ("exists".equals(request.getParameter("error"))) { %>
                <div class="bg-red-500/10 border border-red-500/30 text-red-400 p-4 rounded-lg text-sm text-center mb-6 backdrop-blur-sm font-semibold">
                    Error: This email address is already registered in the network.
                </div>
            <% } %>

            <form action="register" method="post" class="space-y-5">
                <div>
                    <input type="text" name="fullName" required placeholder="Full Name" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] transition-colors">
                </div>
                <div>
                    <input type="email" name="email" required placeholder="Email Address" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] transition-colors">
                </div>
                <div>
                    <input type="password" name="password" required placeholder="Create Password" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] transition-colors">
                </div>
                <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-3 hover:bg-[#00c4cc] hover:shadow-[0_0_20px_rgba(0,229,255,0.4)] transition-all duration-300 mt-2">
                    Create Account
                </button>
            </form>
        </div>
    </div>
</body>
</html>