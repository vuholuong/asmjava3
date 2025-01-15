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
							điểm</h3>
					</div>
					<div class="flex flex-col gap-2 shrink-0 sm:flex-row">
						<button
							class="flex select-none items-center gap-2 rounded bg-slate-800 py-2.5 px-4 text-xs font-semibold text-white shadow-md shadow-slate-900/10 transition-all hover:shadow-lg hover:shadow-slate-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
							type="button">
							<i class="bx bx-user-plus text-md"></i> Thêm điểm
						</button>
					</div>
				</div>
			</div>
			<div class="p-0 overflow-scroll">
				<jsp:include page="/components/grade-table.jsp"></jsp:include>
			</div>
			<div class="flex items-center justify-between p-3">
				<p class="block text-sm text-slate-500">Page 1 of 10</p>
				<button
					id="export-grade-to-excel-btn"
					class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
					type="button">Xuất Excel</button>
				<div class="flex gap-1">
					<button
						class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
						type="button">Previous</button>
					<button
						class="rounded border border-slate-300 py-2.5 px-3 text-center text-xs font-semibold text-slate-600 transition-all hover:opacity-75 focus:ring focus:ring-slate-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
						type="button">Next</button>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/components/grade-form.jsp"></jsp:include>

</div>

<script>
function setGradeData(button) {
    const gradeId = button.getAttribute('data-grade-id');
    const gradeStudent = button.getAttribute('data-grade-student');
    const gradeCourse = button.getAttribute('data-grade-course');
    const gradeValue = button.getAttribute('data-grade-value');

    document.getElementById('grade_id').value = gradeId;
    document.getElementById('student_name').value = gradeStudent;
    document.getElementById('course_name').value = gradeCourse;
    document.getElementById('grade_value').value = gradeValue;

    document.getElementById('student_name').focus(); 
}

function deleteGrade(id) {
		const modal = document.getElementById("modal-id");
		modal.classList.remove("hidden");
		
		const cancel = document.getElementById("cancel-delete-btn");
		const confirm = document.getElementById("confirm-delete-btn");
		
		cancel.onclick = (e) => {
			modal.classList.add("hidden");
		}
		
		confirm.onclick = (e) => {
			fetch("/StudentManagement/admin/grades?id="+id, {
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


const exportGradeToExcelBtn = document.getElementById("export-grade-to-excel-btn");
exportGradeToExcelBtn.onclick = (e) => exportToExcel("grade-table", "grade-table");
</script>
