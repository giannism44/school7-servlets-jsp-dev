<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Εγγραφή Χρήστη</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user-register.css">
</head>
<body>
<%@ include file="header.jsp"%>

<div class="main-content">

    <div class="form m-bottom">
<%--        <form method="POST" action="${pageContext.request.contextPath}/register">--%>
            <form method="POST" action="">
            <div class="row m-bottom">
                <input class="m-bottom" type="email" name="username" value="${requestScope.userRegisterDTO.username}" required placeholder="Username">
                <p class="validation-error">${requestScope.usernameMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="password" name="password" value="${requestScope.userRegisterDTO.password}" required placeholder="Password">
                <p class="validation-error">${requestScope.passwordMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="password" name="confirmPassword" value="${requestScope.userRegisterDTO.confirmPassword}" required placeholder="Confirm Password">
                <p class="validation-error">${requestScope.confirmPasswordMessage}</p>
            </div>
            <div class="row m-bottom">
                <select class="m-bottom" name="role">
                    <option value="ADMIN">Διαχειριστής</option>
                    <option value="LIGHT_ADMIN">Βοηθός Διαχειριστή</option>
                </select>
                <p class="validation-error">${requestScope.roleMessage}</p>
            </div>

            <div class="row">
                <button type="submit">Εγγραφή</button>
            </div>
        </form>
    </div>

    <div class="m-bottom">
        <a href="${pageContext.request.contextPath}/login">Επιστροφή</a>
    </div>

    <div>
        ${requestScope.errorMessage}
    </div>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
