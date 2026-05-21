<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ParkSmart - Registration</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; padding-top: 50px; }
        .card { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 300px; }
        input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #0d6efd; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #0b5ed7; }
    </style>
</head>
<body>
    <div class="card">
        <h2 style="text-align: center;">User Registration</h2>
        <form action="register" method="post">
            <input type="text" name="fullName" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Create Password" required>
            <button type="submit">Create Account</button>
        </form>
    </div>
</body>
</html>