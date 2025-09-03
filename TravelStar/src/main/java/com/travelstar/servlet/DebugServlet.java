package com.travelstar.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.travelstar.dao.DestinationDAO;
import com.travelstar.model.Destination;

@WebServlet("/debug")
public class DebugServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><body>");
        out.println("<h2>Debug Information</h2>");
        
        DestinationDAO dao = new DestinationDAO();
        try {
            List<Destination> destinations = dao.getAllDestinations();
            out.println("<p>Found " + destinations.size() + " destinations</p>");
            
            for (Destination dest : destinations) {
                out.println("<p>" + dest.getName() + " - " + dest.getLocation() + "</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
        
        out.println("<p><a href='destinations'>Go to Destinations</a></p>");
        out.println("</body></html>");
    }
}