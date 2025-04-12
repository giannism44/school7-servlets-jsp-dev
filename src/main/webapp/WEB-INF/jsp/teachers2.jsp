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
    <title>Προβολή Καθηγητών</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gray-50">
<%@ include file="header.jsp"%>
<div class="container mx-auto px-4 py-8">

 <c:if test="${sessionScope.role == 'ADMIN'}">
    <div class="mb-6">
        <a href="${pageContext.request.contextPath}/school-app/teachers/insert" class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded transition duration-200">
            Εισαγωγή Καθηγητή
        </a>
    </div>
 </c:if>

    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <form id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/teachers/view" class="flex flex-wrap gap-4 items-end">
            <div class="flex-grow">
                <label for="firstname" class="block text-sm font-medium text-gray-700 mb-1">Όνομα</label>
                <input type="text" name="firstname" id="firstname" placeholder="Όνομα" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" />
            </div>
            <div class="flex-grow">
                <label for="lastname" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο</label>
                <input type="text" name="lastname" id="lastname" placeholder="Επώνυμο" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" />
            </div>
            <button id="submitBtn" type="submit" class="bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-4 rounded transition duration-200">
                Αναζήτηση
            </button>
            <button id="resetBtn" type="button" onclick="reset()" class="bg-gray-500 hover:bg-gray-600 text-white font-medium py-2 px-4 rounded transition duration-200">
                Επαναφορά
            </button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden mb-6">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Κωδικός</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Όνομα</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Επώνυμο</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Πράξεις</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="teacher" items="${requestScope.teachers}">
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${teacher.id}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${teacher.firstname}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${teacher.lastname}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <div class="flex space-x-4">
                                <a href="${pageContext.request.contextPath}/school-app/teachers/view?id=${teacher.id}" class="text-blue-500 hover:text-blue-700">
                                    <i class="fa-regular fa-eye"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/school-app/teachers/update?id=${teacher.id}" class="text-yellow-500 hover:text-yellow-700">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/school-app/teachers/delete?id=${teacher.id}"
                                   onclick="return confirm('Are you sure you want to delete the teacher?')" class="text-red-500 hover:text-red-700">
                                    <i class="fa-solid fa-trash-can"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<%@ include file="footer.jsp"%>

<script src="${pageContext.request.contextPath}/js/teachers.js"></script>
</body>
</html>