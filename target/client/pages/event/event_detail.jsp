<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.dBConnection" %>
<%
    // Get the 'type' parameter from the URL
    String type = request.getParameter("type");

    // Set default values for title, image, and link
    String title = "Event";
    String imagePath = "";
    String eventLink = "#"; // Default empty link
    boolean eventFound = false;

    // Query the database for the event details
    try (Connection conn = dBConnection.getConnection()) {
        String sql = "SELECT title, minio_url, facebook_url FROM events WHERE type = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, type);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            imagePath = rs.getString("minio_url");
            eventLink = rs.getString("facebook_url") != null ? rs.getString("facebook_url") : "#";
            eventFound = true;
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
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
            .container{
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
        <% if (eventFound && !imagePath.isEmpty()) { %>
            <a href="<%= eventLink %>" class="event-link" target="_blank">
                <img src="<%= imagePath %>" alt="<%= title %>" class="event-image">
            </a>
        <% } else { %>
            <p class="no-event">No event available.</p>
        <% } %>
    </div>
    <jsp:include page="../footer.jsp" />
    <script type="text/javascript">
        // Add touch feedback for mobile devices
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