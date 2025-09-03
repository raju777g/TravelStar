package com.travelstar.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Destination {
    private int destinationId;
    private String name;
    private String description;
    private String location;
    private BigDecimal pricePerDay;
    private String imageUrl;
    private double rating;
    private Timestamp createdAt;
    
    public Destination() {}
    
    public Destination(String name, String description, String location, BigDecimal pricePerDay, String imageUrl) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.pricePerDay = pricePerDay;
        this.imageUrl = imageUrl;
    }
    
    // Getters and Setters
    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    
    public BigDecimal getPricePerDay() { return pricePerDay; }
    public void setPricePerDay(BigDecimal pricePerDay) { this.pricePerDay = pricePerDay; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}