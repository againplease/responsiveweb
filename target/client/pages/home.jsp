<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Home</title>
</head>
<body>
    <jsp:include page="menubar.jsp" />
    <jsp:include page="home/intro-section.jsp" />
    <jsp:include page="home/vdo-section.jsp" />
    <jsp:include page="home/facility-section.jsp" />
    <jsp:include page="home/highlight-section.jsp" />
    <jsp:include page="home/faq-section.jsp" />
    <jsp:include page="home/sponsor-section.jsp" />
    <jsp:include page="footer.jsp" />

</body>
</html>