<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Details</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            /* Removed min-height: 100vh */
            display: flex;
            flex-direction: column;
            padding-top: 120px; /* Adjust for potential fixed header from sidemenu.jsp */
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            width: 100%;
            position: relative;
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

        /* Title styling (matched to contact.jsp, curriculum.jsp, collaboration.jsp) */
        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .contact-header {
            background-color: #e35205;
            color: white;
            padding: 20px; /* Fixed value instead of clamp */
            text-align: center;
            margin-bottom: 25px; /* Fixed value instead of clamp */
        }

        .contact-header h2 {
            margin: 0;
            font-size: 30px; /* Fixed value instead of clamp */
        }

        .contact-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 15px; /* Fixed value instead of clamp */
            flex: 1;
        }

        .logo-container {
            margin: 30px 0; /* Fixed value instead of clamp */
            text-align: center;
        }

        .logo-img {
            width: 300px; /* Fixed value instead of clamp */
            height: auto;
        }

        .contact-details {
            width: 100%;
            max-width: 600px; /* Fixed value instead of clamp */
            display: flex;
            flex-direction: column;
            gap: 30px; /* Fixed value instead of clamp */
            margin-bottom: 60px; /* Fixed value instead of clamp */
            margin-right: 0;
        }

        .contact-item {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #333;
            padding: 10px 0; /* Fixed value instead of clamp */
        }

        .contact-icon {
            width: 50px; /* Fixed value instead of clamp */
            height: 50px; /* Fixed value instead of clamp */
            margin-right: 15px; /* Fixed value instead of clamp */
        }

        .bottom-button {
            background-color: #e35205;
            color: white;
            padding: 12px; /* Fixed value instead of clamp */
            border: none;
            border-radius: 20px; /* Fixed value instead of clamp */
            width: 90%;
            max-width: 400px; /* Fixed value instead of clamp */
            margin: 0 auto 20px; /* Fixed value instead of clamp */
            cursor: pointer;
            font-size: 20px; /* Fixed value instead of clamp */
            display: block;
            transition: background-color 0.3s ease;
        }

        .bottom-button:hover {
            background-color: #d04304;
        }

        /* Responsive Design */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 65px;
                padding-top: 40px; /* More space for larger screens */
            }
            .contact-content{
                margin-bottom: 20px;
            }
            .contact-header{
                margin-bottom: 25px;
                margin-top: 15px;
            }
            .contact-header h2 {
                font-size: 25px;
            }
            .logo-img {
                width: 250px;
            }
            .contact-icon {
                width: 40px;
                height: 40px;
            }
            .bottom-button {
                font-size: 18px;
            }
        }

        @media screen and (max-width: 1025px) {
            .page-title {
                font-size: 50px;
                padding-top: 80px;
            }
            .container{
                margin-bottom: 70px;
            }
            .contact-content{
                margin-bottom: 20px;
            }
            .contact-header{
                margin-bottom: 25px;
                margin-top: 15px;
            }
            .contact-header h2 {
                font-size: 25px;
            }
            .logo-img {
                width: 250px;
            }
            .contact-icon {
                width: 40px;
                height: 40px;
            }
            .bottom-button {
                font-size: 18px;
            }
        }

        @media screen and (max-width: 768px) {
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 30px;
            }
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 50px;
            }
            .contact-header {
                padding: 15px;
            }
            .logo-container {
                margin: 20px 0;
            }
            .contact-details {
                gap: 20px;
            }
            .contact-item {
                flex-direction: column;
                text-align: center;
                padding: 8px 0;
            }
            .contact-icon {
                margin-right: 0;
                margin-bottom: 10px;
            }
            .bottom-button {
                max-width: 300px;
            }
        }

        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                padding-top: 30px;
            }
            .container{
                margin-bottom: 120px;
            }
            .contact-header h2 {
                font-size: 20px;
            }
            .logo-img {
                width: 200px;
            }
            .contact-icon {
                width: 30px;
                height: 30px;
            }
            .contact-details {
                gap: 15px;
                margin-bottom: 40px;
            }
            .bottom-button {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <%
        String contactId = request.getParameter("id");

        // Basic information arrays
        String[] titles = {"Robotics and AI", "KESA", "SIIE", "IA.ENG", "OIA"};
        String[] logos = {"rai_logo.png", "kesa_logo.png", "siie_logo.png", "ia_logo.jpg", "oia_logo.png"};

        // Contact information
        String[][] contacts = {
            // RAI
            {"rai@kmitl.ac.th", "084 624 4535", "@rai_kmitl", "KMITL.RoboticsAI"},
            // KESA
            {"smoeng@kmitl.ac.th", "kmitl.esa.official", "esa.kmitl"},
            // SIIE
            {"siie@kmitl.ac.th", "093 474 7468", "@siie_kmitl", "KMITL.SIIE"},
            // IA.ENG
            {"ia.eng@kmitl.ac.th", "02 329 8320", "@iaeng_kmitl", "kmitl.engineer.inter"},
            // OIA
            {"inter@kmitl.ac.th", "02 329 8140", "@vyz6619b", "kmitl.engineer.inter"}
        };
        String[] contactLinks = {
            "https://linktr.ee/jj4w",  // Robotics and AI
            "https://linktr.ee/jkesa", // KESA
            "https://linktr.ee/jSIIE", // SIIE
            "https://linktr.ee/jjiaeng", // IA.ENG
            "https://linktr.ee/jjoia"  // OIA
        };
        int index = Integer.parseInt(contactId);
    %>
    <jsp:include page="../menubar.jsp" />
    <div class="page-title">Contact</div>
    <div class="container">
        <!-- Contact Header -->
        <div class="contact-header">
            <h2><%= titles[index] %></h2>
        </div>

        <!-- Contact Content -->
        <div class="contact-content">
            <div class="logo-container">
                <img src="../../images/<%= logos[index] %>" alt="Logo" class="logo-img">
            </div>

            <div class="contact-details">
                <% if (index == 1) { // KESA %>
                    <a href="mailto:<%= contacts[index][0] %>" class="contact-item">
                        <img src="../../images/icon/email_icon.png" alt="Email" class="contact-icon">
                        <span><%= contacts[index][0] %></span>
                    </a>

                    <a href="https://www.instagram.com/<%= contacts[index][1] %>" class="contact-item">
                        <img src="../../images/icon/instagram_icon.png" alt="Instagram" class="contact-icon">
                        <span><%= contacts[index][1] %></span>
                    </a>

                    <a href="https://www.facebook.com/<%= contacts[index][2] %>" class="contact-item">
                        <img src="../../images/icon/fb_icon.png" alt="Facebook" class="contact-icon">
                        <span>https://www.facebook.com/<%= contacts[index][2] %></span>
                    </a>
                <% } else { // Other contacts %>
                    <a href="mailto:<%= contacts[index][0] %>" class="contact-item">
                        <img src="../../images/icon/email_icon.png" alt="Email" class="contact-icon">
                        <span><%= contacts[index][0] %></span>
                    </a>

                    <a href="tel:<%= contacts[index][1] %>" class="contact-item">
                        <img src="../../images/icon/phone_icon.png" alt="Phone" class="contact-icon">
                        <span><%= contacts[index][1] %></span>
                    </a>

                    <div class="contact-item">
                        <img src="../../images/icon/line_icon1.png" alt="Line" class="contact-icon">
                        <span><%= contacts[index][2] %></span>
                    </div>

                    <a href="https://www.facebook.com/<%= contacts[index][3] %>" class="contact-item">
                        <img src="../../images/icon/fb_icon.png" alt="Facebook" class="contact-icon">
                        <span>https://www.facebook.com/<%= contacts[index][3] %></span>
                    </a>
                <% } %>
            </div>

            <button class="bottom-button" onclick="window.location.href='<%= contactLinks[index] %>'">
                FOR MORE INFORMATION
            </button>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>