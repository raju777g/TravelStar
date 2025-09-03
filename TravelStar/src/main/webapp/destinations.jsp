<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.travelstar.model.Destination" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destinations - TravelStar</title>
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
                            <li><a href="logout.jsp">Logout</a></li>
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
        <h2 style="text-align: center; margin: 2rem 0;">Explore Amazing Destinations</h2>
        
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Search destinations..." 
                   value="<%= request.getAttribute("searchQuery") != null ? request.getAttribute("searchQuery") : "" %>">
            <button onclick="searchDestinations()" class="btn">Search</button>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <%
            List<Destination> destinations = (List<Destination>) request.getAttribute("destinations");
            if (destinations != null && !destinations.isEmpty()) {
        %>
            <div class="card-grid">
                <% for (Destination destination : destinations) { %>
                    <div class="card">
                        <div style="width: 100%; height: 200px; border-radius: 10px 10px 0 0; overflow: hidden;">
                            <img src="<%= destination.getImageUrl() %>" alt="<%= destination.getName() %>" 
                                 style="width: 100%; height: 100%; object-fit: cover;"
                                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                            <div style="width: 100%; height: 100%; background: linear-gradient(45deg, #667eea, #764ba2); 
                                        display: none; align-items: center; justify-content: center; color: white; font-size: 1.2rem;">
                                🏖️ <%= destination.getName() %>
                            </div>
                        </div>
                        <div class="card-content">
                            <h3><%= destination.getName() %></h3>
                            <p><strong>Location:</strong> <%= destination.getLocation() %></p>
                            <p><%= destination.getDescription() %></p>
                            <div class="rating">
                                <% for (int i = 1; i <= 5; i++) { %>
                                    <span style="color: <%= i <= destination.getRating() ? "#ffc107" : "#ddd" %>">★</span>
                                <% } %>
                                (<%= destination.getRating() %>)
                            </div>
                            <div class="price">₹<%= destination.getPricePerDay() %>/day</div>
                            <div style="margin-top: 1rem;">
                                <a href="destinations?action=view&id=<%= destination.getDestinationId() %>" class="btn">View Details</a>
                                <% if (session.getAttribute("user") != null) { %>
                                    <a href="booking?action=book&destinationId=<%= destination.getDestinationId() %>" class="btn btn-secondary">Book Now</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <div style="text-align: center; margin: 3rem 0;">
                <h3>No destinations found</h3>
                <p>Try searching with different keywords or browse all destinations.</p>
                <a href="destinations" class="btn">View All Destinations</a>
            </div>
        <% } %>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 TravelStar. All rights reserved.</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>