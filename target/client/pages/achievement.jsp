<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String[][] achievements = {
        {"School Satellite Competition 2024", "../images/achievement/satellite.png","https://www.facebook.com/share/14EADk8LXLW/"},
        {"Robocup Japan Open 2024", "../images/achievement/robocupjp.png","https://www.thaipbs.or.th/news/content/340116"},
        {"Robocup@Home Education Central Region Mini Challenge", "../images/achievement/robocuphome.png","https://www.instagram.com/p/CmvGj46rbOa/?utm_source=ig_web_button_share_sheet"}
    };
    String achievementLink = "https://www.facebook.com/KMITL.RoboticsAI";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Achievement</title>
    <style>
         body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }

        /* Title styling (matched to curriculum.jsp) */
        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px; /* Space for hamburger menu */
        }

        /* Content Container */
        .content {
            max-width: 90%;
            margin: 0 auto;
            padding-bottom: 20px;
            text-align: center;
        }

        /* Collaboration Section */
        .achieve-section {
            margin: 20px 0;
        }

        /* Collaboration Label */
        .label {
            background-color: #ff5722;
            color: white;
            padding: 10px;
            border-radius: 20px;
            display: inline-block;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Collaboration Images */
        .achieve-image {
            width: 100%;
            max-width: 840px;
            border-radius: 30px;
            display: block;
            margin: 0 auto;
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }

        .achieve-image:hover {
            transform: scale(1.05);
        }

        /* More Info Button */
        .moreinfo-button {
            display: block;
            width: 80%;
            max-width: 750px;
            margin: 20px auto;
            padding: 15px;
            background-color: #ff5722;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.2s, transform 0.2s;
        }

        .moreinfo-button:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }

        /* Responsive Design for Title and Other Elements */
        /* Larger screens (e.g., desktops > 1200px) */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 150px; /* More space for larger screens */
            }
        }

        /* Medium screens (e.g., tablets, 768px - 1200px) */
        @media screen and (max-width: 1025px) and (min-width: 769px) {
            .page-title {
                font-size: 50px;
                margin-top: 50px;
            }
            .label {
                font-size: 18px;
            }
            .moreinfo-button {
                font-size: 20px;
            }
        }

        /* Small screens (e.g., mobile, <= 768px) */
        @media screen and (max-width: 768px) {
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .label {
                font-size: 16px;
                padding: 8px;
            }
            .achieve-image {
                max-width: 100%;
            }
            .moreinfo-button {
                font-size: 18px;
                width: 90%;
            }
        }

        /* Very small screens (e.g., < 480px) */
        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                padding-top: 20px;
            }
            .label {
                font-size: 14px;
                padding: 6px;
            }
            .moreinfo-button {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="menubar.jsp" />
    <div class="page-title">Achievement</div>
    <div class="content">
        <% for (String[] achieve : achievements) { %>
            <div class="achieve-section">
                <div class="label"><%= achieve[0] %></div>
                <a href="<%= achieve[2] %>" target="_blank">
                    <img src="<%= achieve[1] %>" alt="<%= achieve[0] %>" class="achieve-image">
                </a>
            </div>
        <% } %>

        <a href="<%= achievementLink %>" class="moreinfo-button" target="_blank">FOR MORE INFORMATION</a>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
