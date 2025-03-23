<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.LocalDate" %>
<%
    // Get the 'type' parameter from the URL
    String type = request.getParameter("type");

    // Set default values for title, image, and link
    String title = "Event";
    String imagePath = "";
    String eventLink = "#";

    // Database connection details
    String DB_URL = "jdbc:mysql://localhost:3306/webapp_db";
    String DB_USER = "username";
    String DB_PASS = "password";

    // Current date
    LocalDate today = LocalDate.now();

    // Update event_type based on end_date and fetch event data
    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
        // Update finished events
        String updateSql = "UPDATE event_links SET event_type = 'finished' WHERE end_date < ? AND event_type = 'ongoing'";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setDate(1, java.sql.Date.valueOf(today));
        updateStmt.executeUpdate();

        // Fetch event data for the given type
        if (type != null && !type.isEmpty()) {
            String selectSql = "SELECT minio_url, facebook_url, title, event_type FROM event_links WHERE type = ?";
            PreparedStatement stmt = conn.prepareStatement(selectSql);
            stmt.setString(1, type);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                imagePath = rs.getString("minio_url");
                eventLink = rs.getString("facebook_url");
                title = rs.getString("title") + " (" + rs.getString("event_type") + ")";
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Log this properly in production
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            min-height: 100vh;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 15px;
        }
        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 100;
        }
        .back-button img {
            width: 50px;
            height: 50px;
        }
        .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            padding: 20px 0;
        }
        .title {
            text-align: center;
            margin: 80px 0 20px;
            font-size: 40px;
            font-weight: bold;
        }
        .event-link {
            display: block;
            cursor: pointer;
            transition: transform 0.2s;
            margin-bottom: 80px;
        }
        .event-link:hover {
            transform: scale(1.02);
        }
        .event-image {
            width: 100%;
            max-width: 900px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .mainmenu-button {
            display: block;
            width: 100%;
            max-width: 900px;
            margin: 30px auto;
            padding: 15px;
            background-color: #ff5722;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-size: 24px;
            font-weight: bold;
            transition: background-color 0.2s;
            text-decoration: none;
        }
        .mainmenu-button:hover {
            background-color: #f4511e;
        }
        .no-event {
            margin: 40px 0;
            font-size: 18px;
            color: #666;
        }
        @media screen and (min-width: 1026px) {
            .title {
                font-size: 38px;
                padding-top: 90px;
            }
        }
        @media screen and (max-width: 1025px) {
            .title {
                font-size: 38px;
                padding-top: 50px;
            }
        }
        @media screen and (max-width: 768px) {
            .title {
                font-size: 26px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 40px;
                height: 40px;
            }
            .mainmenu-button {
                font-size: 20px;
                padding: 12px;
            }
        }
        @media screen and (max-width: 480px) {
            .title {
                font-size: 17px;
                padding-top: 40px;
                margin-top: 50px;
            }
            .container {
                margin-bottom: 50px;
            }
            .back-button img {
                width: 35px;
                height: 35px;
            }
            .mainmenu-button {
                font-size: 18px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title"><%= title %></div>
    <div class="container">
        <% if (!imagePath.isEmpty()) { %>
            <a href="<%= eventLink %>" class="event-link" target="_blank">
                <img src="<%= imagePath %>" alt="<%= title %>" class="event-image">
            </a>
        <% } else { %>
            <p class="no-event">No event available for type: <%= type != null ? type : "unknown" %></p>
        <% } %>
    </div>
    <jsp:include page="../footer.jsp" />
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            const eventLink = document.querySelector('.event-link');
            if (eventLink) {
                eventLink.addEventListener('touchstart', function() {
                    this.style.opacity = '0.8';
                });
                eventLink.addEventListener('touchend', function() {
                    this.style.opacity = '1';
                });
            }
        });
    </script>
</body>
</html>