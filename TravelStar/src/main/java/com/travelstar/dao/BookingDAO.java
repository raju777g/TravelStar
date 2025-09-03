package com.travelstar.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.travelstar.model.Booking;
import com.travelstar.util.DatabaseConnection;

public class BookingDAO {
    
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, destination_id, booking_date, start_date, end_date, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getDestinationId());
            stmt.setDate(3, booking.getBookingDate());
            stmt.setDate(4, booking.getStartDate());
            stmt.setDate(5, booking.getEndDate());
            stmt.setBigDecimal(6, booking.getTotalAmount());
            stmt.setString(7, booking.getStatus());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, u.full_name as user_name, d.name as destination_name " +
                    "FROM bookings b " +
                    "JOIN users u ON b.user_id = u.user_id " +
                    "JOIN destinations d ON b.destination_id = d.destination_id " +
                    "WHERE b.user_id = ? ORDER BY b.created_at DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setDestinationId(rs.getInt("destination_id"));
                booking.setBookingDate(rs.getDate("booking_date"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setTotalAmount(rs.getBigDecimal("total_amount"));
                booking.setStatus(rs.getString("status"));
                booking.setCreatedAt(rs.getTimestamp("created_at"));
                booking.setUserName(rs.getString("user_name"));
                booking.setDestinationName(rs.getString("destination_name"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, u.full_name as user_name, d.name as destination_name " +
                    "FROM bookings b " +
                    "JOIN users u ON b.user_id = u.user_id " +
                    "JOIN destinations d ON b.destination_id = d.destination_id " +
                    "ORDER BY b.created_at DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setDestinationId(rs.getInt("destination_id"));
                booking.setBookingDate(rs.getDate("booking_date"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setTotalAmount(rs.getBigDecimal("total_amount"));
                booking.setStatus(rs.getString("status"));
                booking.setCreatedAt(rs.getTimestamp("created_at"));
                booking.setUserName(rs.getString("user_name"));
                booking.setDestinationName(rs.getString("destination_name"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}