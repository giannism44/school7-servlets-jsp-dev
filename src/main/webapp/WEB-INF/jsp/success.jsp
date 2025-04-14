<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
  </head>
  <body>
    <%@ include file="header3.jsp" %>

    <div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 70vh;">
      <div class="alert alert-success text-center p-4 shadow rounded" role="alert">
          <h4 class="alert-heading">✅ Επιτυχία!</h4>
          <p class="mt-3">${requestScope.message}</p>
          <hr>
          <a href="${pageContext.request.contextPath}/school-app/teachers/view" class="btn btn-success mt-3">
              Μετάβαση στην Προβολή Καθηγητών
          </a>
      </div>
  </div>


    <%@ include file="footer2.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
  </body>
</html>