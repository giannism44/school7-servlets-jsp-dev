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
    <title>Επεξεργασία Καθηγητή</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
</head>
<body>
<%@ include file="header3.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow">
        <div class="card-header bg-red-800 text-white">
            <h4 class="mb-0"><i class="fas fa-user-edit me-2">Επεξεργασία Καθηγητή</i></h4>
        </div>
        <div class="card-body">
            <form method="POST" action="${pageContext.request.contextPath}/school-app/teachers/update">
                <input type="hidden" name="id" value="${requestScope.updateDTO.id}"/>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Όνομα</label>
                        <input type="text" name="firstname" class="form-control" value="${requestScope.updateDTO.firstname}">
                        <small class="text-danger">${sessionScope.firstnameMessage}</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Επώνυμο</label>
                        <input type="text" name="lastname" class="form-control" value="${requestScope.updateDTO.lastname}">
                        <small class="text-danger">${sessionScope.lastnameMessage}</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">ΑΦΜ</label>
                        <input type="text" name="vat" class="form-control" value="${requestScope.updateDTO.vat}">
                        <small class="text-danger">${sessionScope.vatMessage}</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Επώνυμο Πατρός</label>
                        <input type="text" name="fathername" class="form-control" value="${requestScope.updateDTO.fatherName}">
                        <small class="text-danger">${sessionScope.fathernameMessage}</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Τηλέφωνο</label>
                        <input type="text" name="phoneNum" class="form-control" value="${requestScope.updateDTO.phoneNum}">
                        <small class="text-danger">${sessionScope.phoneNumMessage}</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" value="${requestScope.updateDTO.email}">
                        <small class="text-danger">${sessionScope.emailMessage}</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Οδός</label>
                        <input type="text" name="street" class="form-control" value="${requestScope.updateDTO.street}">
                        <small class="text-danger">${sessionScope.streetMessage}</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Αριθμός</label>
                        <input type="text" name="streetNum" class="form-control" value="${requestScope.updateDTO.streetNum}">
                        <small class="text-danger">${sessionScope.streetNumMessage}</small>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label class="form-label">Τ.Κ.</label>
                        <input type="text" name="zipcode" class="form-control" value="${requestScope.updateDTO.zipCode}">
                        <small class="text-danger">${sessionScope.zipcodeMessage}</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Πόλη</label>
                        <select class="form-select" name="cityId">
                            <option disabled ${empty updateDTO.cityId ? 'selected' : ''}>Επιλέξτε πόλη</option>
                            <c:forEach items="${cities}" var="city">
                                <option value="${city.id}" ${city.id eq updateDTO.cityId ? 'selected' : ''}>
                                    ${city.name}
                                </option>
                            </c:forEach>
                        </select>
                        <small class="text-danger">${sessionScope.cityIdMessage}</small>
                    </div>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/school-app/teachers/view" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Επιστροφή
                    </a>
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-save me-1"></i> Ενημέρωση
                    </button>
                </div>
            </form>

            <c:if test="${not empty requestScope.errorMessage}">
                <div class="alert alert-danger mt-4" role="alert">
                    ${requestScope.errorMessage}
                </div>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="footer2.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>
