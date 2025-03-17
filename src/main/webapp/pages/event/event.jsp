<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event</title>
    <style>
        :root {
            --primary-color: #E35205;
            --background-color: #d6d6d6;
            --box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
            background-color: #ffffff;
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

        /* Title styling (matched to contact.jsp, curriculum.jsp, etc.) */
        .title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .container {
            display: flex;
            flex-direction: column;
            gap: 40px;
            padding: 30px;
            align-items: center;
            justify-content: center;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .option-box {
            background-color: var(--background-color);
            width: 90%;
            max-width: 700px;
            border-radius: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: black;
            transition: transform 0.2s, background 0.3s;
            box-shadow: var(--box-shadow);
            padding: 20px;
        }

        .option-box:hover, .option-box:focus {
            background: var(--primary-color);
            transform: scale(1.02);
            color: white;
        }

        .option-box img {
            width: 200px;
            height: auto;
            margin-bottom: 15px;
        }

        .option-box span {
            font-size: 30px;
            font-weight: 600;
            text-align: center;
            padding: 0 10px;
        }

        /* Responsive Design (matched to contact.jsp breakpoints) */
        @media screen and (min-width: 1026px) {
            .title {
                font-size: 50px;
                padding-top: 150px; /* More space for larger screens */
            }
            .container {
                gap: 60px;
                padding: 50px;
                flex-direction: row;
                margin-bottom: 140px;
            }
            .option-box {
                padding: 20px;
                max-width: 450px;
            }
            .option-box img {
                width: 200px;
            }
            .option-box span {
                font-size: 32px;
            }
        }

        @media screen and (max-width: 1025px) {
            .title {
                font-size: 50px;
                padding-top: 100px;
            }
            .container {
                gap: 60px;
                padding: 35px;
            }
            .option-box {
                padding: 20px;
                width: 60%;
                justify-items: center;
            }
            .option-box img {
                width: 200px;
            }
            .option-box span {
                font-size: 28px;
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
            .container {
                gap: 65px;
                padding: 20px;
                margin-bottom: 150px;
            }
            .option-box {
                padding: 20px;
            }
            .option-box img {
                width: 150px;
            }
            .option-box span {
                font-size: 25px;
            }
        }

        @media screen and (max-width: 480px) {
            .title {
                font-size: 30px;
                margin-top: 50px;   
                padding-top: 40px;
            }
            .container {
                gap: 45px;
                padding: 30px;
                margin-bottom: 150px;
            }
            .option-box {
                padding: 10px;
                width: 90%;
            }
            .option-box img {
                width: 120px;
            }
            .option-box span {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Event</div>
    <div class="container">
        <a href="event_type.jsp?status=ongoing" class="option-box">
            <img src="../../images/ongoing.png" alt="Ongoing">
            <span>Ongoing</span>
        </a>

        <a href="event_type.jsp?status=finished" class="option-box">
            <img src="../../images/finished.png" alt="Finished">
            <span>Finished</span>
        </a>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>