package com.travelstar.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int userId;
    private int destinationId;
    private Date bookingDate;
    private Date startDate;
    private Date endDate;
    private BigDecimal totalAmount;
    private String status;
    private Timestamp createdAt;
    
    // Additional fields for display
    private String userName;
    private String destinationName;
    
    public Booking() {}
    
    public Booking(int userId, int destinationId, Date startDate, Date endDate, BigDecimal totalAmount) {
        this.userId = userId;
        this.destinationId = destinationId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalAmount = totalAmount;
        this.bookingDate = new Date(System.currentTimeMillis());
        this.status = "PENDING";
    }
    
    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }
    
    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }
    
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    
    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
    
    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public String getDestinationName() { return destinationName; }
    public void setDestinationName(String destinationName) { this.destinationName = destinationName; }
}