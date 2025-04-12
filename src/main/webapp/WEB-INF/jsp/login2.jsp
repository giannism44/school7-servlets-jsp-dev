<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            600: '#2563eb',
                            700: '#1d4ed8',
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <%@ include file="header3.jsp"%>

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="w-full max-w-md">

            <div class="bg-white p-8 sm:p-10 rounded-xl shadow-md border border-gray-200">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-gray-800 mb-2">Καλωσήρθατε</h1>
                    <p class="text-gray-600">Είσοδος στον λογαριασμό σας</p>
                </div>

                <!-- Error Messages -->
                <c:if test="${not empty error}">
                    <div class="mb-6 p-3 bg-red-50 border-l-4 border-red-500 text-red-700 rounded">
                        <p>${error}</p>
                    </div>
                </c:if>
                <c:if test="${requestScope.isError == 'true'}">
                    <div class="mb-6 p-3 bg-red-50 border-l-4 border-red-500 text-red-700 rounded">
                        <p>Μη έγκυρο email ή password. Παρακαλώ ξαναπροσπαθήστε.</p>
                    </div>
                </c:if>

                <!-- Login Form -->
                <form method="POST" action="${pageContext.request.contextPath}/login" class="space-y-6">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                        <input id="username" name="username" type="email" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-600 focus:border-primary-600 transition duration-200"
                               placeholder="Εισάγετε το username">
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <input id="password" name="password" type="password" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-600 focus:border-primary-600 transition duration-200"
                               placeholder="Εισάγετε το password">
                    </div>

                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <input id="remember-me" name="remember-me" type="checkbox"
                                   class="h-4 w-4 text-primary-600 focus:ring-primary-500 border-gray-300 rounded">
                            <label for="remember-me" class="ml-2 block text-sm text-gray-700">
                                Remember me
                            </label>
                        </div>

                        <div class="text-sm">
                            <a href="#" class="font-medium text-primary-600 hover:text-primary-500">
                                Ξεχάσατε το password?
                            </a>
                        </div>
                    </div>

                    <div>
                        <button type="submit"
                                class="w-full flex justify-center py-2 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition duration-200">
                            Είσοδος
                        </button>
                    </div>
                </form>

                <div class="mt-6 text-center text-sm">
                    <p class="text-gray-500">
                        Δεν έχετε λογαριασμό?
                        <a href="${pageContext.request.contextPath}/register" class="font-medium text-primary-600 hover:text-primary-500">
                            Δημιουργήστε ένα εδώ
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </main>

    <%@include file="footer2.jsp"%>
</body>
</html>