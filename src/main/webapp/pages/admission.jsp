<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%
    String admissionUrl = ConfigUtil.getProperty("admission.url");
    %>
    <script>
        window.onload = function() {
            // Open the admission URL in a new tab
            window.open('<%= admissionUrl %>', '_blank');

            // Redirect back to home.jsp after opening the new tab
            window.location.href = 'home.jsp';
        };
    </script>
</head>
<body>
</body>
</html>
