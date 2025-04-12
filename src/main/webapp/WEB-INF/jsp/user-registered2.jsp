<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Επιτυχής Εισαγωγή</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <div class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="w-full max-w-md text-center">
            <!-- Success Card -->
            <div class="bg-white p-8 rounded-xl shadow-md border border-green-100 transform transition-all duration-200 hover:shadow-lg">
                <!-- Success Icon -->
                <div class="mx-auto flex items-center justify-center h-16 w-16 rounded-full bg-green-100 mb-4">
                    <i class="fas fa-check-circle text-green-600 text-3xl"></i>
                </div>

                <!-- Success Message -->
                <h1 class="text-2xl font-bold text-gray-800 mb-2">Επιτυχής Εγγραφή!</h1>
                <p class="text-gray-600 mb-6">Ο λογαριασμός δημιουργήθηκε με επιτυχία</p>

                <!-- User Info -->
                <div class="bg-gray-50 p-4 rounded-lg mb-6">
                    <p class="text-gray-700 font-medium">
                        <span class="text-gray-500">Username:</span>
                        <span class="text-blue-600">${sessionScope.userInfo.username}</span>
                    </p>
                </div>

                <!-- Return Button -->
                <a href="${pageContext.request.contextPath}/login"
                   class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Επιστροφή στη σελίδα εισόδου
                </a>
            </div>

            <!-- Additional Help -->
            <p class="mt-6 text-sm text-gray-500">
                Προβλήματα με την είσοδο;
                <a href="#" class="font-medium text-blue-600 hover:text-blue-500">Επικοινωνήστε με την υποστήριξη</a>
            </p>
        </div>
    </div>
</body>
</html>