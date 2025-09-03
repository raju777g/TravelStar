package com.travelstar.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.travelstar.util.DatabaseConnection;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><body>");
        out.println("<h2>TravelStar Test Page</h2>");
        
        try {
            Connection conn = DatabaseConnection.getConnection();
            if (conn != null) {
                out.println("<p style='color: green;'>✓ Database connection successful!</p>");
                conn.close();
            }
        } catch (Exception e) {
            out.println("<p style='color: red;'>✗ Database connection failed: " + e.getMessage() + "</p>");
        }
        
        out.println("<p><a href='index.jsp'>Go to Home</a></p>");
        out.println("</body></html>");
    }
}