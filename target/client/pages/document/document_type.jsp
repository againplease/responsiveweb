<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documentation</title>
    <style>
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

        /* Title styling (adapted from first document.jsp) */
        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .sub-title {
            text-align: center;
            margin: 40px 0 60px;
            font-size: 40px;
            color: #666;
        }

        .document-list {
            max-width: 900px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .document-item {
            background-color: #fff;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            padding: 35px 40px;
            margin: 60px 0;
            font-size: 40px;
            border-radius: 40px;
        }

        .document-item:hover {
            transform: translateX(5px);
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            background: #E35205;
            color: white;
            opacity: 0.9;
        }

        .send-email-btn {
            display: block;
            width: 100%;
            max-width: 800px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ff5722;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-size: 40px;
            font-weight: bold;
            transition: background-color 0.2s;
        }

        .send-email-btn:hover {
            background-color: #f4511e;
        }

        /* Responsive Design (updated page-title to match first document.jsp breakpoints) */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 50px;
            }
            .sub-title {
                font-size: 26px;
                margin: 20px 0 10px;
            }
            .document-list {
                max-width: 700px;
                width: 100%;
                padding-bottom: 20px;
            }
            .document-item {
                padding: 35px 40px;
                margin: 45px 0;
                font-size: 22px;
                border-radius: 15px;
            }
            .send-email-btn {
                max-width: 500px;
                padding: 15px;
                font-size: 22px;
                margin: 50px auto;
                border-radius: 10px;
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

        @media screen and (max-width: 1025px) {
            .page-title {
                font-size: 50px;
                padding-top: 100px;
            }
            .sub-title {
                font-size: 24px;
                margin: 15px 0 5px;
            }
            .document-list {
                max-width: 600px;
                margin-bottom: 60px;
                width: 100%;
            }
            .document-item {
                padding: 35px 40px;
                margin: 35px 0;
                font-size: 20px;
                border-radius: 12px;
            }
            .send-email-btn {
                max-width: 450px;
                padding: 15px;
                font-size: 20px;
                margin: 40px auto;
                border-radius: 10px;
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

        @media screen and (max-width: 768px) {
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .sub-title {
                font-size: 20px;
                margin: 15px 0 -10px;
            }
            .document-list {
                padding: 0 20px;
                margin-bottom: 150px
            }
            .document-item {
                padding: 35px 40px;
                margin: 40px 0;
                font-size: 18px;
                border-radius: 10px;
            }
            .send-email-btn {
                max-width: 300px;
                padding: 12px;
                font-size: 18px;
                margin: 30px auto;
                border-radius: 8px;
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

        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                padding-top: 40px;
                margin-top: 50px;
            }
            .sub-title {
                font-size: 18px;
                margin: 15px 0 5px;
            }
            .document-list {
                padding: 0 10px;
            }
            .document-item {
                padding: 30px 25px;
                margin: 25px 0;
                font-size: 16px;
                border-radius: 8px;
            }
            .send-email-btn {
                max-width: 250px;
                padding: 10px;
                font-size: 16px;
                margin: 25px auto;
                border-radius: 6px;
            }
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 30px;
                height: 30px;
            }
        }

        /* Remove the portrait-specific media query to align with first document.jsp */
        @media screen and (orientation: portrait) and (min-width: 1080px) {
            body {
                padding: 40px;
            }
            .page-title {
                font-size: 50px;
                padding-top: 150px;
            }
            .sub-title {
                font-size: 40px;
                margin: 40px 0 60px;
            }
            .document-list {
                max-width: 900px;
            }
            .document-item {
                padding: 35px 40px;
                margin: 60px 0;
                font-size: 40px;
                border-radius: 40px;
            }
            .send-email-btn {
                max-width: 900px;
                padding: 25px;
                font-size: 40px;
                margin: 100px auto;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <h1 class="page-title">Documentation</h1>
    <h2 class="sub-title" id="docType"></h2>

    <div class="document-list" id="documentList">
    </div>
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const docType = urlParams.get('type');
        
        document.getElementById('docType').textContent = docType.charAt(0).toUpperCase() + docType.slice(1);

        // Define document lists with links from ConfigUtil
        const documents = {
            General: [
                { name: 'General form', link: '<%= ConfigUtil.getProperty("general.form") %>', description: 'For general request such as late registration, section adjustment etc.' },
                { name: 'Document request form', link: '<%= ConfigUtil.getProperty("document.request") %>', description: 'For requesting documents such as transcripts, certificates of student status, etc.' },
                { name: 'Request Form for Retaining', link: '<%= ConfigUtil.getProperty("retaining.form") %>', description: 'For request to retain' },
                { name: 'Request Form for Resigning', link: '<%= ConfigUtil.getProperty("resign.form") %>', description: 'For request to resign' } 
            ],
            Internship: [
                { name: 'SI101 (Intern Application Form)', link: '<%= ConfigUtil.getProperty("si101.form") %>', description: 'Intern application form' },
                { name: 'SI201 (Summer Internship Cover Letter Request Form)', link: '<%= ConfigUtil.getProperty("si201.form") %>', description: 'Summer Internship Cover Letter Request Form' }
            ],
            Cooperative: [
                { name: 'Student Form', link: '<%= ConfigUtil.getProperty("coop.student") %>', description: 'COOP101, COOP102, COOP103, COOP104, COOP105, COOP106' },
                { name: 'Advisor Form', link: '<%= ConfigUtil.getProperty("coop.advisor") %>', description: 'COOP201, COOP202' },
                { name: 'Company Form', link: '<%= ConfigUtil.getProperty("coop.company") %>', description: 'COOP301, COOP302, COOP303, COOP304' }
            ],
        };

        // Display the appropriate document list
        const documentList = document.getElementById('documentList');
        const docs = documents[docType] || [];
        
        docs.forEach(doc => {
            const div = document.createElement('div');
            div.className = 'document-item';
            div.textContent = doc.name;
            div.onclick = function() {
                // Open the document link directly instead of redirecting to document_detail.jsp
                window.open(doc.link, '_blank');
            };
            documentList.appendChild(div);
        });
    </script>
    <jsp:include page="../footer.jsp" />
</body>
</html>