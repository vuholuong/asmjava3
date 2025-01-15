<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="max-w-[720px] mx-auto">  
    <div class="block mb-4 mx-auto pb-2 max-w-[360px]"></div>

    <div class="relative flex flex-col w-full h-full text-slate-700 bg-white shadow-md rounded-xl bg-clip-border">
        <div class="relative mx-4 mt-4 overflow-hidden text-slate-700 bg-white rounded-none bg-clip-border">
            <div class="flex items-center justify-between">
                <div>
                    <h3 class="text-lg font-semibold text-slate-800">Danh sách tin tức</h3>
                </div>
                <div class="flex flex-col gap-2 shrink-0 sm:flex-row">
                    <button
                        onclick="newNews()"
                        class="flex select-none items-center gap-2 rounded bg-slate-800 py-2.5 px-4 text-xs font-semibold text-white shadow-md shadow-slate-900/10 transition-all hover:shadow-lg hover:shadow-slate-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                        type="button"
                    >
                        <i class="bx bx-user-plus text-md"></i>
                        Thêm tin mới
                    </button>
                </div>
            </div>
        </div>
        <div class="p-0 overflow-scroll">
            <table class="w-full mt-4 text-left table-auto min-w-max">
                <thead>
                    <tr>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Mã tin tức<i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Tiêu đề<i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Mô tả<i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Người đăng<i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100"></th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500"></p>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${newsList}">
                        <tr>
                            <td class="p-4 border-b border-slate-200">
                                <div class="flex items-center gap-3">
                                    <div class="flex flex-col">
                                        <p class="text-sm font-semibold text-slate-700">${news.id}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="p-4 border-b border-slate-200">
                                <div class="flex flex-col">
                                    <p class="text-sm font-semibold text-slate-700">${news.title}</p>
                                </div>
                            </td>
                            <td class="p-4 border-b border-slate-200">
                                <div class="w-[300px]">
                                    <div class="relative grid items-center px-2 py-1 text-xs font-bold rounded-md select-none whitespace-nowrap">
                                        <span class="overflow-hidden">${news.description}</span>
                                    </div>
                                </div>
                            </td>
                            <td class="p-4 border-b border-slate-200">
                                <div class="flex flex-col">
                                    <p class="text-sm font-semibold text-slate-700">${news.authorString}</p>
                                </div>
                            </td>

                            <td class="p-4 border-b border-slate-200">
                                <button
                                    class="relative h-10 max-h-[40px] w-10 max-w-[40px] select-none rounded-lg text-center align-middle font-sans text-xs font-medium uppercase text-slate-900 transition-all hover:bg-slate-900/10 active:bg-slate-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                                    type="button"
                                    onclick="setNewsData(${news.id})"
                                >
                                    <i class="bx bx-edit text-xl"></i>
                                </button>
                            </td>

                            <td class="p-4 border-b border-slate-200">
                                <button
                                    onclick="deleteNews(${news.id})"
                                    class="relative h-10 max-h-[40px] w-10 max-w-[40px] select-none rounded-lg text-center align-middle font-sans text-xs font-medium uppercase text-slate-900 transition-all hover:bg-slate-900/10 active:bg-slate-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                                    type="button"
                                >
                                    <i class="bx bx-trash text-xl"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="flex items-center justify-between p-3">
            <p class="block text-sm text-slate-500">Page 1 of 10</p>
            <div class="flex gap-1">
                <button
                    class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                    type="button"
                >
                    Trước
                </button>
                <button
                    class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                    type="button"
                >
                    Sau
                </button>
            </div>
        </div>
    </div>
</div>
