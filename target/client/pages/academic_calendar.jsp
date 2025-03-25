<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.dBConnection, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Calendar</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            min-height: 100%;
            padding-top: 120px;
        }

        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 100;
        }
    
        .back-button img {
            width: 60px;
            height: auto;
            aspect-ratio: 1/1;
        }

        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .academic-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .year-box {
            background-color: #D9D9D9;
            border-radius: 25px;
            padding: 30px 20px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            color: black;
            transition: transform 0.2s, box-shadow 0.2s;
            font-size: 35px;
        }

        .year-box:hover {
            background: #E35205;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            color: white;
            transform: scale(1.05);
        }

        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 50px;
                padding-bottom: 40px;
            }
            .academic-grid{
                column-gap: 40px;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                row-gap: 60px;
                padding-bottom: 60px;
            }
        }

        @media screen and (max-width: 1025px) {
            .page-title {
                font-size: 50px;
                padding-top: 90px;
                margin-bottom: 40px;
            }
            .academic-grid{
                column-gap: 40px;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                row-gap: 60px;
                padding-bottom: 60px;
            }
            .year-box {
                font-size: 28px;
            }
        }

        @media screen and (max-width: 768px) {
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 50px;
            }
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .academic-grid{
                column-gap: 40px;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                row-gap: 65px;
                padding-bottom: 140px;
            }
            .year-box {
                padding: 20px 15px;
                font-size: 25px;
            }
        }

        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                margin-top: 50px;
                padding-top: 30px;
            }
            .academic-grid {
                grid-template-columns: 1fr 1fr;
                gap: 40px;
                padding-bottom: 190px;
            }
            .year-box {
                padding: 15px 10px;
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="menubar.jsp" />
    <h1 class="page-title">Academic Calendar</h1>

    <% 
        List<String> westernYears = new ArrayList<>();
        List<String> thaiYears = new ArrayList<>();
        List<String> urls = new ArrayList<>();

        try (Connection conn = dBConnection.getConnection()) {
            // Query only Western years (assuming < 3000), limit to 4
            String sql = "SELECT title, link_url FROM academic_calendar " +
                        "WHERE CAST(SUBSTRING(title, LENGTH('academic.calendar.') + 1) AS UNSIGNED) < 2500 " +
                        "ORDER BY SUBSTRING(title, LENGTH('academic.calendar.') + 1) DESC LIMIT 4";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title"); // e.g., "academic.calendar.2025"
                String linkUrl = rs.getString("link_url");
                String westernYear = title.replace("academic.calendar.", ""); // "2025"
                int thaiYearNum = Integer.parseInt(westernYear) + 543; // 2568

                westernYears.add(westernYear);
                thaiYears.add(String.valueOf(thaiYearNum));
                urls.add(linkUrl);
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>

    <div class="academic-grid">
        <% 
            for (int i = 0; i < Math.min(westernYears.size(), 4); i++) {
                String westernYear = westernYears.get(i);
                String thaiYear = thaiYears.get(i);
                String url = urls.get(i);
        %>
            <div class="year-box" onclick="goToDetail('<%= url %>')"><%= westernYear %></div>
            <div class="year-box" onclick="goToDetail('<%= url %>')"><%= thaiYear %></div>
        <% 
            }
        %>
    </div>

    <script>
        function goToDetail(url) {
            if (url && url !== "") {
                window.open(url, '_blank');
            }
        }
    </script>

    <jsp:include page="footer.jsp" />
</body>
</html>