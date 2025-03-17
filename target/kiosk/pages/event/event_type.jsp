<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event</title>
    <style>
        :root {
            --primary-color: #E35205;
            --bg-color: #ffffff;
            --border-color: #ddd;
            --box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: var(--bg-color);
        }

        .back-button {
            position: fixed;
            top: 20px; /* Fixed value instead of clamp */
            left: 20px; /* Fixed value instead of clamp */
            z-index: 100;
        }
    
        .back-button img {
            width: 60px; /* Fixed value instead of clamp */
            height: auto;
            aspect-ratio: 1/1;
        }

        /* Title styling (matched to event.jsp) */
        .title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .content {
            padding: 0 15px 50px; /* Fixed value instead of clamp */
            max-width: 900px;
            margin: 0 auto;
            width: 100%;
        }

        .info-box {
            background-color: var(--bg-color);
            border: 1px solid var(--border-color);
            border-radius: 20px; /* Fixed value instead of clamp */
            padding: 20px; /* Fixed value instead of clamp */
            margin: 30px 0; /* Fixed value instead of clamp */
            cursor: pointer;
            font-size: 20px; /* Fixed value instead of clamp */
            text-align: center;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
        }

        .info-box:hover, .info-box:focus {
            transform: translateX(5px);
            box-shadow: var(--box-shadow);
            background: var(--primary-color);
            color: white;
        }

        .subtitle-header {
            background-color: var(--primary-color);
            color: white;
            padding: 20px; /* Fixed value instead of clamp */
            text-align: center;
            margin-bottom: 30px; /* Fixed value instead of clamp */
            margin-top: 20px; /* Fixed value instead of clamp */
            font-size: 30px; /* Fixed value instead of clamp */
        }

        /* Responsive Design (matched to event.jsp breakpoints) */
        @media screen and (min-width: 1026px) {
            .title {
                font-size: 50px;
                padding-top: 150px; /* More space for larger screens */
            }
            .content {
                padding: 0 20px 60px;
            }
            .info-box {
                padding: 25px;
                margin: 60px 0;
                font-size: 22px;
            }
            .subtitle-header {
                padding: 25px;
                margin-bottom: 40px;
                margin-top: 30px;
                font-size: 35px;
            }
        }

        @media screen and (max-width: 1025px) {
            .title {
                font-size: 50px;
                padding-top: 100px;
            }
            .content {
                padding: 0 15px 50px;
                margin-bottom: 100px;
            }
            .info-box {
                padding: 20px;
                margin: 60px 0;
                font-size: 20px;
            }
            .subtitle-header {
                padding: 20px;
                margin-bottom: 35px;
                margin-top: 25px;
                font-size: 30px;
            }
        }

        @media screen and (max-width: 768px) {
            .title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 50px;
            }
            .content {
                padding: 0 10px 40px;
                margin-bottom: 90px;
            }
            .info-box {
                padding: 15px;
                margin: 45px 0;
                font-size: 18px;
            }
            .subtitle-header {
                padding: 15px;
                margin-bottom: 25px;
                margin-top: 20px;
                font-size: 25px;
            }
        }

        @media screen and (max-width: 480px) {
            .title {
                font-size: 30px;
                padding-top: 40px;
                margin-top: 50px; /* Kept from event.jsp */
            }
            .content {
                padding: 0 10px 30px;
                margin-bottom: 180px;
            }
            .info-box {
                padding: 10px;
                margin: 30px 0;
                font-size: 16px;
            }
            .subtitle-header {
                padding: 10px;
                margin-bottom: 20px;
                margin-top: 15px;
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <%
        String status = request.getParameter("status");
        Map<String, String> ongoingEvents = new LinkedHashMap<>();
        ongoingEvents.put("fukuoka", "Fukuoka Institute of Technology Webinar");
        ongoingEvents.put("AIEng", "AI Engineering & Entrepreneurship Webinar");
        ongoingEvents.put("enginnopitch", "Engineering Innovation Pitch 2025");
        ongoingEvents.put("ros", "ROS and Smart Robot Competition 2025");

        Map<String, String> finishedEvents = new LinkedHashMap<>();
        finishedEvents.put("kinnoexpo", "KMITL Engineering Innovation Expo 2025");
        finishedEvents.put("readytoindustry", "Ready to Industry");
        finishedEvents.put("smartpolice", "Smart Police Webinar");
        finishedEvents.put("ernst", "Ernst Mach Grant - ASEA-UNINET");

        Map<String, String> events = "finished".equals(status) ? finishedEvents : ongoingEvents;
    %>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Event</div>
    <div class="subtitle-header">
        <%= "finished".equals(status) ? "Finished" : "Ongoing" %>
    </div>
    <div class="content">
        <% for (Map.Entry<String, String> entry : events.entrySet()) { %>
            <div class="info-box" onclick="window.location.href='event_detail.jsp?type=<%= entry.getKey() %>'">
                <%= entry.getValue() %>
            </div>
        <% } %>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>