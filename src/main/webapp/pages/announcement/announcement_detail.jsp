<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
    // Get the 'type' parameter from the URL
    String type = request.getParameter("type");

    // Set default values for title and image
    String title = "Announcement";
    String imagePath = "";

    if ("pm25".equals(type)) {
        title = "Studying Plan during PM 2.5";
        imagePath = "../../images/pm25announcement.png";
    } else if ("engjobfair".equals(type)) {
        title = "Engineering Job Fair";
        imagePath = "../../images/jobfair.jpg";
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
        }
    
        /* Back button (optional, not in HTML yet) */
        .back-button {
            position: fixed;
            top: 20px; /* Adjusted for responsiveness */
            left: 20px;
            z-index: 1000; /* Below sidemenu (z-index: 1100) */
        }
    
        .back-button img {
            width: 50px; /* Smaller default for responsiveness */
            height: 50px;
            transition: transform 0.3s ease;
        }

        .back-button:hover img {
            transform: scale(1.1); /* Slight scale on hover */
        }
    
        /* Container for content */
        .container {
            width: 100%;
            max-width: 900px;
            margin-top: 20px;
            text-align: center;
            padding: 0 20px; /* Add padding for small screens */
        }
    
        /* Title styling */
        .title {
            text-align: center;
            margin: 80px 0 20px;
            font-weight: bold;
            font-size: 65px;
            padding-top: 120px; /* Space for hamburger menu */
        }

        /* Announcement image */
        .announcement-image {
            width: 100%;
            max-width: 900px;
            border-radius: 10px;
            margin: 20px 0;
            display: block; /* Ensure it behaves as a block element */
        }
    
        /* Main menu button (optional, not in HTML yet) */
        .mainmenu-button {
            display: block;
            width: 100%;
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ff5722;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-size: 40px;
            font-weight: bold;
            transition: background-color 0.2s ease;
            text-decoration: none;
        }

        .mainmenu-button:hover {
            background-color: #f4511e;
        }

        /* No announcement message */
        .no-announcement {
            font-size: 20px;
            color: #666;
            margin: 20px 0;
        }

        /* Large screens (e.g., desktops > 1200px) */
        @media screen and (min-width: 1026px) {
            .back-button img {
                width: 80px;
                height: 80px;
            }
            .title {
                font-size: 65px;
                padding-top: 95px; /* More space for larger screens */
            }
            .container {
                padding: 0 30px;
            }
            .announcement-image {
                max-width: 900px;
            }
            .mainmenu-button {
                max-width: 900px;
                font-size: 40px;
                padding: 20px;
            }
            .no-announcement {
                font-size: 20px;
            }
        }

        /* Medium screens (e.g., tablets, 769px - 1200px) */
        @media screen and (max-width: 1025px) and (min-width: 769px) {
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 60px;
                height: 60px;
            }
            .title {
                font-size: 50px;
                padding-top: 50px;
            }
            .container {
                padding: 0 25px;
            }
            .announcement-image {
                max-width: 100%; /* Full width within container */
            }
            .mainmenu-button {
                max-width: 100%;
                font-size: 32px;
                padding: 15px;
            }
            .no-announcement {
                font-size: 18px;
            }
        }

        /* Small screens (e.g., mobile, <= 768px) */
        @media screen and (max-width: 768px) {
            .back-button {
                top: 10px;
                left: 10px;
            }
            .back-button img {
                width: 40px;
                height: 40px;
            }
            .title {
                font-size: 32px;
                padding-top: 60px; /* Space for hamburger menu */
                margin: 20px 0;
            }
            .container {
                padding: 0 15px;
            }
            .announcement-image {
                max-width: 100%;
            }
            .mainmenu-button {
                max-width: 90%;
                font-size: 24px;
                padding: 12px;
            }
            .no-announcement {
                font-size: 16px;
                margin: 15px 0;
            }
        }

        /* Very small screens (e.g., < 480px) */
        @media screen and (max-width: 480px) {
            .back-button {
                top: 5px;
                left: 5px;
            }
            .back-button img {
                width: 30px;
                height: 30px;
            }
            .title {
                font-size: 24px;
                padding-top: 60px;
                margin: 15px 0;
            }
            .container {
                padding: 0 10px;
            }
            .announcement-image {
                max-width: 100%;
            }
            .mainmenu-button {
                max-width: 90%;
                font-size: 18px;
                padding: 10px;
            }
            .no-announcement {
                font-size: 14px;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <h2 class="title">Announcement</h2>
    <div class="container">
        <% if (!imagePath.isEmpty()) { %>
            <img src="<%= imagePath %>" alt="<%= title %>" class="announcement-image">
        <% } else { %>
            <p class="no-announcement">No announcement available.</p>
        <% } %>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>