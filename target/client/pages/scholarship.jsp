<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String scholarshipLink = "https://www.facebook.com/KMITL.SIIE";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Scholarship</title>
    <style>
        :root {
            --primary-color: #FF5722;
            --secondary-color: #FFA560;
            --background-color: #ffffff;
            --text-color: #333333;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            font-size: 16px !important;
            -webkit-text-size-adjust: 100%;
        }

        html, body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: var(--background-color);
            transform: scale(1) !important;
            zoom: 1 !important;
            -ms-zoom: 1 !important;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 16px !important;
            background-color: var(--background-color);
            overflow-y: auto;
            width: 100%;
        }

        body, html {
            -webkit-transform: none !important;
            -moz-transform: none !important;
            -ms-transform: none !important;
            transform: none !important;
        }

        .title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .content {
            padding: 0 20px 90px 20px;
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }

        .moreinfo-button {
            width: 250px;
            padding: 15px;
            background-color: var(--primary-color);
            margin-top: 20px;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            text-transform: uppercase;
            font-weight: bold;
            text-align: center;
            display: inline-block;
        }

        .moreinfo-button:hover {
            background-color: #e64a19;
        }

        /* FAQ Styles with vh removed */
        .faq-section {
            width: 100%;
            max-width: 800px;
            margin: 0 auto 80px;
            padding: 10px;
        }

        .faq-section h1 {
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .faq-item {
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 10px;
            overflow: hidden;
        }

        .faq-question {
            background-color: #fff;
            padding: 30px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
        }

        .faq-dot {
            width: 15px;
            height: 15px;
            background-color: var(--secondary-color);
            border-radius: 50%;
            flex-shrink: 0;
            margin-right: 5px;
        }

        .faq-content {
            display: flex;
            align-items: center;
            flex-grow: 1;
        }

        .faq-toggle {
            font-size: 18px;
            color: var(--secondary-color);
            transition: transform 0.3s ease;
        }

        .faq-item.active .faq-toggle {
            transform: rotate(180deg);
        }

        .faq-answer {
            padding: 0 15px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
            background-color: #f9f9f9;
            font-size: 14px;
            color: var(--text-color);
            font-weight: bold;
            line-height: 1.6;
            text-align: left;
        }

        .faq-item.active .faq-answer {
            padding: 15px;
            max-height: 800px;
        }

        .faq-title {
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .faq-answer ul {
            padding-left: 10px;
            margin: 5px 0;
        }

        .faq-answer li {
            margin-bottom: 2px;
        }

        .scholarship-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .scholarship-box {
            width: 200px;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #d9d9d9;
            border: 2px solid #f2f2f2;
        }

        /* Media Queries with vh removed */
        @media screen and (min-width: 1026px) {
            .title { font-size: 50px; padding-top: 150px; }
            .content { padding: 0 30px 100px 10px; }
            .moreinfo-button { width: 600px; padding: 40px; margin-top: 20px; font-size: 32px; }
            .faq-section { max-width: 100%; padding: 20px; margin-top: 30px; margin-bottom: 0px }
            .faq-section h1 { font-size: 24px; margin-bottom: 15px; }
            .faq-item { margin-bottom: 40px; }
            .faq-question { padding: 30px; font-size: 34px; }
            .faq-dot { width: 28px; height: 28px; margin-right: 12px; }
            .faq-toggle { font-size: 34px; }
            .faq-answer { font-size: 26px; }
            .faq-title { font-size: 28px; margin-bottom: 10px; }
            .faq-answer ul { padding-left: 20px; margin: 10px 0; }
            .faq-answer li { margin-bottom: 5px; }
            .scholarship-container { gap: 40px; margin-bottom: 20px; }
            .scholarship-box { width: 300px; padding: 20px; font-size: 22px; }
        }

        @media screen and (max-width: 1025px) and (min-width: 769px) {
            .title { font-size: 50px; margin-top: 50px; }
            .content { padding: 0 30px 100px 10px; }
            .moreinfo-button { width: 600px; padding: 40px; margin-top: 20px; font-size: 32px; }
            .faq-section { max-width: 100%; padding: 20px; margin-top: 30px; margin-bottom: 0px }
            .faq-section h1 { font-size: 24px; margin-bottom: 15px; }
            .faq-item { margin-bottom: 40px; }
            .faq-question { padding: 30px; font-size: 34px; }
            .faq-dot { width: 28px; height: 28px; margin-right: 12px; }
            .faq-toggle { font-size: 34px; }
            .faq-answer { font-size: 26px; }
            .faq-title { font-size: 28px; margin-bottom: 10px; }
            .faq-answer ul { padding-left: 20px; margin: 10px 0; }
            .faq-answer li { margin-bottom: 5px; }
            .scholarship-container { gap: 40px; margin-bottom: 20px; }
            .scholarship-box { width: 300px; padding: 20px; font-size: 22px; }
        }

        @media screen and (max-width: 768px) {
            .title { font-size: 35px; padding-top: 30px; margin-top: 50px; }
            .content { padding: 0 15px 15px 15px; max-width: 100%; margin-bottom: 150px; }
            .moreinfo-button { width: 500px; padding: 30px; margin-top: 40px; font-size: 25px; }
            .faq-section { max-width: 800px; padding: 15px; margin-top: 25px; margin-bottom: 0px; }
            .faq-section h1 { font-size: 20px; margin-bottom: 15px; }
            .faq-item { margin-bottom: 30px; }
            .faq-question { padding: 30px; font-size: 25px; }
            .faq-dot { width: 22px; height: 22px; margin-right: 10px; }
            .faq-toggle { font-size: 25px; }
            .faq-answer { font-size: 22px; }
            .faq-title { font-size: 24px; margin-bottom: 10px; }
            .faq-answer ul { padding-left: 20px; margin: 15px 0; }
            .faq-answer li { margin-bottom: 10px; }
            .scholarship-container { flex-direction: row; align-items: center; gap: 40px; margin-bottom: 20px; }
            .scholarship-box { width: 280px; padding: 20px; font-size: 20px; }
        }

        @media screen and (max-width: 480px) {
            .title { font-size: 30px; margin-top: 50px; padding-top: 40px; }
            .content { padding: 0 10px 40px 10px; }
            .moreinfo-button { width: 90%; padding: 25px; margin-top: 20px; font-size: 20px; }
            .faq-section { max-width: 800px; padding: 15px;}
            .faq-section h1 { font-size: 18px; margin-bottom: 15px; }
            .faq-item { margin-bottom: 30px; }
            .faq-question { padding: 30px; font-size: 22px; }
            .faq-dot { width: 20px; height: 20px; margin-right: 8px; }
            .faq-toggle { font-size: 22px; }
            .faq-answer { font-size: 18px; }
            .faq-title { font-size: 20px; margin-bottom: 10px; }
            .faq-answer ul { padding-left: 20px; margin: 10px 0; }
            .faq-answer li { margin-bottom: 5px; }
            .scholarship-container { flex-direction: column; align-items: center; gap: 40px; margin-bottom: 20px; }
            .scholarship-box { width: 250px; padding: 15px; font-size: 16px; }
        }
    </style>
</head>
<body>
    <jsp:include page="menubar.jsp" />
    <div class="title">Scholarship</div>
    <div class="content">
        <div class="faq-section">
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>Type of Scholarship</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    <div>Type 1: 100% Tuition Fee waiver (Full Scholarship)</div>
                    <div>Type 2: 50% Tuition Fee waiver (Partial Scholarship)</div>
                    <div>Type 3: 75% Tuition Fee waiver (Three Quarter Scholarship)</div>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>Minimum Requirement</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    <ul>
                        <li>Non-Thai Passport Holders</li>
                        <li>Excellent Academic Background and English Proficiency</li>
                        <li>Transcript of Record</li>
                        <li>GPA in Math and Science subjects at least 3.0 out of 4.0 scale</li>
                    </ul>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>Applying for Scholarship</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    <ul>
                        <li>Scholarship is considered for international students during admission process.</li>
                        <li>Scholarship Result will be announced within February 2025</li>
                    </ul>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>For more Details</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    <div class="faq-title">Freshmen Scholarships for Thai students</div>
                    <div class="scholarship-container">
                        <div class="scholarship-box">
                            <strong>Full Scholarship</strong>
                            <p>100% Tuition waiver for 2 semesters (1 year)</p>
                        </div>
                        <div class="scholarship-box">
                            <strong>Half Scholarship</strong>
                            <p>50% Tuition waiver for 2 semesters (1 year)</p>
                        </div>
                    </div>
                    <div>Requirements</div>
                    <ul>
                        <li>SAT score at least 1300</li>
                        <li>
                            <div>TOEFL (paper-based) of at least 550</div>
                            <div>TOEFL (computer-based) of at least 213</div>
                            <div>TOEFL (internet-based) of at least 79</div>
                            <div>IELTS of at least 6.0</div>
                        </li>
                    </ul>
                    <div>Notes</div>
                    <ul>
                        <li>SIIE will send the selection results to the scholarship recipients via email.</li>
                        <li>Scholarships are limited. Applicants who meet the scholarship criteria may not be selected for the scholarship.
                            Scholarships will be considered based on SAT scores, English language scores, and interview scores.
                        </li>
                        <li>Scholarship recipients are required to assist the Faculty of Engineering or SIIE Office or Department or Program
                            for at least 45 hours per semester.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div><a href="<%= scholarshipLink %>" class="moreinfo-button" target="_blank">FOR MORE INFORMATION</a></div>
    </div>
    <jsp:include page="footer.jsp" />
    <!-- JavaScript for FAQ functionality -->
    <script>
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => {
                // Close all open items
                document.querySelectorAll('.faq-item').forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                        otherItem.querySelector('.faq-answer').style.maxHeight = '0';
                        otherItem.querySelector('.faq-answer').style.padding = "0 15px";
                    }
                });
                // Toggle the clicked item
                item.classList.toggle('active');
                let answer = item.querySelector('.faq-answer');

                if (item.classList.contains('active')) {
                    // Ensure content is visible to calculate accurate scrollHeight
                    answer.style.display = 'block';
                    answer.style.maxHeight = '0'; // Reset to 0 to force recalculation
                    // Force reflow by accessing offsetHeight
                    void answer.offsetHeight;
                    // Calculate scrollHeight and add a small buffer
                    let height = answer.scrollHeight + 10; // Add 10px buffer
                    answer.style.maxHeight = height + 'px';
                    answer.style.padding = "15px";
                } else {
                    answer.style.maxHeight = '0';
                    answer.style.padding = "0 15px";
                }
            });
        });
    </script>
</body>
</html>