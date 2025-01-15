<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
	<!-- This is an example component -->
	<div class="font-sans">
		<div
			class="relative min-h-screen flex flex-col sm:justify-center items-center bg-gray-300 ">
			<div class="relative sm:max-w-sm w-full">
				<div
					class="card bg-blue-400 shadow-lg  w-full h-full rounded-3xl absolute  transform -rotate-6"></div>
				<div
					class="card bg-red-400 shadow-lg  w-full h-full rounded-3xl absolute  transform rotate-6"></div>
				<div
					class="relative w-full rounded-3xl  px-6 py-4 bg-gray-200 shadow-md">
					<label for=""
						class="block mt-3 text-xl text-gray-700 text-center font-semibold">
						Đăng nhập </label>

					<form method="post" action="login" class="mt-10">

						<div>
							<input type="email" name="email" placeholder="Tên đăng nhập"
								required onFocus="handleFocus()"
								class="mt-1 p-2 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>

						<div class="mt-7">
							<input type="password" name="password" placeholder="Mật khẩu"
								required onFocus="handleFocus()"
								class="mt-1 p-2 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>

						<c:if test="${message != null}">
							<p id="errorMsg" class="text-red-400 font-bold text-center mt-3">${message}</p>
						</c:if>



						<div class="mt-7 flex">
							<label for="remember_me"
								class="inline-flex items-center w-full cursor-pointer">
								<input id="remember_me" type="checkbox"
								class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
								name="remember"> <span
								class="ml-2 text-sm text-gray-600"> Ghi nhớ </span>
							</label>

							<div class="w-full text-right">
								<a class="underline text-sm text-gray-600 hover:text-gray-900"
									href="#">Quên mật khẩu </a>
							</div>
						</div>

						<div class="mt-7">
							<button
								class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out  transform hover:-translate-x hover:scale-105">
								Đăng nhập</button>
						</div>
					</form>
					<div class="flex items-center my-5 justify-center">
						<a href="${pageContext.request.contextPath}/google-login"
							class="px-4 py-2 border flex gap-2 border-slate-200 dark:border-slate-700 rounded-lg text-slate-700 hover:border-slate-400hover:text-slate-900 hover:shadow transition duration-150">
							<img class="w-6 h-6"
							src="https://www.svgrepo.com/show/475656/google-color.svg"
							loading="lazy" alt="google logo"> <span>Đăng nhập
								với Google</span>
						</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script type="text/javascript">
	function handleFocus() {
		let e = document.getElementById("errorMsg");
		if (e != null) {
			e.style.display = "none";
		}
	}
</script>
</html>