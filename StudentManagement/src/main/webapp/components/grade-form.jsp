<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="w-full max-w-3xl mx-auto p-8">
		<form action="${pageContext.request.contextPath}/admin/grades" method="post" class="bg-white p-8 rounded-lg shadow-md border border-gray-300">
    <h1 class="text-2xl font-bold text-gray-800 mb-4">Điểm</h1>

    <div class="mb-6">
    <input id="grade_id" name="id" type="text" value="" class="hidden">
        <div>
            <label for="student_name" class="block text-gray-700 mb-1">Mã sinh viên</label>
            <input type="text" id="student_name" required name="student-id" class="w-full rounded-lg border py-2 px-3">
        </div>

        <div class="mt-4">
            <label for="course_name" class="block text-gray-700 mb-1">Mã khoá học</label>
            <input type="text" id="course_name" required name="course-id" class="w-full rounded-lg border py-2 px-3">
        </div>

        <div class="mt-4">
            <label for="grade_value" class="block text-gray-700 mb-1">Điểm</label>
            <input type="number" min="0" max="10" step="0.1" id="grade_value" required name="grade" class="w-full rounded-lg border py-2 px-3">
        </div>
    </div>

    <div class="mt-8 flex justify-end">
        <button class="bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-700">Thêm/Cập Nhật</button>
    </div>
</form>

	</div>
