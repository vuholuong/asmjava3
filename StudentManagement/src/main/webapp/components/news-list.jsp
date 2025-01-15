<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="max-w-4xl mx-auto w-5/6 px-4 sm:px-6 lg:px-8 my-4 py-6 rounded-lg overflow-hidden">
    <div class="overflow-y-auto">
        <c:forEach var="news" items="${newsList}">
            <div class="my-4 py-6 px-4 bg-white rounded-lg shadow-md">
                <div class="flex justify-between items-center">
                    <span class="font-light text-gray-600 italic">Ngày đăng: ${news.createdAtString}</span>
                </div>
                <div class="mt-2">
                    <a class="text-2xl text-gray-700 font-bold hover:text-gray-600" href="/StudentManagement/news/${news.id}">${news.title}</a>
                    <p class="mt-2 text-gray-600">${news.description}</p>
                </div>
                <div class="flex justify-between items-center mt-4">
                    <a class="text-blue-600 hover:underline" href="/StudentManagement/news/${news.id}">Xem thêm</a>
                    <div class="flex items-center">
                        <h1 class="text-gray-700 font-bold">${news.authorString}</h1>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
