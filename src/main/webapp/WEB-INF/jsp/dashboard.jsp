<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">-->
</head>
<body>


        <div>
            <a href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view' />">Προβολή Καθηγητών</a>
        </div>

</body>
</html>
