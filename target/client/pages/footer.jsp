<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<%
    String admissionUrl = ConfigUtil.getProperty("admission.url");
%>

<!-- Footer Section -->
<footer id="footer">
    <div class="footer-container">
        <!-- Logo at the most left -->
        <div class="footer-logo">
            <img src="<%= request.getContextPath() %>/images/kmitl_logo.png" alt="KMUTL Logo" class="logo-image">
        </div>

        <!-- Columns Container for About Us and Student Facility -->
        <div class="columns-wrapper">
            <!-- Column 1: About Us -->
            <div class="footer-column">
                <h3>About Us</h3>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/pages/curriculum/curriculum.jsp">Curriculum</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/scholarship.jsp">Scholarship</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/collaboration.jsp">Collaboration</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/achievement.jsp">Achievement</a></li>
                </ul>
            </div>
            <!-- Column 2: Student Facility -->
            <div class="footer-column">
                <h3>Student Facility</h3>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/pages/map/map.jsp">Faculty Map</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/student_roombooking.jsp">RAI Room Booking</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/academic_calendar.jsp">Academic Calendar</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/document/document.jsp">Documents</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/announcement/announcement.jsp">Announcement</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/event/event.jsp">Events</a></li>
                </ul>
            </div>
        </div>
        <!-- Column 3: Contact Us -->
        <div class="footer-column map-column">
            <h3>Contact Us</h3>
            <div class="contact-details">
                <p>
                    Robotics and AI Engineering<br>
                    School of International and Interdisciplinary Engineering<br>
                    1 Chalong Krung 1 Alley, Lat Krabang,<br>
                    Khet Lat Krabang, Krung Thep Maha Nakhon 10520<br>
                    Thailand
                </p>
                <div class="contact-information">
                    <i class="fas fa-phone"></i> +66846244535
                </div>
                <div class="contact-information">
                    Monday - Friday | 8:30 a.m. to 5:00 p.m.
                </div>
                <div class="social-media-icons">
                    <a href="https://www.facebook.com/KMITL.RoboticsAI" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://line.me/R/ti/p/@rai_kmitl" target="_blank"><i class="fab fa-line"></i></a>
                </div>
                <a href="<%= admissionUrl %>" target="_blank" class="apply-now-btn">Apply Now</a>
            </div>
        </div>
    </div>

    <!-- Map Container Below Columns -->
    <div class="map-wrapper">
        <div class="map-container">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.621972835127!2d100.77508657480229!3d13.72993580018365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e2a8d4f5f5f5f5%3A0x1b2a3c4d5e6f7a8b!2sKing+Mongkut%27s+University+of+Technology+Lat+Krabang!5e0!3m2!1sen!2sth!4v1698771234567"
                width="100%"
                height="200"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>

    <!-- Social Media and Legal Section -->
    <div class="footer-bottom">
        <div class="social-media"></div>
        <div class="legal-links"></div>
        <div class="copyright">
            © Copyright 2019 - 2025 | Department of Robotics and AI, School of Engineering, King Mongkut's Institute of Technology Ladkrabang | All Rights Reserved.
        </div>
    </div>
</footer>

<!-- Footer Styles -->
<style>
    #footer {
        background-color: #333;
        color: #ccc;
        padding: 20px 10px;
        font-family: Arial, sans-serif;
        font-size: 14px;
        line-height: 1.6;
        width: 100%;
        box-sizing: border-box;
    }

    .footer-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
        max-width: 100%;
        margin: 0 auto;
        padding: 0;
        border-bottom: 1px solid #444;
    }

    .footer-logo {
        margin-right: 15px;
        display: flex;
        align-items: center;
    }

    .logo-image {
        height: 100px;
        width: auto;
        max-height: 100%;
    }

    .columns-wrapper {
        display: flex;
        flex-wrap: wrap;
        flex: 2;
        min-width: 0;
    }

    .footer-column {
        flex: 1;
        min-width: 150px;
        margin: 5px;
    }

    .footer-column h3 {
        color: #fff;
        font-size: 16px;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
    }

    .footer-column ul li {
        margin-bottom: 5px;
    }

    .footer-column ul li a {
        color: #ccc;
        text-decoration: none;
        transition: color 0.3s;
    }

    .footer-column ul li a:hover {
        color: #fff;
    }

    .footer-column p {
        margin: 0 0 5px;
    }

    .map-column {
        flex: 1;
        min-width: 200px;
    }

    .contact-details {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .contact-information {
        display: flex;
        align-items: center;
        color: #ccc;
    }

    .contact-icon-link {
        display: flex;
        align-items: center;
        color: #ccc;
        text-decoration: none;
        transition: color 0.3s;
    }

    .contact-icon-link:hover {
        color: #fff;
    }

    .contact-information i, .contact-icon-link i {
        margin-right: 5px;
        font-size: 16px;
    }

    .social-media-icons {
        display: flex;
        gap: 5px;
        margin-top: 5px;
    }

    .social-media-icons a {
        color: #ccc;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s;
    }

    .social-media-icons a:hover {
        color: #fff;
    }

    .apply-now-btn {
        display: inline-block;
        margin-top: 5px;
        padding: 8px 15px;
        background-color: #e35205;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s;
        font-size: 12px;
        text-align: center;
    }

    .apply-now-btn:hover {
        background-color: #e65c00;
    }

    .map-wrapper {
        width: 100%;
        max-width: 1200px;
        margin: 10px auto 0;
    }

    .map-container {
        width: 100%;
        height: 200px;
        overflow: hidden;
        border-radius: 0;
    }

    .map-container iframe {
        width: 100%;
        height: 100%;
    }

    .footer-bottom {
        text-align: center;
        padding-top: 10px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .social-media {
        margin-bottom: 10px;
    }

    .legal-links {
        margin-bottom: 5px;
    }

    .copyright {
        margin-top: 5px;
        font-size: 10px;
        color: #999;
    }

    /* Responsive Design */
    @media screen and (max-width: 1200px) {
        .footer-container {
            max-width: 100%;
        }

        .map-wrapper {
            max-width: 100%;
        }

        .map-container {
            height: 200px;
        }
    }

    @media screen and (max-width: 768px) {
        .footer-container {
            flex-direction: column;
        }

        .footer-logo {
            justify-content: center; /* Center horizontally within the flex container */
            width: 100%; /* Ensure it takes full width to allow centering */
            margin-right: 0;
        }

        .columns-wrapper {
            flex-direction: column;
        }

        .footer-column {
            margin-bottom: 10px;
            min-width: 100%;
        }

        .map-container {
            height: 150px;
        }

        .logo-image {
            height: 80px;
        }
    }

    @media screen and (max-width: 480px) {
        #footer {
            padding: 10px;
        }

        .footer-column h3 {
            font-size: 12px;
        }

        .footer-column ul li a, .footer-column p {
            font-size: 10px;
        }

        .map-container {
            height: 120px;
        }

        .logo-image {
            height: 60px;
        }

        .contact-information i, .social-media-icons a {
            font-size: 12px;
        }

        .apply-now-btn {
            padding: 5px 10px;
            font-size: 10px;
        }
    }
</style>

<!-- Font Awesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">