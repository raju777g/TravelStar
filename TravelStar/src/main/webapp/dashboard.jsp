<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travelstar.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - TravelStar</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1><a href="index.jsp" style="color: white; text-decoration: none;">TravelStar</a></h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="booking?action=myBookings">My Bookings</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div style="margin: 2rem 0;">
            <h2>Welcome, <%= user.getFullName() %>!</h2>
            <p>Manage your travel bookings and explore new destinations.</p>
        </div>

        <div class="card-grid">
            <div class="card">
                <div class="card-content">
                    <h3>🎯 Book New Trip</h3>
                    <p>Discover amazing destinations and book your next adventure.</p>
                    <a href="destinations" class="btn">Explore Destinations</a>
                </div>
            </div>
            
            <div class="card">
                <div class="card-content">
                    <h3>📋 My Bookings</h3>
                    <p>View and manage your current and past bookings.</p>
                    <a href="booking?action=myBookings" class="btn">View Bookings</a>
                </div>
            </div>
            
            <div class="card">
                <div class="card-content">
                    <h3>👤 Profile</h3>
                    <p>Update your personal information and preferences.</p>
                    <div style="margin-top: 1rem;">
                        <p><strong>Email:</strong> <%= user.getEmail() %></p>
                        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin: 3rem 0; text-align: center;">
            <h3>Quick Actions</h3>
            <div style="margin-top: 1rem;">
                <a href="destinations" class="btn" style="margin: 0 0.5rem;">Browse Destinations</a>
                <a href="booking?action=myBookings" class="btn btn-secondary" style="margin: 0 0.5rem;">My Bookings</a>
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