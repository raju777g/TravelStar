package com.travelstar.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travelstar.dao.DestinationDAO;
import com.travelstar.model.Destination;

@WebServlet("/destinations")
public class DestinationServlet extends HttpServlet {
    private DestinationDAO destinationDAO = new DestinationDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String search = request.getParameter("search");
        
        List<Destination> destinations;
        
        try {
            if (search != null && !search.trim().isEmpty()) {
                destinations = destinationDAO.searchDestinations(search);
            } else {
                destinations = destinationDAO.getAllDestinations();
            }
            
            // If no destinations found, create sample data
            if (destinations.isEmpty()) {
                destinations = createSampleDestinations();
            }
        } catch (Exception e) {
            e.printStackTrace();
            destinations = createSampleDestinations();
            request.setAttribute("error", "Using sample data. Database error: " + e.getMessage());
        }
        
        request.setAttribute("destinations", destinations);
        request.setAttribute("searchQuery", search);
        
        if ("view".equals(action)) {
            try {
                int destinationId = Integer.parseInt(request.getParameter("id"));
                Destination destination = destinationDAO.getDestinationById(destinationId);
                if (destination != null) {
                    request.setAttribute("destination", destination);
                    request.getRequestDispatcher("/destination-details.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Destination not found");
                    request.getRequestDispatcher("/destinations.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error loading destination details");
                request.getRequestDispatcher("/destinations.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/destinations.jsp").forward(request, response);
        }
    }
    
    private List<Destination> createSampleDestinations() {
        List<Destination> destinations = new java.util.ArrayList<>();
        
        Destination goa = new Destination();
        goa.setDestinationId(1);
        goa.setName("Goa Beach Paradise");
        goa.setDescription("Beautiful beaches with golden sand and crystal clear water");
        goa.setLocation("Goa, India");
        goa.setPricePerDay(new java.math.BigDecimal("2500.00"));
        goa.setImageUrl("images/goa.jpg");
        goa.setRating(4.5);
        destinations.add(goa);
        
        Destination kerala = new Destination();
        kerala.setDestinationId(2);
        kerala.setName("Kerala Backwaters");
        kerala.setDescription("Serene backwaters with traditional houseboats");
        kerala.setLocation("Kerala, India");
        kerala.setPricePerDay(new java.math.BigDecimal("3000.00"));
        kerala.setImageUrl("images/a.jpeg");
        kerala.setRating(4.7);
        destinations.add(kerala);
        
        Destination rajasthan = new Destination();
        rajasthan.setDestinationId(3);
        rajasthan.setName("Rajasthan Desert Safari");
        rajasthan.setDescription("Experience the royal heritage and desert adventure");
        rajasthan.setLocation("Rajasthan, India");
        rajasthan.setPricePerDay(new java.math.BigDecimal("3500.00"));
        rajasthan.setImageUrl("images/rajasthan.jpg");
        rajasthan.setRating(4.3);
        destinations.add(rajasthan);
        
        Destination himachal = new Destination();
        himachal.setDestinationId(4);
        himachal.setName("Himachal Hill Station");
        himachal.setDescription("Snow-capped mountains and peaceful valleys");
        himachal.setLocation("Himachal Pradesh, India");
        himachal.setPricePerDay(new java.math.BigDecimal("2800.00"));
        himachal.setImageUrl("images/himachal.jpg");
        himachal.setRating(4.6);
        destinations.add(himachal);
        
        Destination andaman = new Destination();
        andaman.setDestinationId(5);
        andaman.setName("Andaman Islands");
        andaman.setDescription("Pristine beaches and underwater adventures");
        andaman.setLocation("Andaman & Nicobar, India");
        andaman.setPricePerDay(new java.math.BigDecimal("4000.00"));
        andaman.setImageUrl("images/andaman.jpg");
        andaman.setRating(4.8);
        destinations.add(andaman);
        
        return destinations;
    }
}