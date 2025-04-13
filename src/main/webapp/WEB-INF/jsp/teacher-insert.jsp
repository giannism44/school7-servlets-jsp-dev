<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Εισαγωγή Καθηγητή</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher-insert.css">
</head>
<body>
<%@ include file="header3.jsp"%>
<div class="main-content">

    <div class="form m-bottom">
        <form method="POST" action="${pageContext.request.contextPath}/school-app/teachers/insert">
            <div class="row m-bottom">
                <div>
                    <input class="m-bottom" type="text" name="firstname" value="${requestScope.insertDTO.firstname}" placeholder="Όνομα">
                    <p class="validation-error">${sessionScope.firstnameMessage}</p>
                </div>
                <div>
                    <input class="m-bottom" type="text" name="lastname" value="${requestScope.insertDTO.lastname}" placeholder="Επώνυμο">
                    <p class="validation-error">${sessionScope.lastnameMessage}</p>
                </div>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="vat" value="${requestScope.insertDTO.vat}" placeholder="ΑΦΜ">
                <p class="validation-error">${sessionScope.vatMessage}</p>
                <input class="m-bottom" type="text" name="fathername" value="${requestScope.insertDTO.fatherName}" placeholder="Επώνυμο Πατρός">
                <p class="validation-error">${requestScope.fathernameMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="phoneNum" value="${requestScope.insertDTO.phoneNum}" placeholder="Αριθμός Τηλεφώνου">
                <p class="validation-error">${sessionScope.phoneNumMessage}</p>
                <input class="m-bottom" type="text" name="email" value="${requestScope.insertDTO.email}" placeholder="E-mail">
                <p class="validation-error">${requestScope.emailMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="street" value="${requestScope.insertDTO.street}" placeholder="Οδός">
                <p class="validation-error">${sessionScope.streetMessage}</p>
                <input class="m-bottom" type="text" name="streetNum" value="${requestScope.insertDTO.streetNum}" placeholder="Αριθμός">
                <p class="validation-error">${requestScope.streetNumMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="zipcode" value="${requestScope.insertDTO.zipCode}" placeholder="ΤΚ">
                <p class="validation-error">${sessionScope.zipcodeMessage}</p>

            <!-- City Dropdown -->
                <select class="m-bottom" name="cityId">
                <%-- The Select City option appears in the dropdown but cannot be chosen after a real selection is made --%>
                    <option value="" disabled ${empty insertDTO.cityId ? 'selected' : ''}>
                        Select City
                    </option>
                    <c:forEach items="${requestScope.cities}" var="city">
                        <option value="${city.id}"
                                ${city.id eq insertDTO.cityId ? 'selected' : ''}>
                            ${city.name}
                        </option>
                    </c:forEach>
                </select>
                <p class="validation-error">${sessionScope.cityIdMessage}</p>
            </div>
            <div class="row">
                <button type="submit">Εισαγωγή</button>
            </div>
        </form>
    </div>

    <div class="m-bottom">
        <a href="${pageContext.request.contextPath}/school-app/teachers/view">Επιστροφή</a>
    </div>

    <div>
        ${sessionScope.errorMessage}
    </div>
</div>

<%@ include file="footer2.jsp"%>
</body>
</html>
