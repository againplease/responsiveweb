<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.net.URLDecoder, bean.dBConnection" %>
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
            padding-top: 120px;
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
    <%
        String encodedUrl = request.getParameter("url");
        String pdfUrl = encodedUrl != null ? URLDecoder.decode(encodedUrl, "UTF-8") : "";
        String type = request.getParameter("type");
        String subtitle = "Curriculum Information";
        // Define safeType to escape special characters for JavaScript
        String safeType = type != null ? type.replace("\"", "\\\"").replace("'", "\\'") : "Undergraduate";

        if (pdfUrl != null && !pdfUrl.isEmpty()) {
            try (Connection conn = dBConnection.getConnection()) {
                String sql = "SELECT title FROM curriculum WHERE link_url = ? OR minio_url = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, pdfUrl);
                stmt.setString(2, pdfUrl);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    subtitle = rs.getString("title");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
    <div class="subtitle"><%= subtitle %></div>
    <% if (pdfUrl != null && !pdfUrl.isEmpty()) { %>
        <p>
            <span class="pdf-link" onclick="openPdf('<%= pdfUrl %>')">Click here to view the PDF</span>
        </p>
        <p class="message">
            Pop-up was blocked. Please allow pop-ups for this site and click the link above to view the PDF.
            This page will return to the curriculum list in 30 seconds.
        </p>
        <script>
            function openPdf(url) {
                var pdfWindow = window.open(url, "_blank");
                if (!pdfWindow || pdfWindow.closed || typeof pdfWindow.closed === 'undefined') {
                    alert("Pop-up blocked! Please allow pop-ups for this site and try again.");
                }
            }

            window.onload = function() {
                openPdf("<%= pdfUrl %>");
                setTimeout(function() {
                    window.location.href = "<%= request.getContextPath() %>/pages/curriculum/curriculum_type.jsp?type=<%= safeType %>";
                }, 30000);
            };
        </script>
    <% } else { %>
        <p class="no-pdf">No PDF available for this selection.</p>
    <% } %>
    <jsp:include page="../footer.jsp" />
</body>
</html>