<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your Digital Pass - PrimePark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Space Grotesk', sans-serif; background-color: #030b14; color: #e2e8f0; }
        .ticket-bg { background: linear-gradient(145deg, #0a1526 0%, #06101c 100%); border: 1px solid rgba(0, 229, 255, 0.3); }
        .dashed-line { border-top: 2px dashed rgba(255,255,255,0.1); margin: 20px 0; }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6 relative overflow-hidden">
    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-[#00e5ff] rounded-full mix-blend-screen filter blur-[200px] opacity-10 pointer-events-none"></div>

    <div class="w-full max-w-md z-10">

        <div class="ticket-bg rounded-2xl shadow-[0_0_50px_rgba(0,229,255,0.1)] relative overflow-hidden">
            <div class="bg-[#00e5ff] p-6 text-center">
                <h2 class="text-2xl font-bold text-[#030b14] tracking-widest">GUEST PASS</h2>
                <p class="text-[#030b14]/80 text-sm font-semibold mt-1">PrimePark Network</p>
            </div>

            <div class="p-8">
                <div class="flex justify-between items-center mb-6">
                    <span class="text-xs text-gray-500 uppercase tracking-widest">Pass ID</span>
                    <span class="text-white font-mono text-sm"><%= request.getAttribute("passId") %></span>
                </div>

                <div class="space-y-4">
                    <div>
                        <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">Driver Name</p>
                        <p class="text-lg font-bold text-white"><%= request.getAttribute("passName") %></p>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">License Plate</p>
                            <p class="text-lg font-bold text-white uppercase"><%= request.getAttribute("passPlate") %></p>
                        </div>
                        <div>
                            <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">Slot Type</p>
                            <p class="text-lg font-bold text-white"><%= request.getAttribute("passType") %></p>
                        </div>
                    </div>
                </div>

                <div class="dashed-line"></div>

                <div class="flex justify-between items-center">
                    <div>
                        <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">Duration</p>
                        <p class="text-xl font-bold text-white"><%= request.getAttribute("passHours") %> Hours</p>
                    </div>
                    <div class="text-right">
                        <p class="text-xs text-gray-500 uppercase tracking-widest mb-1">Amount Due</p>
                        <p class="text-3xl font-bold text-[#00e5ff] font-mono">LKR <%= request.getAttribute("passTotal") %></p>
                    </div>
                </div>
            </div>

            <div class="px-8 pb-8 text-center">
                <div class="h-12 w-full bg-gradient-to-r from-transparent via-white/20 to-transparent flex justify-between items-center px-4 opacity-50">
                    <div class="w-1 h-full bg-white mx-[1px]"></div><div class="w-2 h-full bg-white mx-[1px]"></div><div class="w-1 h-full bg-white mx-[1px]"></div>
                    <div class="w-3 h-full bg-white mx-[1px]"></div><div class="w-1 h-full bg-white mx-[1px]"></div><div class="w-2 h-full bg-white mx-[1px]"></div>
                    <div class="w-1 h-full bg-white mx-[1px]"></div><div class="w-4 h-full bg-white mx-[1px]"></div><div class="w-1 h-full bg-white mx-[1px]"></div>
                    <div class="w-2 h-full bg-white mx-[1px]"></div><div class="w-1 h-full bg-white mx-[1px]"></div><div class="w-2 h-full bg-white mx-[1px]"></div>
                </div>
                <p class="text-[10px] text-gray-500 mt-2 tracking-widest uppercase">Please present at exit gate</p>
            </div>
        </div>

        <div class="mt-8 text-center">
            <a href="index.jsp" class="inline-block px-8 py-3 rounded-full border border-gray-700 text-gray-400 text-sm font-semibold hover:border-[#00e5ff] hover:text-[#00e5ff] transition-all">
                Close & Return to Homepage
            </a>
        </div>
    </div>
</body>
</html>