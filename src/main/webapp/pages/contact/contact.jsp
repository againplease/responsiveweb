<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <style>
        /* Ensure html and body take full height with no extra space */
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #333;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
        }

        body {
            /* Removed min-height: 100vh */
            display: flex;
            flex-direction: column;
        }

        /* Title styling (matched to previous curriculum.jsp style) */
        .title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .container {
            flex-grow: 1; /* Allow container to grow to fill remaining space */
            display: flex;
            flex-direction: column;
            align-items: stretch;
            justify-content: flex-start;
            width: 100%;
            padding-bottom: 50px;
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

        .contact-list {
            width: 100%;
            max-width: 80%;
            margin: 40px auto 0; /* Fixed value instead of clamp */
            display: flex;
            flex-direction: column;
            gap: 30px; /* Fixed value instead of clamp */
            padding: 0 15px; /* Fixed value instead of clamp */
            box-sizing: border-box;
        }

        .contact-item {
            display: flex;
            align-items: center;
            background-color: #ffcc99;
            padding: 20px 30px; /* Fixed value instead of clamp */
            border-radius: 30px; /* Fixed value instead of clamp */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 100%;
            box-sizing: border-box;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .contact-item:hover {
            transform: scale(1.02);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        .contact-logo {
            width: 80px; /* Fixed value instead of clamp */
            height: 80px; /* Fixed value instead of clamp */
            border-radius: 50%;
            margin-right: 15px; /* Fixed value instead of clamp */
            object-fit: cover;
        }

        .contact-name {
            font-size: 24px; /* Fixed value instead of clamp */
            font-weight: bold;
            color: white;
        }

        /* Ensure footer sticks to the bottom */
        #footer {
            flex-shrink: 0; /* Prevent footer from shrinking */
            width: 100%;
        }

        /* Responsive Design */
        @media screen and (min-width: 1026px) {
            .title {
                font-size: 65px;
                padding-top: 150px; /* More space for larger screens */
            }
            .contact-list{
                gap: 60px;
                margin: 40px auto 0;
            }
            .contact-name {
                font-size: 22px;
            }
            .contact-logo {
                width: 80px;
                height: 70px;
            }
        }

        @media screen and (max-width: 1025px) {
            .title {
                font-size: 50px;
                padding-top: 100px;
            }
            .contact-list{
                gap: 60px;
                margin: 40px auto 0;
            }
            .contact-name {
                font-size: 22px;
            }
            .contact-logo {
                width: 80px;
                height: 70px;
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
            .contact-list {
                gap: 60px;
                margin: 30px auto 0;
            }
            .contact-item {
                flex-direction: column;
                text-align: center;
                padding: 15px;
            }
            .contact-logo {
                margin-right: 0;
                margin-bottom: 10px;
                width: 80px;
                height: 70px;
            }
            .contact-name {
                font-size: 20px;
            }
        }

        @media screen and (max-width: 480px) {
            .title {
                font-size: 30px;
                padding-top: 40px;
            }
            .container {
                flex-grow: 1; /* Allow container to grow to fill remaining space */
                display: flex;
                flex-direction: column;
                align-items: stretch;
                justify-content: flex-start;
                width: 100%;
                padding-bottom: 75px;
            }
            .contact-list {
                gap: 50px;
                padding: 0 30px;
                margin: 20px auto 0;
            }
            .contact-item {
                padding: 10px 15px;
                border-radius: 20px;
            }
            .contact-logo {
                width: 80px;
                height: 70px;
            }
            .contact-name {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Contact</div>
    <div class="container">
        <div class="contact-list">
            <div class="contact-item" onclick="window.location.href='contact_details.jsp?id=0'">
                <img src="../../images/rai_logo.png" alt="Robotics and AI" class="contact-logo">
                <span class="contact-name">Robotics and AI</span>
            </div>
            <div class="contact-item" onclick="window.location.href='contact_details.jsp?id=1'">
                <img src="../../images/kesa_logo.png" alt="KESA" class="contact-logo">
                <span class="contact-name">KESA</span>
            </div>
            <div class="contact-item" onclick="window.location.href='contact_details.jsp?id=2'">
                <img src="../../images/siie_logo.png" alt="SIIE" class="contact-logo">
                <span class="contact-name">SIIE</span>
            </div>
            <div class="contact-item" onclick="window.location.href='contact_details.jsp?id=3'">
                <img src="../../images/ia_logo.jpg" alt="IA.ENG" class="contact-logo">
                <span class="contact-name">IA.ENG</span>
            </div>
            <div class="contact-item" onclick="window.location.href='contact_details.jsp?id=4'">
                <img src="../../images/oia_logo.png" alt="OIA" class="contact-logo">
                <span class="contact-name">OIA</span>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>