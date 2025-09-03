<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travelstar.model.Destination" %>
<%
    Destination destination = (Destination) request.getAttribute("destination");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= destination.getName() %> - TravelStar</title>
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
                        <% if (session.getAttribute("user") != null) { %>
                            <li><a href="dashboard.jsp">Dashboard</a></li>
                            <li><a href="logout">Logout</a></li>
                        <% } else { %>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register.jsp">Register</a></li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div style="margin: 2rem 0;">
            <div class="card" style="max-width: 800px; margin: 0 auto;">
                <div style="width: 100%; height: 300px; border-radius: 10px 10px 0 0; overflow: hidden;">
                    <img src="<%= destination.getImageUrl() %>" alt="<%= destination.getName() %>" 
                         style="width: 100%; height: 100%; object-fit: cover;"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                    <div style="width: 100%; height: 100%; background: linear-gradient(45deg, #667eea, #764ba2); 
                                display: none; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                        🏖️ <%= destination.getName() %>
                    </div>
                </div>
                <div class="card-content">
                    <h2><%= destination.getName() %></h2>
                    <p><strong>Location:</strong> <%= destination.getLocation() %></p>
                    <div class="rating" style="margin: 1rem 0;">
                        <% for (int i = 1; i <= 5; i++) { %>
                            <span style="color: <%= i <= destination.getRating() ? "#ffc107" : "#ddd" %>; font-size: 1.5rem;">★</span>
                        <% } %>
                        (<%= destination.getRating() %>/5)
                    </div>
                    <p style="margin: 1rem 0; line-height: 1.6;"><%= destination.getDescription() %></p>
                    <div class="price" style="font-size: 1.5rem; margin: 1rem 0;">₹<%= destination.getPricePerDay() %>/day</div>
                    
                    <div style="margin-top: 2rem;">
                        <% if (session.getAttribute("user") != null) { %>
                            <a href="booking?action=book&destinationId=<%= destination.getDestinationId() %>" class="btn">Book Now</a>
                        <% } else { %>
                            <a href="login.jsp" class="btn">Login to Book</a>
                        <% } %>
                        <a href="destinations" class="btn btn-secondary">Back to Destinations</a>
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