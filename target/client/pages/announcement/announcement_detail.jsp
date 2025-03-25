<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.dBConnection, java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcement Details</title>
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
    
        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
        }
    
        .back-button img {
            width: 50px;
            height: 50px;
            transition: transform 0.3s ease;
        }

        .back-button:hover img {
            transform: scale(1.1);
        }
    
        .container {
            width: 100%;
            max-width: 900px;
            margin-top: 20px;
            text-align: center;
            padding: 0 20px;
        }
    
        .title {
            text-align: center;
            margin: 80px 0 20px;
            font-weight: bold;
            font-size: 65px;
            padding-top: 120px;
        }

        .announcement-image {
            width: 100%;
            max-width: 900px;
            border-radius: 10px;
            margin: 20px 0;
            display: block;
        }
    
        .no-announcement {
            font-size: 20px;
            color: #666;
            margin: 20px 0;
        }

        @media screen and (min-width: 1026px) {
            .back-button img {
                width: 80px;
                height: 80px;
            }
            .title {
                font-size: 65px;
                padding-top: 95px;
            }
            .container {
                padding: 0 30px;
            }
            .announcement-image {
                max-width: 900px;
            }
            .no-announcement {
                font-size: 20px;
            }
        }

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
                max-width: 100%;
            }
            .no-announcement {
                font-size: 18px;
            }
        }

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
                padding-top: 60px;
                margin: 20px 0;
            }
            .container {
                padding: 0 15px;
            }
            .announcement-image {
                max-width: 100%;
            }
            .no-announcement {
                font-size: 16px;
                margin: 15px 0;
            }
        }

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
            .no-announcement {
                font-size: 14px;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <%
        String minioUrl = request.getParameter("url");
        String decodedUrl = minioUrl != null ? URLDecoder.decode(minioUrl, "UTF-8") : "";
        String title = "Announcement";

        if (decodedUrl != null && !decodedUrl.isEmpty()) {
            try (Connection conn = dBConnection.getConnection()) {
                String sql = "SELECT title FROM announcements WHERE minio_url = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, decodedUrl);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    title = rs.getString("title");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
    <h2 class="title"><%= title %></h2>
    <div class="container">
        <% if (decodedUrl != null && !decodedUrl.isEmpty()) { %>
            <img src="<%= decodedUrl %>" alt="<%= title %>" class="announcement-image">
        <% } else { %>
            <p class="no-announcement">No announcement available.</p>
        <% } %>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>