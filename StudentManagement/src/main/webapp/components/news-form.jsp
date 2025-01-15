<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w-5/6 xl:w-3/4 mx-auto p-4">
<h2 class="text-2xl font-bold mb-5">QUẢN LÝ TIN ĐĂNG</h2>
 <form action="/StudentManagement/admin/news" method="POST">
    <input type="text" name="id" readonly value="" class="hidden" id="news-form-id">
    <div class="mb-6">
        <label for="title" class="block text-lg font-medium text-gray-800 mb-1">Tiêu Đề</label>
        <input type="text" id="news-form-title" name="title" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500" required>
    </div>
    
    <div class="mb-6">
        <label for="description" class="block text-lg font-medium text-gray-800 mb-1">Tóm tắt nội dung</label>
        <input type="text" id="news-form-description" name="description" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500" required>
    </div>

    <div class="mb-6">
        <label for="content" class="block text-lg font-medium text-gray-800 mb-1">Nội dung</label>
        <textarea name="content" id="news-editor"></textarea>
    </div>

    <div class="flex justify-end">
        <button type="submit" class="px-6 py-2 bg-indigo-500 text-white font-semibold rounded-md hover:bg-indigo-600 focus:outline-none">Đăng/Cập nhật</button>
    </div>
</form>

</div>