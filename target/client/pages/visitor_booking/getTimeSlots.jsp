<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.ReservationDAO" %> 
<%
    // Get selected date from request
    String selectedDate = request.getParameter("date");
    
    if (selectedDate == null || selectedDate.isEmpty()) {
        out.println("<p>Error: No date selected</p>");
        return;
    }
    
    try {
        // Initialize DAO
        ReservationDAO bookingDAO = new ReservationDAO();
        
        // Get all time slots
        List<String> allTimeSlots = Arrays.asList(
            "09:00-09:30", "09:30-10:00", "10:00-10:30", "10:30-11:00",
            "11:00-11:30", "11:30-12:00", "13:00-13:30", "13:30-14:00",
            "14:00-14:30", "14:30-15:00", "15:00-15:30", "15:30-16:00"
        );
        
        // Get booked slots for both labs
        Map<String, List<String>> bookingDetails = bookingDAO.getDetailedBookingByDate(selectedDate);
        
        // Robotics Lab slots
        List<String> roboticsBookedSlots = bookingDetails.get("HM Building, Robotics Lab");
        
        // Future Lab slots
        List<String> futureLabBookedSlots = bookingDetails.get("E-12 Building, Future Lab");
%>
    <!-- Robotics Lab Time Slots -->
    <div class="lab-slots">
        <h3>Robotics Lab</h3>
        <div class="slots-grid">
            <% for (String slot : allTimeSlots) { 
                boolean isBooked = roboticsBookedSlots.contains(slot);
            %>
                <div class="time-slot <%= isBooked ? "slot-booked" : "slot-available" %>" 
                     <%= !isBooked ? "data-lab=\"HM Building, Robotics Lab\" data-slot=\"" + slot + "\"" : "" %>>
                    <%= slot %>
                </div>
            <% } %>
        </div>
    </div>
    
    <!-- Future Lab Time Slots -->
    <div class="lab-slots">
        <h3>Future Lab</h3>
        <div class="slots-grid">
            <% for (String slot : allTimeSlots) { 
                boolean isBooked = futureLabBookedSlots.contains(slot);
            %>
                <div class="time-slot <%= isBooked ? "slot-booked" : "slot-available" %>" 
                     <%= !isBooked ? "data-lab=\"E-12 Building, Future Lab\" data-slot=\"" + slot + "\"" : "" %>>
                    <%= slot %>
                </div>
            <% } %>
        </div>
    </div>
<%
    } catch (Exception e) {
        out.println("<p>Error loading time slots: " + e.getMessage() + "</p>");
    }
%>