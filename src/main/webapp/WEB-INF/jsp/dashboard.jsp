<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <style>
          
      .dropdown-menu .dropend:hover > .dropdown-menu {
            display: block;
            position: absolute;
            top: 0;
            left: 100%;
            margin-top: 0;
            margin-left: 0.1rem; 
          }

          .dropdown-menu .dropend {
                 position: relative;
            } 
      </style>

</head>
<body>
  <%@ include file="header3.jsp"%>


<div class="container-fluid ">
    <div class="row bg-success-subtle" style="min-height: 80vh;">

      <div class="dropdown col-md-2 border-end border-black ">
        <button class="btn btn-secondary dropdown-toggle btn-lg mt-2 btn-success" type="button" data-bs-toggle="dropdown" aria-expanded="false">
          Μενού
        </button>
        <ul class="dropdown-menu">

            <li class="dropend">
              <a class="dropdown-item dropdown-toggle" href="">Καθηγητές</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view' />">Προβολή</a></li>
                <li><a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/insert' />">Εισαγωγή</a></li>
                <li><a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/update' />">Επεξεργασία</a></li>
              </ul>
            </li>
            
            <li class="dropend">
              <a class="dropdown-item dropdown-toggle" href="#">Μαθητές</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Προβολή</a></li>
                <li><a class="dropdown-item" href="#">Εισαγωγή</a></li>
                <li><a class="dropdown-item" href="#">Διαγραφή</a></li>
              </ul>
            </li> 
        </ul>
      </div>

        <main class="col-md-10 p-4">
            <h2>Καλωσήρθες στην αρχική σελίδα του Coding Factory.Απο εδώ μπορείς να διαχειριστής τον λογαριασμό σου.</h2>
       </main>
    </div>
</div>



<%@ include file="footer2.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>
