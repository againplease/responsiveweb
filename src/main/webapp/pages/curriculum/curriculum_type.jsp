<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.HashMap, java.util.List, java.util.Map, bean.dBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum</title>
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
            padding-top: 120px;
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
    <h1 class="page-title">Curriculum</h1>
    <%
        String docType = request.getParameter("type");
        if (docType == null || docType.isEmpty()) {
            docType = "Undergraduate";
        }
        // Use the exact key as in the map, no unnecessary capitalization
        String capitalizedDocType = docType;

        // Debug output
        out.println("<!-- docType: " + docType + ", capitalizedDocType: " + capitalizedDocType + " -->");
    %>
    <h2 class="sub-title"><%= capitalizedDocType %></h2>

    <div class="document-list" id="documentList">
        <% 
            Map<String, List<Map<String, String>>> documents = new HashMap<>();
            documents.put("Undergraduate", new ArrayList<>());
            documents.put("Master", new ArrayList<>());
            documents.put("Doctorate", new ArrayList<>());
            documents.put("AIMinor", new ArrayList<>());

            try (Connection conn = dBConnection.getConnection()) {
                String sql = "SELECT title, curriculum_type, link_url FROM curriculum WHERE title NOT LIKE '%Overview'";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    String title = rs.getString("title");
                    String curriculumType = rs.getString("curriculum_type");
                    String linkUrl = rs.getString("link_url");

                    Map<String, String> doc = new HashMap<>();
                    doc.put("name", title);
                    doc.put("link", linkUrl);

                    // Debug output
                    out.println("<!-- Processing: Title: " + title + ", Type: " + curriculumType + " -->");

                    if ("undergraduate".equalsIgnoreCase(curriculumType)) {
                        documents.get("Undergraduate").add(doc);
                    } else if ("master".equalsIgnoreCase(curriculumType)) {
                        documents.get("Master").add(doc);
                    } else if ("doctorate".equalsIgnoreCase(curriculumType) || "phd".equalsIgnoreCase(curriculumType)) {
                        documents.get("Doctorate").add(doc);
                    } else if ("AIMinor".equalsIgnoreCase(curriculumType)) { // Match exact database value
                        documents.get("AIMinor").add(doc);
                    }
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                // Fallback data
                documents.get("Undergraduate").add(Map.of("name", "Undergraduate 2018", "link", "https://drive.google.com/file/d/1XEynHM-hJvD2m3509VcJ4iZkAXYMCOSb/view"));
                documents.get("Undergraduate").add(Map.of("name", "Undergraduate 2020", "link", "https://drive.google.com/file/d/1m4UWd5fGcpyhaaesU5xWkhyaVitwIUFG/view"));
                documents.get("Undergraduate").add(Map.of("name", "Undergraduate 2025", "link", "https://drive.google.com/file/d/1E-9qUBH3RUVt6VltSUlPxrni7nsLaSA9/view"));
                documents.get("Master").add(Map.of("name", "Master 2019", "link", "https://drive.google.com/file/d/1mdB3HnVz-ZVCQRZaWt7PAno4NA_YcRHy/view"));
                documents.get("Master").add(Map.of("name", "Master 2022", "link", "https://drive.google.com/file/d/1UwbP-dSffLVKQPmIwFVu-YVNbhzFw8L3/view"));
                documents.get("Doctorate").add(Map.of("name", "PhD 2019", "link", "https://drive.google.com/file/d/19ssnEWzB5ndjIJQOhjLG6zrC5Uvk3hXv/view"));
                documents.get("Doctorate").add(Map.of("name", "PhD 2022", "link", "https://drive.google.com/file/d/1v0JsaguTs_Au8RjpBaKvLGyojBLo4NKO/view"));
                documents.get("AIMinor").add(Map.of("name", "AI Minor", "link", "https://www.reg.kmitl.ac.th/curriculum/file/minor/01/AI.pdf?curr=172"));
                documents.get("AIMinor").add(Map.of("name", "AI Minor 2022", "link", "https://www.reg.kmitl.ac.th/curriculum/file/minor/01/AI_edit_2565.pdf?curr=910"));
            }

            List<Map<String, String>> docs = documents.getOrDefault(capitalizedDocType, new ArrayList<>());
            // Debug output
            out.println("<!-- Docs size for " + capitalizedDocType + ": " + docs.size() + " -->");
            for (Map<String, String> doc : docs) {
                String name = doc.get("name");
                String link = doc.get("link");
                String encodedLink = java.net.URLEncoder.encode(link, "UTF-8");
        %>
            <div class="document-item" onclick="openCurriculum('<%= link %>', '<%= encodedLink %>', '<%= capitalizedDocType %>')">
                <%= name %>
            </div>
        <% 
            }
        %>
    </div>
    <script>
        function openCurriculum(url, encodedUrl, type) {
            var pdfWindow = window.open(url, '_blank');
            if (!pdfWindow || pdfWindow.closed || typeof pdfWindow.closed === 'undefined') {
                window.location.href = 'curriculum_detail.jsp?url=' + encodedUrl + '&type=' + type;
            }
        }
    </script>
    <jsp:include page="../footer.jsp" />
</body>
</html>