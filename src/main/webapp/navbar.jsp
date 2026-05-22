<style>
    /* Cinematic & Minimalist Global Theme */
    :root {
        --bg-color: #0a0a0a;
        --card-bg: rgba(255, 255, 255, 0.03);
        --text-main: #f0f0f0;
        --text-muted: #888;
        --accent: #ffffff;
        --border-color: rgba(255, 255, 255, 0.1);
    }
    body {
        background-color: var(--bg-color);
        color: var(--text-main);
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        margin: 0;
        padding: 0;
    }
    .navbar {
        background: rgba(10, 10, 10, 0.8);
        backdrop-filter: blur(10px);
        border-bottom: 1px solid var(--border-color);
        padding: 15px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    .navbar .logo {
        font-size: 1.2rem;
        font-weight: 600;
        letter-spacing: 2px;
        color: var(--accent);
        text-decoration: none;
        text-transform: uppercase;
    }
    .nav-links a {
        color: var(--text-muted);
        text-decoration: none;
        margin-left: 30px;
        font-size: 0.9rem;
        transition: color 0.3s ease;
    }
    .nav-links a:hover {
        color: var(--accent);
    }
    .btn-primary {
        background: var(--text-main);
        color: var(--bg-color);
        padding: 10px 24px;
        border: none;
        border-radius: 4px;
        font-weight: 500;
        cursor: pointer;
        transition: transform 0.2s ease;
    }
    .btn-primary:hover {
        transform: translateY(-2px);
    }
</style>

<nav class="navbar">
    <a href="dashboard.jsp" class="logo">ParkSmart.</a>
    <div class="nav-links">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="add-vehicle.jsp">Vehicles</a>
        <a href="book-slot.jsp">Reservations</a>
        <% if (request.getSession().getAttribute("currentUser") != null) { %>
            <a href="index.jsp" style="color: #ff4444;">Logout</a>
        <% } else { %>
            <a href="login.jsp">Sign In</a>
        <% } %>
    </div>
</nav>