<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Προβολή Καθηγητή</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
</head>
<body>
<%@ include file="header3.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-secondary text-white">
            <div class="d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-user-edit me-2"></i> Προβολή Καθηγητή
                </h4>
        
                <a href="${pageContext.request.contextPath}/school-app/teachers/view"
                   class="btn btn-danger text-white border-danger">
                    <i class="fas fa-arrow-left me-2"></i>
                    Επιστροφή στην Προβολή καθηγητών
                </a>
            </div>
        </div>

        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Όνομα</label>
                    <input type="text" class="form-control" value="${teacher.firstname}" disabled>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Επώνυμο</label>
                    <input type="text" class="form-control" value="${teacher.lastname}" disabled>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">ΑΦΜ</label>
                    <input type="text" class="form-control" value="${teacher.vat}" disabled>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Επώνυμο Πατρός</label>
                    <input type="text" class="form-control" value="${teacher.fatherName}" disabled>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Τηλέφωνο</label>
                    <input type="text" class="form-control" value="${teacher.phoneNum}" disabled>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control" value="${teacher.email}" disabled>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Οδός</label>
                    <input type="text" class="form-control" value="${teacher.street}" disabled>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Αριθμός</label>
                    <input type="text" class="form-control" value="${teacher.streetNum}" disabled>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="form-label">Τ.Κ.</label>
                    <input type="text" class="form-control" value="${teacher.zipCode}" disabled>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Πόλη</label>
                    <input type="text" class="form-control" value="${cityName}" disabled>
                </div>
            </div>
        </div>
    </div>   
</div>


<%@ include file="footer2.jsp"%>
<script src="${pageContext.request.contextPath}/js/teachers.js"></script>
</body>
</html>