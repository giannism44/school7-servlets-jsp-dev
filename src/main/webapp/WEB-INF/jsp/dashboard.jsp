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
                    <li>
                        <a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view' />">
                        Προβολή
                        </a>
                    </li>

                    <c:if test="${sessionScope.role == 'ADMIN'}">
                     <li>
                        <a class="dropdown-item"
                         href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/insert' />">
                         Εισαγωγή
                        </a>
                      </li>
                    </c:if>
              </ul>
            </li>
            
            <li class="dropend">
              <a class="dropdown-item dropdown-toggle" href="#">Μαθητές</a>
              <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item" href="#">
                    Προβολή
                    </a>
                </li>

                 <c:if test="${sessionScope.role == 'ADMIN'}">
                    <li>
                        <a class="dropdown-item" href="#">
                        Εισαγωγή
                        </a>
                    </li>
                 </c:if>
              </ul>
            </li> 
        </ul>
      </div>

        <main class="col-md-10 p-4">
            <h1 class="text-center fw-bold display-6 mb-5">
              Καλωσήρθες στην αρχική σελίδα του Coding Factory.</h1>
              

            <div class="row">

              <div class="col-md-2">
                <div class="card shadow-sm border-0">
                  <div class="card-body">
                      <h5 class="card-title text-primary fw-bold">
                          <i class="fas fa-info-circle me-2">Πληροφορίες Πλοήγησης</i>
                      </h5>
                      <p class="card-text fs-5">
                          Μέσα από το <strong>μενού αριστερά</strong> μπορείτε να δείτε και να διαχειριστείτε πληροφορίες για τους <strong>μαθητές</strong> και τους <strong>καθηγητές</strong> του πανεπιστημίου.
                          Ανάλογα με τα δικαιώματα πρόσβασης, μπορείτε να προβάλετε, να επεξεργαστείτε ή να προσθέσετε εγγραφές.
                      </p>
                  </div>
                </div>
              </div>

              <div class="col-md-10 mx-auto mt-5">
                <div class="mb-5">
                  <h4 class="fw-bold text-secondary">
                    <i class="fas fa-users me-2">Προσωπικό Σχολής</i>
                  </h4>
                  <p class="text-muted">
                    Το συνολικό ανθρώπινο δυναμικό του ιδρύματος, περιλαμβάνοντας διοικητικό και εκπαιδευτικό προσωπικό.
                  </p>
                  <div class="progress" style="height: 30px;">
                    <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated"
                         role="progressbar" style="width: 55%;" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                      85 άτομα
                    </div>
                  </div>
                </div>
              
                <div class="mb-5">
                  <h4 class="fw-bold text-secondary">
                    <i class="fas fa-chalkboard-teacher me-2">Καθηγητές</i>
                  </h4>
                  <p class="text-muted">
                    Μέλη ΔΕΠ και λοιπό διδακτικό προσωπικό που συμβάλλουν στην ακαδημαϊκή πορεία των φοιτητών.
                  </p>
                  <div class="progress" style="height: 30px;">
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated"
                         role="progressbar" style="width: 35%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                      30 καθηγητές
                    </div>
                  </div>
                </div>
              
                <div class="mb-5">
                  <h4 class="fw-bold text-secondary">
                    <i class="fas fa-user-graduate me-2">Μαθητές</i>
                  </h4>
                  <p class="text-muted">
                    Εγγεγραμμένοι φοιτητές όλων των εξαμήνων που παρακολουθούν ενεργά τα προγράμματα σπουδών της σχολής.
                  </p>
                  <div class="progress" style="height: 30px;">
                    <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
                         role="progressbar" style="width: 90%;" aria-valuenow="286" aria-valuemin="0" aria-valuemax="300">
                      286 μαθητές
                    </div>
                  </div>
                </div>
              </div>
              

            </div>  
       </main>
    </div>
</div>



<%@ include file="footer2.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>
