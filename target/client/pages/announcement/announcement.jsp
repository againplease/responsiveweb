<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.dBConnection, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcement</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background-color: #ffffff;
            box-sizing: border-box;
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

        .title {
            text-align: center;
            margin: 80px 0 20px;
            font-weight: bold;
            font-size: 65px;
            padding-top: 120px;
        }

        .content {
            padding: 0 20px 90px 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .info-box {
            background-color: #E6E6E6;
            padding: 50px;
            margin: 80px 0;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
            text-align: center;
            font-weight: bold;
            font-size: 42px;
        }

        .info-box:hover {
            background-color: #E35205;
            color: white;
            transform: scale(1.02);
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
            .content {
                padding: 0 30px 100px 30px;
            }
            .info-box {
                padding: 50px;
                font-size: 42px;
                margin-bottom: 110px;
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
            .content {
                max-width: 900px;
                padding: 0 25px 80px 25px;
            }
            .info-box {
                padding: 35px;
                font-size: 32px;
                margin: 70px 0;
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
            .content {
                padding: 0 15px 525px 15px;
                max-width: 100%;
            }
            .info-box {
                padding: 20px;
                font-size: 20px;
                margin: 60px 0;
                transform: none;
            }
            .info-box:hover {
                transform: none;
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
            }
            .content {
                padding: 0 10px 40px 10px;
            }
            .info-box {
                padding: 15px;
                font-size: 16px;
                margin: 40px 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Announcement</div>
    <div class="content">
        <% 
            List<String> titles = new ArrayList<>();
            List<String> minioUrls = new ArrayList<>();

            try (Connection conn = dBConnection.getConnection()) {
                String sql = "SELECT title, minio_url FROM announcements";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    titles.add(rs.getString("title"));
                    minioUrls.add(rs.getString("minio_url"));
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }

            for (int i = 0; i < titles.size(); i++) {
                String title = titles.get(i);
                String minioUrl = minioUrls.get(i);
                String encodedUrl = java.net.URLEncoder.encode(minioUrl, "UTF-8");
        %>
            <div class="info-box" onclick="window.location.href='announcement_detail.jsp?url=<%= encodedUrl %>'">
                <%= title %>
            </div>
        <% 
            }
        %>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>