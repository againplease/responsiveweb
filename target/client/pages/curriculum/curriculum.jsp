<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background-color: #ffffff;
            box-sizing: border-box; /* Ensure padding/margins don’t overflow */
        }

        /* Back button (assuming it will be added) */
        .back-button {
            position: fixed;
            top: 20px; /* Adjusted for better mobile spacing */
            left: 20px;
            z-index: 1000; /* Ensure it’s above content but below sidemenu */
        }
    
        .back-button img {
            width: 50px; /* Smaller default size for responsiveness */
            height: 50px;
            transition: transform 0.3s ease; /* Smooth hover effect */
        }

        .back-button:hover img {
            transform: scale(1.1); /* Slight scale on hover */
        }

        /* Title styling */
        .title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px; /* Space for hamburger menu */
        }

        /* Content container */
        .content {
            padding: 0 20px 90px 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        /* Info boxes */
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
            transform: scale(1.02); /* Subtle scale effect */
        }

        /* Larger screens (e.g., desktops > 1200px) */
        @media screen and (min-width: 1026px) {
            .back-button img {
                width: 80px;
                height: 80px;
            }
            .title {
                font-size: 50px;
                padding-top: 150px; /* More space for larger screens */
            }
            .content {
                padding: 0 30px 100px 30px;
            }
            .info-box {
                padding: 50px;
                font-size: 42px;
                margin: 60px 0;
            }
        }

        /* Medium screens (e.g., tablets, 768px - 1200px) */
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
                margin-top: 50px;
            }
            .content {
                max-width: 900px;
                padding: 0 25px 80px 25px;
            }
            .info-box {
                padding: 35px;
                font-size: 32px;
                margin: 40px 0;
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
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .content {
                padding: 0 15px 15px 15px;
                max-width: 100%;
                margin-bottom: 150px; /* Full width on small screens */
            }
            .info-box {
                padding: 30px;
                font-size: 25px;
                margin: 60px 0;
                transform: none;
                transform: none; /* Disable scale on hover for touch devices */
            }
            .info-box:hover {
                transform: none; /* Prevent scaling on touch devices */
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
                font-size: 30px;
                margin-top: 50px;   
                padding-top: 40px;
            }
            .content {
                padding: 0 10px 40px 10px;
            }
            .info-box {
                padding: 30px;
                font-size: 20px;
                margin-top: 35px;
                margin-bottom: 60px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Curriculum</div>
    <div class="content">
        <div class="info-box" onclick="window.location.href='curriculum_type.jsp?type=Undergraduate'">
            Undergraduate
        </div>
        <div class="info-box" onclick="window.location.href='curriculum_type.jsp?type=Master'">
            Master
        </div>
        <div class="info-box" onclick="window.location.href='curriculum_type.jsp?type=Doctorate'">
            Ph.D
        </div>
        <div class="info-box" onclick="window.location.href='curriculum_type.jsp?type=AIMinor'">
            AI Minor
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>