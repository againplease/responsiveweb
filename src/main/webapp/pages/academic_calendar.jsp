<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
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
            padding-top: 120px; /* Adjust for potential fixed header from sidemenu.jsp */ /* Adjust for potential fixed footer or menu */
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

        /* Title styling (matched to event.jsp) */
        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .academic-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Always exactly 2 columns */
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

        /* Responsive Design */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 50px; /* More space for larger screens */
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
            /* Keep two columns even on small screens */
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
        String year = request.getParameter("year");
        String pdfPath = (year != null) ? ConfigUtil.getProperty("academic.calendar." + year) : "";
    %>
    <div class="academic-grid">
        <div class="year-box" onclick="goToDetail(2025)">2025</div>
        <div class="year-box" onclick="goToDetail(2568)">2568</div>
        <div class="year-box" onclick="goToDetail(2024)">2024</div>
        <div class="year-box" onclick="goToDetail(2567)">2567</div>
        <div class="year-box" onclick="goToDetail(2023)">2023</div>
        <div class="year-box" onclick="goToDetail(2566)">2566</div>
        <div class="year-box" onclick="goToDetail(2022)">2022</div>
        <div class="year-box" onclick="goToDetail(2565)">2565</div>
    </div>
    <script>
        function goToDetail(year) {
            var pdfPath = "<%= pdfPath %>"; // Get the PDF path from JSP
            if (pdfPath && pdfPath !== "") {
                window.open(pdfPath, '_blank'); // Open PDF in new tab
            } else {
                window.location.href = "academic_calendar.jsp?year=" + year; // Redirect to same page with year parameter
            }
        }
    </script>
    <jsp:include page="footer.jsp" />
</body>
</html>