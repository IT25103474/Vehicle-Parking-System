<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shared Spaces - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; overflow: hidden; }
        .glass-panel { background: rgba(10, 20, 35, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); }
    </style>
</head>
<body class="min-h-screen flex flex-col relative">

    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[200px] opacity-10 pointer-events-none z-0"></div>

    <nav class="w-full bg-[#06101c]/80 backdrop-blur-md border-b border-white/5 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
            <a href="dashboard.jsp" class="text-2xl font-bold tracking-widest text-white decoration-0">
                PRIME<span class="text-[#00e5ff]">PARK</span>
            </a>

            <div class="hidden md:flex space-x-8 text-sm font-semibold text-gray-400">
                <a href="dashboard.jsp" class="hover:text-white transition-colors">Overview</a>
                <a href="add-vehicle.jsp" class="hover:text-white transition-colors">Vehicles</a>
                <a href="book-slot.jsp" class="hover:text-white transition-colors">Reservations</a>
                <a href="shared-space.jsp" class="text-[#00e5ff] border-b-2 border-[#00e5ff] pb-1">Shared Spaces</a>
            </div>

            <div class="flex items-center gap-4">
                <a href="index.jsp" class="text-xs font-bold text-red-400 hover:text-red-300 transition-colors">Sign Out</a>
            </div>
        </div>
    </nav>

    <main class="flex-1 w-full max-w-4xl mx-auto px-6 py-20 flex flex-col items-center justify-center z-10 text-center">

        <div class="glass-panel p-12 rounded-3xl shadow-[0_0_50px_rgba(0,229,255,0.05)] border border-[#00e5ff]/20">
            <div class="w-20 h-20 mx-auto bg-[#00e5ff]/10 rounded-full flex items-center justify-center mb-6 border border-[#00e5ff]/30">
                <svg class="w-10 h-10 text-[#00e5ff]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
            </div>

            <h1 class="text-4xl font-bold text-white mb-4">Peer-to-Peer Network</h1>
            <h2 class="text-xl text-[#00e5ff] font-semibold tracking-widest uppercase mb-6">Phase 2 Deployment</h2>

            <p class="text-gray-400 max-w-lg mx-auto mb-8 leading-relaxed">
                The PrimePark Shared Space module is currently under development. Soon, verified users will be able to monetize their private driveways and commercial spaces by seamlessly connecting them to our global grid.
            </p>

            <div class="inline-flex items-center gap-3 bg-[#0a1526] border border-gray-800 px-6 py-3 rounded-full">
                <span class="w-2 h-2 rounded-full bg-yellow-500 animate-pulse"></span>
                <span class="text-sm font-semibold text-gray-300">System Architecture in Progress</span>
            </div>

            <div class="mt-10">
                <a href="dashboard.jsp" class="text-sm text-gray-500 hover:text-[#00e5ff] transition-colors border-b border-transparent hover:border-[#00e5ff] pb-1">
                    ← Return to Control Center
                </a>
            </div>
        </div>

    </main>
</body>
</html>