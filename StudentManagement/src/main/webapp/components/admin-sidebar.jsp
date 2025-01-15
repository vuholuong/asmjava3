<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="fixed left-0 top-0 w-64 h-full bg-[#f8f4f3] p-4 z-50 sidebar-menu transition-transform">
            <a href="#" class="flex items-center pb-4 border-b border-b-gray-800">
                <h2 class="font-bold text-2xl">GIẢNG <span class="bg-[#f84525] text-white px-2 rounded-md">VIÊN</span></h2>
            </a>
            <ul class="mt-4">
                <span class="text-gray-400 font-bold">QUẢN LÝ</span>

                <li class="mb-1 group">
                    <a
                        href="${pageContext.request.contextPath}/admin/courses"
                        class="flex font-semibold items-center py-2 px-4 text-gray-900 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100"
                    >
                        <i class="ri-home-2-line mr-3 text-lg"></i> <span class="text-sm">Môn học</span>
                    </a>
                </li>

                <li class="mb-1 group">
                    <a
                        href="${pageContext.request.contextPath}/admin/grades"
                        class="flex font-semibold items-center py-2 px-4 text-gray-900 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100"
                    >
                        <i class="bx bx-list-ul mr-3 text-lg"></i> <span class="text-sm">Điểm</span>
                    </a>
                </li>

                <li class="mb-1 group">
                    <a
                        href="${pageContext.request.contextPath}/admin/users"
                        class="flex font-semibold items-center py-2 px-4 text-gray-900 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100"
                    >
                        <i class="bx bx-user mr-3 text-lg"></i> <span class="text-sm">Sinh Viên</span>
                    </a>
                </li>

                <li class="mb-1 group">
                    <a
                        href="${pageContext.request.contextPath}/admin/news"
                        class="flex font-semibold items-center py-2 px-4 text-gray-900 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100"
                    >
                        <i class="bx bx-envelope mr-3 text-lg"></i> <span class="text-sm">Tin tức</span>
                    </a>
                </li>

                <span class="text-gray-400 font-bold">CÁ NHÂN</span>
                <li class="mb-1 group">
                    <a
                        href="${pageContext.request.contextPath}/my-profile"
                        class="flex font-semibold items-center py-2 px-4 text-gray-900 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100"
                    >
                        <i class="bx bx-cog mr-3 text-lg"></i> <span class="text-sm">Profile</span>
                    </a>
                </li>
            </ul>
            <form action="/StudentManagement/logout" method="get">
                <button type="submit"
					id="logout-button"
					class="rounded mt-20 border border-slate-300 p-3 text-center mx-auto font-bold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
					type="button">Đăng xuất</button></form>
        </div>
    
        <div class="fixed top-0 left-0 w-full h-full bg-black/50 z-40 md:hidden sidebar-overlay"></div>
