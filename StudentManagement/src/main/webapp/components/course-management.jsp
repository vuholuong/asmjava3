<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="bg-gray-100">

	<div class="max-w-[720px] mx-auto">
		<div class="block mb-4 mx-auto pb-2 max-w-[360px]"></div>

		<div
			class="relative flex flex-col w-full h-full text-slate-700 bg-white shadow-md rounded-xl bg-clip-border">
			<div
				class="relative mx-4 mt-4 overflow-hidden text-slate-700 bg-white rounded-none bg-clip-border">
				<div class="flex items-center justify-between">
					<div>
						<h3 class="text-lg font-semibold text-slate-800">Danh sách
							môn học</h3>
					</div>
					<div class="flex flex-col gap-2 shrink-0 sm:flex-row">
						<button onclick="newCourse(${null})"
							class="flex select-none items-center gap-2 rounded bg-slate-800 py-2.5 px-4 text-xs font-semibold text-white shadow-md shadow-slate-900/10 transition-all hover:shadow-lg hover:shadow-slate-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
							type="button">
							<i class="bx bx-user-plus text-md"></i> Thêm môn học
						</button>
					</div>
				</div>
				<div class="relative max-w-sm mx-auto mt-3 mb-2">
					<input id="course-search-box"
						class="w-full py-2 px-4 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
						type="search" placeholder="Tìm kiếm">
					<button id="course-search-button"
						class="absolute inset-y-0 right-0 flex items-center px-4 text-gray-700 bg-gray-100 border border-gray-300 rounded-r-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
						<i class="bx bx-search text-xl"></i>
					</button>
				</div>
			</div>
			<div class="p-0 overflow-scroll">
				<jsp:include page="/components/course-table.jsp"></jsp:include>
			</div>
			<div class="flex items-center justify-between p-3">
				<p class="block text-sm text-slate-500">Page 1 of 10</p>
				<button
					id="export-course-to-excel-btn"
					class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
					type="button">Xuất Excel</button>
				<div class="flex gap-1">
					<button
						class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
						type="button">Trước</button>
					<button
						class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
						type="button">Sau</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/components/course-form.jsp"></jsp:include>

</div>

<script type="text/javascript">
function setCourseData(button) {
    const courseId = button.getAttribute('data-course-id');
    const courseName = button.getAttribute('data-course-name');
    const lecturerId = button.getAttribute('data-lecturer-id');

    document.getElementById('course-id-input').value = courseId;
    document.getElementById('course-name-input').value = courseName;
    document.getElementById('lecturer-id-input').value = lecturerId;

    document.getElementById('course-name-input').focus(); 
}

function newCourse() {
	  document.getElementById('course-id-input').value = "";
	    document.getElementById('course-name-input').value = "";
	    document.getElementById('lecturer-id-input').value = "${user.name}-ID:${user.userId}";
	    document.getElementById('course-name-input').focus();
}

function deleteCourse(courseId) {
	const modal = document.getElementById("modal-id");
	modal.classList.remove("hidden");
	
	const cancel = document.getElementById("cancel-delete-btn");
	const confirm = document.getElementById("confirm-delete-btn");
	
	cancel.onclick = (e) => {
		modal.classList.add("hidden");
	}
	
	confirm.onclick = (e) => {
		fetch("/StudentManagement/admin/courses?id="+courseId, {
		    method: 'DELETE',
		    headers: {
		        'Content-Type': 'text/plain',  // Set content type to plain text
		    },
		})
		.then(response => {
		    if (!response.ok) {
		        throw new Error('Failed to delete the resource');
		    } else {
		    	location.reload();
		    }
		})
		.catch(error => {
		    console.error('Error:', error);
		});
		
	}
	
}
const exportCourseToExcelBtn = document.getElementById("export-course-to-excel-btn");
console.log(exportCourseToExcelBtn);
exportCourseToExcelBtn.onclick = (e) => exportToExcel("course-table", "course-table");





</script>
