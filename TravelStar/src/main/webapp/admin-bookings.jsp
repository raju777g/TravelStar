<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.travelstar.model.Booking" %>
<%@ page import="com.travelstar.model.User" %>
<%@ page import="com.travelstar.dao.BookingDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getUsername())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings - TravelStar Admin</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1><a href="admin-dashboard.jsp" style="color: white; text-decoration: none;">TravelStar Admin</a></h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="admin-dashboard.jsp">Dashboard</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <h2 style="text-align: center; margin: 2rem 0;">All Bookings</h2>
        
        <% if (bookings != null && !bookings.isEmpty()) { %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer</th>
                            <th>Destination</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Booking Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Booking booking : bookings) { %>
                            <tr>
                                <td>#<%= booking.getBookingId() %></td>
                                <td><%= booking.getUserName() %></td>
                                <td><%= booking.getDestinationName() %></td>
                                <td><%= booking.getStartDate() %></td>
                                <td><%= booking.getEndDate() %></td>
                                <td>₹<%= booking.getTotalAmount() %></td>
                                <td>
                                    <span style="padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.8rem; 
                                          background: <%= "CONFIRMED".equals(booking.getStatus()) ? "#d4edda" : 
                                                         "CANCELLED".equals(booking.getStatus()) ? "#f8d7da" : "#fff3cd" %>;
                                          color: <%= "CONFIRMED".equals(booking.getStatus()) ? "#155724" : 
                                                    "CANCELLED".equals(booking.getStatus()) ? "#721c24" : "#856404" %>;">
                                        <%= booking.getStatus() %>
                                    </span>
                                </td>
                                <td><%= booking.getBookingDate() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div style="text-align: center; margin: 3rem 0;">
                <h3>No bookings found</h3>
                <p>No customers have made bookings yet.</p>
                <a href="admin-dashboard.jsp" class="btn">Back to Dashboard</a>
            </div>
        <% } %>
        
        <div style="text-align: center; margin: 2rem 0;">
            <a href="admin-dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
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