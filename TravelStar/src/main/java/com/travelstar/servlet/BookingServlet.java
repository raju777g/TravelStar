package com.travelstar.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.travelstar.dao.BookingDAO;
import com.travelstar.dao.DestinationDAO;
import com.travelstar.model.Booking;
import com.travelstar.model.Destination;
import com.travelstar.model.User;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();
    private DestinationDAO destinationDAO = new DestinationDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        if ("book".equals(action)) {
            int destinationId = Integer.parseInt(request.getParameter("destinationId"));
            Destination destination = destinationDAO.getDestinationById(destinationId);
            request.setAttribute("destination", destination);
            request.getRequestDispatcher("booking-form.jsp").forward(request, response);
        } else if ("myBookings".equals(action)) {
            List<Booking> bookings = bookingDAO.getBookingsByUserId(user.getUserId());
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("my-bookings.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        
        Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);
        
        // Calculate total amount
        Destination destination = destinationDAO.getDestinationById(destinationId);
        long days = ChronoUnit.DAYS.between(LocalDate.parse(startDateStr), LocalDate.parse(endDateStr));
        BigDecimal totalAmount = destination.getPricePerDay().multiply(BigDecimal.valueOf(days));
        
        Booking booking = new Booking(user.getUserId(), destinationId, startDate, endDate, totalAmount);
        
        if (bookingDAO.createBooking(booking)) {
            response.sendRedirect("booking?action=myBookings");
        } else {
            request.setAttribute("error", "Failed to create booking. Please try again.");
            Destination dest = destinationDAO.getDestinationById(destinationId);
            request.setAttribute("destination", dest);
            request.getRequestDispatcher("booking-form.jsp").forward(request, response);
        }
    }
}