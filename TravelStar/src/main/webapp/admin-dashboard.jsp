<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travelstar.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getUsername())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - TravelStar</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1><a href="index.jsp" style="color: white; text-decoration: none;">TravelStar Admin</a></h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="admin-bookings.jsp">All Bookings</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div style="margin: 2rem 0;">
            <h2>Admin Dashboard</h2>
            <p>Welcome, <%= user.getFullName() %>! Manage your travel business here.</p>
        </div>

        <div class="card-grid">
            <div class="card">
                <div class="card-content">
                    <h3>📋 Manage Bookings</h3>
                    <p>View and manage all customer bookings, update booking status.</p>
                    <a href="admin-bookings.jsp" class="btn">View All Bookings</a>
                </div>
            </div>
            
            <div class="card">
                <div class="card-content">
                    <h3>🏖️ Manage Destinations</h3>
                    <p>Add new destinations and manage existing travel packages.</p>
                    <a href="destinations" class="btn">View Destinations</a>
                </div>
            </div>
            
            <div class="card">
                <div class="card-content">
                    <h3>👥 User Management</h3>
                    <p>View registered users and their booking history.</p>
                    <a href="admin-users.jsp" class="btn">View Users</a>
                </div>
            </div>
        </div>

        <div style="margin: 3rem 0; text-align: center;">
            <h3>Quick Stats</h3>
            <div class="card-grid">
                <div class="card">
                    <div class="card-content" style="text-align: center;">
                        <h2 style="color: #667eea;">5</h2>
                        <p>Total Destinations</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content" style="text-align: center;">
                        <h2 style="color: #667eea;">0</h2>
                        <p>Active Bookings</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content" style="text-align: center;">
                        <h2 style="color: #667eea;">1</h2>
                        <p>Registered Users</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 TravelStar. All rights reserved.</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>