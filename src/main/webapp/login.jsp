<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .glass-panel { background: rgba(10, 20, 35, 0.6); backdrop-filter: blur(12px); border: 1px solid rgba(0, 229, 255, 0.2); }
    </style>
</head>
<body class="h-screen flex items-center justify-center relative overflow-hidden">
    <div class="absolute bottom-[-10%] right-[-10%] w-[400px] h-[400px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[150px] opacity-10 pointer-events-none"></div>

    <div class="w-full max-w-sm glass-panel p-8 rounded-2xl shadow-[0_0_40px_rgba(0,229,255,0.1)] relative z-10">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold text-white tracking-wide">PRIME<span class="text-[#00e5ff]">PARK</span></h2>
            <p class="text-gray-400 text-sm mt-2">Sign in to your dashboard</p>
        </div>

        <% if (request.getParameter("error") != null) { %>
            <div class="bg-red-500/10 border border-red-500/30 text-red-400 p-3 rounded-lg text-sm text-center mb-6">
                Authentication failed. Try again.
            </div>
        <% } %>

        <form action="login" method="post" class="space-y-5">
            <div>
                <input type="email" name="email" required placeholder="Email Address" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] transition-colors">
            </div>
            <div>
                <input type="password" name="password" required placeholder="Password" class="w-full bg-[#0a1526] border border-gray-700 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-[#00e5ff] transition-colors">
            </div>
            <button type="submit" class="w-full bg-[#00e5ff] text-[#030b14] font-bold rounded-lg px-4 py-3 hover:bg-[#00c4cc] hover:shadow-[0_0_20px_rgba(0,229,255,0.4)] transition-all duration-300">
                Access System
            </button>
        </form>
        <p class="text-sm text-gray-500 text-center mt-6">
            <a href="index.jsp" class="hover:text-[#00e5ff] transition-colors">Return to Registration</a>
        </p>
    </div>
</body>
</html>