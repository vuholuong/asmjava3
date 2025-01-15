<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  



	<table id="user-table" class="w-full mt-4 text-left table-auto min-w-max">
				<thead>
					<tr>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
							<p
								class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">
								Mã số <i class="bx bx-sort text-md"></i>
							</p>
						</th>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
							<p
								class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">
								Họ và tên <i class="bx bx-sort text-md"></i>
							</p>
						</th>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
							<p
								class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">
								Email <i class="bx bx-sort text-md"></i>
							</p>
						</th>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
							<p
								class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">
								Vai trò <i class="bx bx-sort text-md"></i>
							</p>
						</th>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
						</th>
						<th
							class="p-4 transition-colors cursor-pointer border-y border-slate-200 bg-slate-50 hover:bg-slate-100">
							<p
								class="flex items-center justify-between gap-2 font-sans text-sm font-normal leading-none text-slate-500">
							</p>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
						<tr>
							<td class="p-4 border-b border-slate-200">
								<div class="flex items-center gap-3">
									<div class="flex flex-col">
										<p id="userId-${user.userId}"
											class="text-sm font-semibold text-slate-700">${user.userId}</p>
									</div>
								</div>
							</td>
							<td class="p-4 border-b border-slate-200">
								<div class="flex items-center gap-3">
									<div class="flex flex-col">
										<p id="userName-${user.userId}"
											class="text-sm font-semibold text-slate-700">${user.name}</p>
									</div>
								</div>
							</td>
							<td class="p-4 border-b border-slate-200">
								<div class="flex flex-col">
									<p id="userEmail-${user.userId}"
										class="text-sm font-semibold text-slate-700">${user.email}</p>
								</div>
							</td>
							<td class="p-4 border-b border-slate-200">
								<div class="w-max">
									<div
										class="relative grid items-center px-2 py-1 font-sans text-xs font-bold text-green-900 uppercase rounded-md select-none whitespace-nowrap bg-green-500/20">
										<span id="userRole-${user.userId}" class="">${user.role}</span>
									</div>
								</div>
							</td>

							<td class="p-4 border-b border-slate-200">
								<button id="editButton-${user.userId}"
									class="relative h-10 max-h-[40px] w-10 max-w-[40px] select-none rounded-lg text-center align-middle font-sans text-xs font-medium uppercase text-slate-900 transition-all hover:bg-slate-900/10 active:bg-slate-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
									type="button" data-user-id="${user.userId}"
									data-user-name="${user.name}" data-user-email="${user.email}"
									data-user-role="${user.role}" onclick="setUserData(this)">
									<i class="bx bx-edit text-xl"></i>
								</button>
							</td>

							<td class="p-4 border-b border-slate-200">
								<button onclick="deleteUser(${user.userId})"
									class="relative h-10 max-h-[40px] w-10 max-w-[40px] select-none rounded-lg text-center align-middle font-sans text-xs font-medium uppercase text-slate-900 transition-all hover:bg-slate-900/10 active:bg-slate-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
									type="button">
									<i class="bx bx-trash text-xl"></i>
								</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		




<script>
      const searchBtn = document.getElementById("user-search-button");
      searchBtn.onclick = (e) => {
        const text = document.getElementById("user-search-box").value;
        if (text.trim().length == 0) {
          return;
        }
        

        fetch("/StudentManagement/admin/user-search?name="+encodeURIComponent(text), {
            method: 'GET'
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        }).
        then(htmlTable => {
        	document.getElementById("user-table").outerHTML = htmlTable;
        })
        .catch(error => {
            console.error('Error:', error); // Handle errors
        });
	
      }
      
  
    </script>
