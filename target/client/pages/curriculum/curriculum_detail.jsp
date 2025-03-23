<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<%
    String type = request.getParameter("type");
    String pdfUrl = "";
    String subtitle = "";

    if (type != null) {
        switch (type) {
            case "undergraduate":
                pdfUrl = ConfigUtil.getProperty("undergraduate.url");
                subtitle = "Undergraduate";
                break;
            case "master":
                pdfUrl = ConfigUtil.getProperty("master.url");
                subtitle = "Master";
                break;
            case "phd":
                pdfUrl = ConfigUtil.getProperty("phd.url");
                subtitle = "Ph.D";
                break;
            case "aiminor":
                pdfUrl = ConfigUtil.getProperty("aiminor.url");
                subtitle = "AI Minor";
                break;
            default:
                pdfUrl = "";
                subtitle = "Curriculum Information";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum Detail</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background-color: #ffffff;
            text-align: center;
        }

        .title {
            font-size: 65px;
            font-weight: bold;
            padding-top: 120px; /* Space for sidemenu hamburger */
            margin: 0 0 20px;
        }

        .subtitle {
            font-size: 35px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .no-pdf {
            font-size: 20px;
            color: #666;
            margin-top: 20px;
        }
        .pdf-link {
            color: #007bff;
            text-decoration: underline;
            cursor: pointer;
        }
        .message {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }

        /* Basic responsiveness for fallback */
        @media screen and (max-width: 768px) {
            .title {
                font-size: 32px;
                padding-top: 80px;
                margin-bottom: 15px;
            }
            .subtitle {
                font-size: 20px;
                margin-bottom: 20px;
            }
            .no-pdf {
                font-size: 16px;
                margin-top: 15px;
            }
        }

        @media screen and (max-width: 480px) {
            .title {
                font-size: 24px;
                padding-top: 60px;
                margin-bottom: 10px;
            }
            .subtitle {
                font-size: 16px;
                margin-bottom: 15px;
            }
            .no-pdf {
                font-size: 14px;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <div class="title">Curriculum</div>
    <div class="subtitle"><%= subtitle %></div>
    <% if (pdfUrl != null && !pdfUrl.isEmpty()) { %>
        <p>
            <span class="pdf-link" onclick="openPdf('<%= pdfUrl %>')">Click here to view the PDF</span>
        </p>
        <p class="message">
            After viewing, this page will return to the curriculum in 30 seconds. 
            If the PDF doesn't open, allow pop-ups for this site and try again.
        </p>
        <script>
            function openPdf(url) {
                var pdfWindow = window.open(url, "_blank");
                if (!pdfWindow || pdfWindow.closed || typeof pdfWindow.closed === 'undefined') {
                    alert("Pop-up blocked! Please allow pop-ups for this site and click the link again.");
                } else {
                    // Start the 30-second timer only if the pop-up opens successfully
                    setTimeout(function() {
                        window.location.href = "<%= request.getContextPath() %>/pages/curriculum/curriculum.jsp";
                    }, 30000);
                }
            }

            // Attempt to open the PDF automatically on page load
            window.onload = function() {
                openPdf("<%= pdfUrl %>");
            };
        </script>
    <% } else { %>
        <p class="no-pdf">No PDF available for this selection.</p>
    <% } %>
</body>
</html>