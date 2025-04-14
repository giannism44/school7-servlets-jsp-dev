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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Προβολή Καθηγητών</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            500: '#9c1c1c',
                            600: '#801818',
                        },
                        success: {
                            500: '#10b981',
                            600: '#059669',
                        },
                        warning: {
                            500: '#f59e0b',
                            600: '#d97706',
                        },
                        danger: {
                            500: '#ef4444',
                            600: '#dc2626',
                        },
                    }
                }
            }
        }
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
<%@ include file="header3.jsp"%>
<main class="flex-grow container mx-auto px-4 py-8">

    <!-- Page Header -->
    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
        <div>
            <h1 class="text-2xl font-bold text-gray-800">Καθηγητές</h1>
            <p class="text-gray-600">Διαχείριση και προβολή καθηγητών</p>
        </div>

       <div class="flex flex-col gap-2">
           <c:if test="${sessionScope.role == 'ADMIN'}">
               <a href="${pageContext.request.contextPath}/school-app/teachers/insert"
                  class="inline-flex items-center px-4 py-2 bg-primary-500 hover:bg-primary-600 text-white font-medium rounded-lg">
                   <i class="fas fa-plus mr-2"></i>
                   Εισαγωγή Καθηγητή
               </a>
           </c:if>

           <a href="${pageContext.request.contextPath}/school-app/dashboard"
              class="inline-flex items-center px-4 py-2 bg-primary-500 hover:bg-primary-600 text-white font-medium rounded-lg">
               <i class="fas fa-arrow-left mr-2"></i>
               Επιστροφή στην Αρχική
           </a>
       </div>
    </div>

    <!-- Search Card -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden mb-8">
        <div class="p-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-4">Αναζήτηση Καθηγητών</h2>
            <form id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/teachers/view" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div>
                    <label for="firstname" class="block text-sm font-medium text-gray-700 mb-1">Όνομα</label>
                    <input type="text" name="firstname" id="firstname" placeholder="Όνομα"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition duration-150" />
                </div>
                <div>
                    <label for="lastname" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο</label>
                    <input type="text" name="lastname" id="lastname" placeholder="Επώνυμο"
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition duration-150" />
                </div>
                <div class="flex items-end space-x-2 md:col-span-2">
                    <button id="submitBtn" type="submit"
                            class="flex-1 inline-flex justify-center items-center px-4 py-2 bg-success-500 hover:bg-success-600 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm">
                        <i class="fas fa-search mr-2"></i>
                        Αναζήτηση
                    </button>
                    <button id="resetBtn" type="button" onclick="reset()"
                            class="flex-1 inline-flex justify-center items-center px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium rounded-lg transition-colors duration-200 shadow-sm">
                        <i class="fas fa-undo mr-2"></i>
                        Επαναφορά
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Results Section -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Κωδικος</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ονομα</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Επωνυμο</th>
                        <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Πραξεις</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:choose>
                        <c:when test="${not empty requestScope.teachers}">
                            <c:forEach var="teacher" items="${requestScope.teachers}">
                                <tr class="hover:bg-gray-50 transition-colors duration-150">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${teacher.id}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${teacher.firstname}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${teacher.lastname}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-right">
                                        <div class="flex justify-end space-x-3">
                                            <a href="${pageContext.request.contextPath}/school-app/teachers/view?id=${teacher.id}"
                                               class="text-primary-500 hover:text-primary-600 p-1 rounded-full hover:bg-primary-50 transition-colors duration-200"
                                               title="Προβολή">
                                                <i class="fas fa-eye w-5 h-5"></i>
                                            </a>
                                            <c:if test="${sessionScope.role == 'ADMIN'}">
                                                        <a href="${pageContext.request.contextPath}/school-app/teachers/update?id=${teacher.id}"
                                                        class="text-warning-500 hover:text-warning-600 p-1 rounded-full hover:bg-warning-50 transition-colors duration-200"
                                                        title="Επεξεργασία">
                                                        <i class="fas fa-pen-to-square w-5 h-5"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/school-app/teachers/delete?id=${teacher.id}"
                                                           onclick="return confirm('Είστε βέβαιοι ότι θέλετε να διαγράψετε τον καθηγητή;')"
                                                           class="text-danger-500 hover:text-danger-600 p-1 rounded-full hover:bg-danger-50 transition-colors duration-200"
                                                           title="Διαγραφή">
                                                            <i class="fas fa-trash-can w-5 h-5"></i>
                                                        </a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4" class="px-6 py-4 text-center text-sm text-gray-500">
                                    Δεν βρέθηκαν καθηγητές
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Messages -->
    <c:if test="${not empty requestScope.message}">
        <div class="mt-6">
            <div class="${requestScope.message.contains('επιτυχ') ? 'bg-success-50 border-success-200 text-success-700' : 'bg-danger-50 border-danger-200 text-danger-700'} border rounded-lg p-4">
                <div class="flex items-center">
                    <i class="${requestScope.message.contains('επιτυχ') ? 'fas fa-check-circle text-success-500' : 'fas fa-exclamation-circle text-danger-500'} mr-2"></i>
                    <span class="font-medium">${requestScope.message}</span>
                </div>
            </div>
        </div>
    </c:if>
</main>

<%@ include file="footer2.jsp"%>

<script src="${pageContext.request.contextPath}/js/teachers.js"></script>
</body>
</html>