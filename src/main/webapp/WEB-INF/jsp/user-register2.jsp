<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Εγγραφή Χρήστη</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
<%@ include file="header3.jsp"%>

<main class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="w-full max-w-md space-y-8">
        <div class="text-center">
            <h2 class="mt-6 text-3xl font-bold text-gray-900">Εγγραφή Χρήστη</h2>
            <p class="mt-2 text-sm text-gray-600">Δημιουργήστε έναν νέο λογαριασμό</p>
        </div>

        <c:if test="${not empty requestScope.errorMessage}">
            <div class="rounded-md bg-red-50 p-4 mb-4">
                <div class="flex">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <div class="ml-3">
                        <p class="text-sm font-medium text-red-800">${requestScope.errorMessage}</p>
                    </div>
                </div>
            </div>
        </c:if>

        <form method="POST" action="" class="mt-8 space-y-6">
            <div class="rounded-md shadow-sm space-y-4">
                <div>
                    <label for="username" class="sr-only">Username</label>
                    <input id="username" name="username" type="email" autocomplete="email" required
                           value="${requestScope.userRegisterDTO.username}"
                           class="relative block w-full px-3 py-2 border ${not empty requestScope.usernameMessage ? 'border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500' : 'border-gray-300 placeholder-gray-500 focus:outline-none focus:ring-blue-500 focus:border-blue-500'} rounded-md shadow-sm"
                           placeholder="Email">
                    <c:if test="${not empty requestScope.usernameMessage}">
                        <p class="mt-2 text-sm text-red-600">${requestScope.usernameMessage}</p>
                    </c:if>
                </div>

                <div>
                    <label for="password" class="sr-only">Password</label>
                    <input id="password" name="password" type="password" autocomplete="new-password" required
                           value="${requestScope.userRegisterDTO.password}"
                           class="relative block w-full px-3 py-2 border ${not empty requestScope.passwordMessage ? 'border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500' : 'border-gray-300 placeholder-gray-500 focus:outline-none focus:ring-blue-500 focus:border-blue-500'} rounded-md shadow-sm"
                           placeholder="Password">
                    <c:if test="${not empty requestScope.passwordMessage}">
                        <p class="mt-2 text-sm text-red-600">${requestScope.passwordMessage}</p>
                    </c:if>
                </div>

                <div>
                    <label for="confirmPassword" class="sr-only">Confirm Password</label>
                    <input id="confirmPassword" name="confirmPassword" type="password" autocomplete="new-password" required
                           value="${requestScope.userRegisterDTO.confirmPassword}"
                           class="relative block w-full px-3 py-2 border ${not empty requestScope.confirmPasswordMessage ? 'border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500' : 'border-gray-300 placeholder-gray-500 focus:outline-none focus:ring-blue-500 focus:border-blue-500'} rounded-md shadow-sm"
                           placeholder="Confirm Password">
                    <c:if test="${not empty requestScope.confirmPasswordMessage}">
                        <p class="mt-2 text-sm text-red-600">${requestScope.confirmPasswordMessage}</p>
                    </c:if>
                </div>

                <div>
                    <label for="role" class="sr-only">Role</label>
                    <select id="role" name="role"
                            class="relative block w-full px-3 py-2 border ${not empty requestScope.roleMessage ? 'border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500' : 'border-gray-300 placeholder-gray-500 focus:outline-none focus:ring-blue-500 focus:border-blue-500'} rounded-md shadow-sm">
                        <option value="ADMIN">Διαχειριστής</option>
                        <option value="LIGHT_ADMIN">Βοηθός Διαχειριστή</option>
                    </select>
                    <c:if test="${not empty requestScope.roleMessage}">
                        <p class="mt-2 text-sm text-red-600">${requestScope.roleMessage}</p>
                    </c:if>
                </div>
            </div>

            <div>
                <button type="submit"
                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-800 hover:bg-red-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200">
                    Εγγραφή
                </button>
            </div>
        </form>

        <div class="text-center">
            <a href="${pageContext.request.contextPath}/login" class="font-medium text-red-800 hover:text-red-900 transition-colors duration-200">
                Επιστροφή στη σελίδα εισόδου
            </a>
        </div>
    </div>
</main>

<%@ include file="footer2.jsp"%>
</body>
</html>