<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="py-10 h-auto my-auto bg-gray-100"> <!-- Changed dark:bg-gray-900 to bg-gray-100 -->
    <div class="lg:w-[80%] md:w-[90%] xs:w-[96%] mx-auto flex gap-4">
        <div class="lg:w-[88%] md:w-[80%] sm:w-[88%] xs:w-full mx-auto shadow-2xl p-4 rounded-xl h-fit self-center bg-gray-200"> <!-- Removed dark:bg-gray-800/40 -->
            <div>
                <h1 class="lg:text-3xl md:text-2xl sm:text-xl xs:text-xl font-extrabold mb-2 text-black"> <!-- Removed dark:text-white -->
                    Profile
                </h1>
                <h2 class="text-gray-700 text-sm mb-5">Quản lý trang cá nhân</h2> <!-- Removed dark:text-gray-400 -->
                <form action="/StudentManagement/my-profile" method="post" accept-charset="UTF-8">
                    
                    <div class="w-full">
                            <label for="role" class="text-gray-600">ID người dùng</label> <!-- Removed dark:text-gray-300 -->
                            <input type="text" name="id" value="${user.userId}" readonly class="mt-2 p-4 w-full border-2 rounded-lg text-gray-500 border-gray-300 bg-white" placeholder="id"> 
                        </div>
                    
                    <div class="flex lg:flex-row md:flex-col sm:flex-col xs:flex-col gap-2 justify-center w-full">
                        <div class="w-full mb-4 mt-6">
                            <label for="name" class="mb-2 text-gray-600">Tên</label> <!-- Removed dark:text-gray-300 -->
                            <input value="${user.name}" name="name" type="text" class="mt-2 p-4 w-full border-2 rounded-lg text-gray-700 border-gray-300 bg-white" placeholder="Tên"> <!-- Removed dark:text-gray-200, dark:border-gray-600, dark:bg-gray-800 -->
                        </div>
                        <div class="w-full mb-4 lg:mt-6">
                            <label for="" class="text-gray-600">Email</label> <!-- Removed dark:text-gray-300 -->
                            <input value="${user.email}" type="text" readonly class="mt-2 p-4 w-full border-2 rounded-lg text-gray-500 border-gray-300 bg-white" placeholder="email"> <!-- Removed dark:text-gray-200, dark:border-gray-600, dark:bg-gray-800 -->
                        </div>
                    </div>

                      <div class="w-full">
                            <label for="role" class="text-gray-600">Vai trò</label> <!-- Removed dark:text-gray-300 -->
                            <input type="text" value="${user.role}" readonly class="mt-2 p-4 w-full border-2 rounded-lg text-gray-500 border-gray-300 bg-white" placeholder="vai trò"> 
                        </div>
                      <div class="flex mt-5 lg:flex-row md:flex-col sm:flex-col xs:flex-col gap-2 justify-center w-full">
                      <div class="w-full">
                            <label for="password" class="text-gray-600">Mật khẩu</label> <!-- Removed dark:text-gray-300 -->
                            <input name="password" type="password" value="${user.password}" class="mt-2 p-4 w-full border-2 rounded-lg text-gray-700 border-gray-300 bg-white" placeholder="*********"> <!-- Removed dark:text-gray-200, dark:border-gray-600, dark:bg-gray-800 -->
                        
                        </div>
                         <div class="flex lg:flex-row md:flex-col sm:flex-col xs:flex-col gap-2 justify-center w-full">
                        <div class="w-full">
                            <label for="repassword" class="text-gray-600">Xác nhận mật khẩu</label> <!-- Removed dark:text-gray-300 -->
                            <input type="password" name="repassword" value="${user.password}" class="mt-2 p-4 w-full border-2 rounded-lg text-gray-700 border-gray-300 bg-white" placeholder="*********">                        
                        </div>
                    </div>
                    </div>
                    <div class="w-full rounded-lg bg-blue-500 mt-4 text-white text-lg font-semibold">
                        <button type="submit" class="w-full p-4">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
