<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div
    class="hidden min-w-screen h-screen animated fadeIn faster fixed left-0 top-0 flex justify-center items-center inset-0 z-50 outline-none focus:outline-none bg-no-repeat bg-center bg-cover"
    id="modal-id"
>
    <div class="absolute bg-black opacity-80 inset-0 z-0"></div>
    <div class="w-full max-w-lg p-5 relative mx-auto my-auto rounded-xl shadow-lg bg-white">
        <div class="">
            <div class="text-center p-5 flex-auto justify-center">
               <i class="bx bx-trash text-6xl text-red-500"></i>
               
                <h2 class="text-xl font-bold py-4">Bạn có chắc muốn xoá?</h2>
                <p class="text-sm text-gray-500 px-8">Bạn thật sự muốn xoá dữ liệu này? Hành động này sẽ không thể hoàn tác.</p>
            </div>
            <div class="p-3 mt-2 text-center space-x-4 md:block">
                <button id="cancel-delete-btn" class="mb-2 md:mb-0 bg-white px-5 py-2 text-sm shadow-sm font-medium tracking-wider border text-gray-600 rounded-full hover:shadow-lg hover:bg-gray-100">
                    Huỷ
                </button>
                <button id="confirm-delete-btn" class="mb-2 md:mb-0 bg-red-500 border border-red-500 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white rounded-full hover:shadow-lg hover:bg-red-600">Xoá</button>
            </div>
        </div>
    </div>
</div>
