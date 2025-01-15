<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />

		<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
        <link rel="preconnect" href="https://fonts.bunny.net" />
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
        
        
        <script type="text/javascript">

       



        function exportToExcel(tableId, filename = "qlsv") {
        	 // Get the table element
            var table = document.getElementById(tableId);

            // Convert table to worksheet
            var worksheet = XLSX.utils.table_to_sheet(table);

            // Create a new workbook and append the worksheet
            var workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");

            XLSX.writeFile(workbook,filename+'-'+Date.now()+'.xlsx');
        }
        </script>
        

        <title>Quản lý sinh viên</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css" />
    </head>

    <body class="text-gray-800 font-inter">
        <main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-200 min-h-screen transition-all main">
            <jsp:include page="/components/admin-sidebar.jsp"></jsp:include>
            <jsp:include page="/components/navbar.jsp"></jsp:include>
            <c:choose>
                <c:when test="${page == 'user-management'}">
                    <jsp:include page="/components/user-management.jsp"></jsp:include>
                </c:when>

                <c:when test="${page == 'course-management'}">
                    <jsp:include page="/components/course-management.jsp"></jsp:include>
                </c:when>

                <c:when test="${page == 'grade-management'}">
                    <jsp:include page="/components/grade-management.jsp"></jsp:include>
                </c:when>

                <c:when test="${page == 'news-management'}">
                    <jsp:include page="/components/news-management.jsp"></jsp:include>
                </c:when>
                
                <c:when test="${page == 'profile-management'}">
                    <jsp:include page="/components/profile.jsp"></jsp:include>
                </c:when>

                <c:otherwise>
                    <p>You are not supposed to see this content.</p>
                </c:otherwise>
            </c:choose>
        </main>
      <jsp:include page="/components/popup.jsp"></jsp:include>
    </body>

    <script>
        const sidebarToggle = document.querySelector(".sidebar-toggle");
        const sidebarOverlay = document.querySelector(".sidebar-overlay");
        const sidebarMenu = document.querySelector(".sidebar-menu");
        const main = document.querySelector(".main");
        sidebarToggle.addEventListener("click", function (e) {
            e.preventDefault();
            main.classList.toggle("active");
            sidebarOverlay.classList.toggle("hidden");
            sidebarMenu.classList.toggle("-translate-x-full");
        });
        sidebarOverlay.addEventListener("click", function (e) {
            e.preventDefault();
            main.classList.add("active");
            sidebarOverlay.classList.add("hidden");
            sidebarMenu.classList.add("-translate-x-full");
        });
        document.querySelectorAll(".sidebar-dropdown-toggle").forEach(function (item) {
            item.addEventListener("click", function (e) {
                e.preventDefault();
                const parent = item.closest(".group");
                if (parent.classList.contains("selected")) {
                    parent.classList.remove("selected");
                } else {
                    document.querySelectorAll(".sidebar-dropdown-toggle").forEach(function (i) {
                        i.closest(".group").classList.remove("selected");
                    });
                    parent.classList.add("selected");
                }
            });
        });
    </script>
</html>
