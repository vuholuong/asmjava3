<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="w-full max-w-3xl mx-auto p-8">
    <form action="${pageContext.request.contextPath}/admin/courses" method="post" class="bg-white p-8 rounded-lg shadow-md border border-gray-300">
    <h1 class="text-2xl font-bold text-gray-800 mb-4">Môn học</h1>

    <div class="mb-6">
        <input class="hidden" id="course-id-input" name="id" />

        <div>
            <label for="course-name-input" class="block text-gray-700 mb-1">Tên môn học</label> 
            <input type="text" id="course-name-input" required name="course-name" class="w-full rounded-lg border py-2 px-3" />
        </div>

        <div class="mt-4">
            <label for="lecturer-id-input" class="block text-gray-700 mb-1">Tên giảng viên</label>
            <input type="text" id="lecturer-id-input" readonly name="lecturer" value="${user.name}-ID:${user.userId}" name="lecturer-id" class="w-full rounded-lg border border-gray-200 text-gray-400 select-none py-2 px-3" />
        </div>
    </div>

    <div class="mt-8 flex justify-end">
        <button class="bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-700">Thêm/Cập Nhật</button>
    </div>
</form>

</div>
