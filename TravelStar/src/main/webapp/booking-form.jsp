<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travelstar.model.Destination" %>
<%@ page import="com.travelstar.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Destination destination = (Destination) request.getAttribute("destination");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book <%= destination.getName() %> - TravelStar</title>
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
                        <li><a href="dashboard.jsp">Dashboard</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="booking?action=myBookings">My Bookings</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="form-container">
            <h2 style="text-align: center; margin-bottom: 2rem;">Book Your Trip</h2>
            
            <div class="card" style="margin-bottom: 2rem;">
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
                    <div class="price">₹<%= destination.getPricePerDay() %>/day</div>
                </div>
            </div>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="booking" method="post" id="bookingForm" onsubmit="return validateBookingDates()">
                <input type="hidden" name="destinationId" value="<%= destination.getDestinationId() %>">
                <input type="hidden" id="pricePerDay" value="<%= destination.getPricePerDay() %>">
                
                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required onchange="calculateTotal()">
                </div>
                
                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" required onchange="calculateTotal()">
                </div>
                
                <div class="form-group">
                    <label>Total Amount:</label>
                    <div id="totalAmount" style="font-size: 1.2rem; font-weight: bold; color: #667eea;">
                        Select dates to calculate total
                    </div>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn" style="width: 100%;">Confirm Booking</button>
                </div>
            </form>
            
            <div style="text-align: center; margin-top: 1rem;">
                <a href="destinations" class="btn btn-secondary">Back to Destinations</a>
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