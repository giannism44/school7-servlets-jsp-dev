<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<header class="bg-white shadow-sm">
    <div class="container mx-auto px-4">
        <!-- Main header content -->
        <div class="flex items-center justify-between py-3">
            <!-- Logo and title -->
            <div class="flex items-center space-x-4">
                <a href="${pageContext.request.contextPath}">
                    <img class="h-10 w-auto"
                         src="${pageContext.request.contextPath}/img/gov_header_logo.svg"
                         alt="Government Logo">
                </a>
                <span class="text-lg font-semibold text-gray-800 hidden sm:block">
                    Coding Factory - Education Reinvented
                </span>
            </div>

            <!-- User info and logout -->
            <div class="flex items-center space-x-4">
                <c:if test="${sessionScope.username != null}">
                    <div class="flex items-center space-x-2">
                        <span class="text-sm font-medium text-gray-600 hidden md:inline-flex">
                            ${sessionScope.username}
                        </span>
                        <a href="${pageContext.request.contextPath}/logout"
                           class="flex items-center px-3 py-1.5 text-sm font-medium text-red-600 hover:text-red-700 hover:bg-red-50 rounded-md transition-colors duration-200">
                            <span>Έξοδος</span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                            </svg>
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Decorative line -->
    <div class="h-0.5 bg-gradient-to-r from-blue-500 to-blue-300"></div>
</header>
</body>
</html>