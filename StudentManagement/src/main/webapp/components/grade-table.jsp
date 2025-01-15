<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
       <table id="grade-table" class="w-full mt-4 text-left table-auto min-w-max">
                <thead>
                    <tr>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Tên sinh viên <i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Tên môn học <i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">Điểm <i class="bx bx-sort text-md"></i></p>
                        </th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100"></th>
                        <th class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
                            <p class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500"></p>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="grade" items="${grades}">
                        <tr>
                            <td class="p-4 border-b border-slate-200">
                                <div class="flex items-center gap-3">
                                    <div class="flex flex-col">
                                        <p id="gradeStudent-${grade.gradeId}" class="text-sm font-semibold text-slate-700">${grade.student}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="p-4 border-b border-slate-200">
                                <div class="flex flex-col">
                                    <p id="gradeCourse-${grade.gradeId}" class="text-sm font-semibold text-slate-700">${grade.course}</p>
                                </div>
                            </td>
                            <td class="p-4 border-b border-slate-200">
                                <div class="w-max">
                                    <div class="relative grid items-center px-2 py-1 font-sans text-xs font-bold text-green-900 uppercase rounded-md select-none whitespace-nowrap bg-green-500/20">
                                        <span id="gradeValue-${grade.gradeId}" class="">${grade.gradeValue}</span>
                                    </div>
                                </div>
                            </td>

                            <td class="p-4 border-b border-slate-200">
                                <button
                                    id="editGradeButton-${grade.gradeId}"
                                    class="relative h-10 max-h-[40px] w-10 max-w-[40px] select-none rounded-lg text-center align-middle font-sans text-xs font-medium uppercase text-slate-900 transition-all hover:bg-slate-900/10 active:bg-slate-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                                    type="button"
                                    data-grade-id="${grade.gradeId}"
                                    data-grade-student="${grade.student}"
                                    data-grade-course="${grade.course}"
                                    data-grade-value="${grade.gradeValue}"
                                    onclick="setGradeData(this)"
                                >
                                    <i class="bx bx-edit text-xl"></i>
                                </button>
                            </td>

                            <td class="p-4 border-b border-slate-200">
                                <button
                                    onclick="deleteGrade(${grade.gradeId})"
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
       