<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
.image-center {
	margin-right: 51px;
	margin-left: 140px;
}

#button {
	background-color: #d63384 !important;
	border: 0px;
}
</style>
</head>


<body style="background-image: url(image/bg.jpg); color: #fff;">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); // Proxie
	%>

	<section>
		<div class="container-fluid justify-content-center">
			<div class="row">
				<div class="col-md-6 col-lg-4"></div>
				<div class="col-md-6 col-lg-4">
					<form class="justify-content-center align-items-center"
					action="LoginCheck.jsp" method="post"
						style="margin-top: 20vh; border: 0px solid #fff; padding: 20px 30px; -webkit-box-shadow: -4px 2px 12px 1px rgba(255, 255, 255, 1); -moz-box-shadow: -4px 2px 12px 1px rgba(255, 255, 255, 1); box-shadow: -4px 2px 12px 1px rgba(255, 255, 255, 1);">

						<img src="image/food.jpg" class="image-center" height="80px"
							width="90px" style="border-radius: 50%; margin-top: -50px;">
						<h2 class="text-center">Login</h2>
						<p style="color:red;"><%=session.getAttribute("LoginCheck")==null?"": session.getAttribute("LoginCheck") %></p>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Name </label> <input type="text" name="ename" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="mb-4">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" name="epass" class="form-control"
								id="exampleInputPassword1">
						</div>

						<div class="mb-3 d-grid gap-2">
							<button class="btn btn-primary" id="button" type="submit">Login</button>
						</div>
						<label>Don't have an account?</label> <a href="Register.jsp"
							style="color: pink; text-decoration: none;">SignUp now</a>
					</form>
				</div>
			</div>
		</div>

	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>