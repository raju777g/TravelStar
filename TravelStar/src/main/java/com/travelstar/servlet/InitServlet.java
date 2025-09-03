package com.travelstar.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import com.travelstar.util.DatabaseConnection;

@WebServlet(value = "/init", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("TravelStar Application Starting...");
        
        // Test database connection
        try {
            Connection conn = DatabaseConnection.getConnection();
            if (conn != null) {
                System.out.println("✓ Database connection successful!");
                conn.close();
            }
        } catch (Exception e) {
            System.err.println("✗ Database connection failed: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("TravelStar Application Started Successfully!");
    }
}