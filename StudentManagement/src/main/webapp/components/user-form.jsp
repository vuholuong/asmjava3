<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="w-full max-w-3xl mx-auto p-8">
		<form action="${pageContext.request.contextPath}/admin/users" method="post" class="bg-white p-8 rounded-lg shadow-md border border-gray-300">
    <h1 class="text-2xl font-bold text-gray-800 mb-4">Người dùng</h1>

    <div class="mb-6">
    <input id="user_id" name="id" readonly type="text" value="" class="hidden">
        <div>
            <label for="user_name" class="block text-gray-700 mb-1">Họ tên người dùng</label>
            <input type="text" id="user_name" required name="name" class="w-full rounded-lg border py-2 px-3">
        </div>

        <div class="mt-4">
            <label for="user_email" class="block text-gray-700 mb-1">Email</label>
            <input type="email" id="user_email" required name="email" class="w-full rounded-lg border py-2 px-3">
        </div>

        <div class="mt-4">
            <label for="user_password" class="block text-gray-700 mb-1">Mật khẩu</label>
            <input type="password" id="user_password" required name="password" class="w-full rounded-lg border py-2 px-3">
        </div>

        <div class="mt-4">
            <label for="user_role" class="block text-gray-700 mb-1">Vai trò</label>
            <select id="user_role" name="role" class="w-full rounded-lg border py-2 px-3">
                <option value="lecturer">Lecturer</option>
                <option value="student" selected>Student</option>
            </select>
        </div>
    </div>

    <div class="mt-8 flex justify-end">
        <button class="bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-700">Thêm/Cập Nhật</button>
    </div>
</form>

	</div>
