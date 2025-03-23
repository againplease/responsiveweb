<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documentation</title>
    <style>
        /* Base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
        }

        body {
            flex: 1 0 auto;
            padding-top: 120px; /* Kept for fixed header from menubar.jsp */
        }

        .back-button {
            position: fixed;
            top: 90px;
            left: 70px;
            z-index: 100;
        }

        .back-button img {
            width: 80px;
            height: 80px;
        }

        /* Title styling (adapted from event.jsp) */
        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .document-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .document-card {
            background-color: #D9D9D9;
            border-radius: 30px;
            padding: 40px 30px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            transition: transform 0.2s, box-shadow 0.2s;
            color: white;
        }

        .document-card:hover {
            background: #E35205;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            color: white;
        }

        .document-icon {
            width: 200px;
            height: 200px;
            margin: 0 auto 25px;
        }

        .document-title {
            font-size: 40px;
            color: black;
            font-weight: 600;
        }

        .document-card:hover .document-title {
            color: white;
        }

        /* Responsive Design (updated page-title to match event.jsp breakpoints) */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 50px; /* More space for larger screens */
                padding-bottom: 40px; /* More space for larger screens */
            }
            .document-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 40px;
                max-width: 1000px;
                padding-bottom: 60px;
            }
            .document-icon {
                width: 150px;
                height: 150px;
                margin-bottom: 25px;
            }
            .document-title {
                font-size: 32px;
            }
            .back-button {
                top: 50px;
                left: 50px;
            }
            .back-button img {
                width: 60px;
                height: 60px;
            }
        }

        @media screen and (max-width: 1025px) {
            .page-title {
                font-size: 50px;
                padding-top: 100px;
            }
            .document-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 50px;
                padding-bottom: 60px;
                padding-top: 40px;
            }
            .document-icon {
                width: 130px;
                height: 130px;
                margin-bottom: 20px;
            }
            .document-title {
                font-size: 28px;
            }
            .back-button {
                top: 40px;
                left: 40px;
            }
            .back-button img {
                width: 50px;
                height: 50px;
            }
        }

        @media screen and (max-width: 768px) {
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
                padding-bottom: 30px;
            }
            body {
                padding: 20px;
            }
            .document-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 50px;
                padding: 0 10px;
                padding-bottom: 150px
            }
            .document-card {
                padding: 20px 15px;
                border-radius: 20px;
            }
            .document-icon {
                width: 80px;
                height: 80px;
                margin-bottom: 15px;
            }
            .document-title {
                font-size: 18px;
            }
            .back-button {
                top: 30px;
                left: 30px;
            }
            .back-button img {
                width: 40px;
                height: 40px;
            }
        }

        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                padding-top: 40px;
                margin-top: 50px;
            }
            body {
                padding: 15px;
            }
            .document-grid {
                gap: 40px;
                grid-template-columns: repeat(2, 1fr);
                margin-bottom: 100px;
            }
            .document-card {
                padding: 20px 15px;
                border-radius: 15px;
            }
            .document-icon {
                width: 70px;
                height: 70px;
                margin-bottom: 10px;
            }
            .document-title {
                font-size: 16px;
            }
            .back-button {
                top: 20px;
                left: 20px;
            }
            .back-button img {
                width: 35px;
                height: 35px;
            }
        }

        /* Remove the portrait-specific media query to align with event.jsp */
        @media screen and (orientation: portrait) and (min-width: 1080px) {
            body {
                padding: 40px;
            }
            .page-title {
                font-size: 50px; /* Adjusted to align with min-width: 1026px */
                padding-top: 150px; /* Adjusted to align with min-width: 1026px */
            }
            .document-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 80px;
                padding: 0 40px;
            }
            .document-card {
                padding: 60px 40px;
            }
            .document-icon {
                width: 200px;
                height: 200px;
                margin-bottom: 60px;
            }
            .document-title {
                font-size: 40px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="page-title">Documentation</div>
    <div class="document-grid">
        <a href="document_type.jsp?type=General" class="document-card">
            <img src="../../images/icon/general_icon.png" alt="General" class="document-icon">
            <div class="document-title">General</div>
        </a>

        <a href="document_type.jsp?type=Internship" class="document-card">
            <img src="../../images/icon/internship_icon.png" alt="Internship" class="document-icon">
            <div class="document-title">Internship</div>
        </a>

        <a href="document_type.jsp?type=Cooperative" class="document-card">
            <img src="../../images/icon/coop.png" alt="Cooperative Education" class="document-icon">
            <div class="document-title">Cooperative Education</div>
        </a>

        <a href="disbursement.jsp" class="document-card">
            <img src="../../images/icon/disbursement_icon.png" alt="Disbursement Document" class="document-icon">
            <div class="document-title">Disbursement Document</div>
        </a>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>