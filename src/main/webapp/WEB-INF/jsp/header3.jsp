<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            800: '#1e3a8a',  // Dark blue for header
                            900: '#172554'   // Even darker blue
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
<header class="bg-primary-800">
    <div class="container mx-auto px-4">
        <!-- Main header content -->
        <div class="flex items-center justify-between py-3">
            <!-- Logo and title -->
            <div class="flex items-center space-x-4">
                <a href="${pageContext.request.contextPath}">
                    <img class="h-10 w-auto"
                         src="${pageContext.request.contextPath}/img/gov_header_logo.svg"
                         alt="Government Logo"
                         style="filter: brightness(0) invert(1)"> <!-- Ensures white logo visibility -->
                </a>
                <span class="text-lg font-semibold text-white hidden sm:block">
                    Coding Factory - Education Reinvented
                </span>
            </div>

            <!-- User info and logout -->
            <div class="flex items-center space-x-4">
                <c:if test="${sessionScope.username != null}">
                    <div class="flex items-center space-x-3">
                        <span class="text-sm font-medium text-gray-200 hidden md:inline-flex">
                            ${sessionScope.username}
                        </span>
                        <a href="${pageContext.request.contextPath}/logout"
                           class="flex items-center px-3 py-1.5 text-sm font-medium text-white hover:text-gray-200 hover:bg-primary-700 rounded-md transition-colors duration-200 border border-gray-300 border-opacity-20">
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
    <div class="h-0.5 bg-gradient-to-r from-blue-400 to-blue-600"></div>
</header>
</body>
</html>