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
        

        <title>Sinh Viên</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css" />
    </head>

    <body class="text-gray-800 font-inter">
        <main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-200 min-h-screen transition-all main">
            <jsp:include page="/components/student-sidebar.jsp"></jsp:include>
            <jsp:include page="/components/navbar.jsp"></jsp:include>
            <c:choose>
               
                <c:when test="${page == 'grade-view'}">
                    <jsp:include page="/components/grade-table.jsp"></jsp:include>
                </c:when>

                <c:when test="${page == 'news-view'}">
                    <jsp:include page="/components/news-list.jsp"></jsp:include>
                </c:when>
                
				<c:when test="${page == 'news-detail'}">
                    <jsp:include page="/components/news-detail.jsp"></jsp:include>
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
