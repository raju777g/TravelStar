package com.travelstar.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.travelstar.model.Destination;
import com.travelstar.util.DatabaseConnection;

public class DestinationDAO {
    
    public List<Destination> getAllDestinations() {
        List<Destination> destinations = new ArrayList<>();
        String sql = "SELECT * FROM destinations ORDER BY rating DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Destination destination = new Destination();
                destination.setDestinationId(rs.getInt("destination_id"));
                destination.setName(rs.getString("name"));
                destination.setDescription(rs.getString("description"));
                destination.setLocation(rs.getString("location"));
                destination.setPricePerDay(rs.getBigDecimal("price_per_day"));
                destination.setImageUrl(rs.getString("image_url"));
                destination.setRating(rs.getDouble("rating"));
                destination.setCreatedAt(rs.getTimestamp("created_at"));
                destinations.add(destination);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destinations;
    }
    
    public Destination getDestinationById(int destinationId) {
        String sql = "SELECT * FROM destinations WHERE destination_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, destinationId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Destination destination = new Destination();
                destination.setDestinationId(rs.getInt("destination_id"));
                destination.setName(rs.getString("name"));
                destination.setDescription(rs.getString("description"));
                destination.setLocation(rs.getString("location"));
                destination.setPricePerDay(rs.getBigDecimal("price_per_day"));
                destination.setImageUrl(rs.getString("image_url"));
                destination.setRating(rs.getDouble("rating"));
                destination.setCreatedAt(rs.getTimestamp("created_at"));
                return destination;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean addDestination(Destination destination) {
        String sql = "INSERT INTO destinations (name, description, location, price_per_day, image_url, rating) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, destination.getName());
            stmt.setString(2, destination.getDescription());
            stmt.setString(3, destination.getLocation());
            stmt.setBigDecimal(4, destination.getPricePerDay());
            stmt.setString(5, destination.getImageUrl());
            stmt.setDouble(6, destination.getRating());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Destination> searchDestinations(String keyword) {
        List<Destination> destinations = new ArrayList<>();
        String sql = "SELECT * FROM destinations WHERE name LIKE ? OR location LIKE ? ORDER BY rating DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Destination destination = new Destination();
                destination.setDestinationId(rs.getInt("destination_id"));
                destination.setName(rs.getString("name"));
                destination.setDescription(rs.getString("description"));
                destination.setLocation(rs.getString("location"));
                destination.setPricePerDay(rs.getBigDecimal("price_per_day"));
                destination.setImageUrl(rs.getString("image_url"));
                destination.setRating(rs.getDouble("rating"));
                destination.setCreatedAt(rs.getTimestamp("created_at"));
                destinations.add(destination);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destinations;
    }
}