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
					<h3 class="text-lg font-semibold text-slate-800">Danh sách người dùng</h3>
				</div>
				<div class="flex flex-col gap-2 shrink-0 sm:flex-row">
					<button
						class="flex select-none items-center gap-2 rounded bg-slate-800 py-2.5 px-4 text-xs font-semibold text-white shadow-md shadow-slate-900/10 transition-all hover:shadow-lg hover:shadow-slate-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
						type="button" onclick="newUser()">
						<i class="bx bx-user-plus text-md"></i> Thêm người dùng
					</button>
				</div>
			</div>
			<div class="relative max-w-sm mx-auto mt-3 mb-2">
				<input id="user-search-box"
					class="w-full py-2 px-4 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
					type="search" placeholder="Tìm kiếm">
				<button id="user-search-button"
					class="absolute inset-y-0 right-0 flex items-center px-4 text-gray-700 bg-gray-100 border border-gray-300 rounded-r-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
					<i class="bx bx-search text-xl"></i>
				</button>
			</div>
		</div>
		<div class="p-0 overflow-scroll">
		
		<jsp:include page="/components/user-table.jsp"></jsp:include>
		
		
		
		</div>
		<div class="flex items-center justify-between p-3">
			<p class="block text-sm text-slate-500">Page 1 of 10</p>
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

	<jsp:include page="/components/user-form.jsp"></jsp:include>
	
</div>

<script>
function setUserData(button) {
    const userId = button.getAttribute('data-user-id');
    const userName = button.getAttribute('data-user-name');
    const userEmail = button.getAttribute('data-user-email');
    const userRole = button.getAttribute('data-user-role');

	document.getElementById('user_id').value = userId;
    document.getElementById('user_name').value = userName;
    document.getElementById('user_email').value = userEmail;
    document.getElementById('user_email').disabled = true;
    document.getElementById('user_password').value="**********";
    document.getElementById('user_password').disabled = true;
    document.getElementById('user_role').value = userRole.trim().toLowerCase();

    document.getElementById('user_name').focus(); 
}

function newUser() {
	document.getElementById('user_id').value = "";
    document.getElementById('user_name').value = '';
    document.getElementById('user_email').value = '';
    document.getElementById('user_email').disabled = false;
    document.getElementById('user_password').value = ''
    document.getElementById('user_password').disabled = false;
    document.getElementById('user_role').value = 'student';
    
    document.getElementById('user_name').focus();
}


function deleteUser(userId) {
	const modal = document.getElementById("modal-id");
	modal.classList.remove("hidden");
	
	const cancel = document.getElementById("cancel-delete-btn");
	const confirm = document.getElementById("confirm-delete-btn");
	
	cancel.onclick = (e) => {
		modal.classList.add("hidden");
	}
	
	confirm.onclick = (e) => {
		fetch("/StudentManagement/admin/users?id="+userId, {
		    method: 'DELETE',
		    headers: {
		        'Content-Type': 'text/plain',
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

</script>
