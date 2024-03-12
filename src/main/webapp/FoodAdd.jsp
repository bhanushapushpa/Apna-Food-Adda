<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Area</title>
<link rel="stylesheet" href="CSS/Style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
.successCheck {
	color: green !important;
}

.not_successCheck {
	color: red !important;
}
</style>
</head>
<body>
	<!-- Check Login -->
	<%
	String check = (String) session.getAttribute("Name");
	String status = (String) session.getAttribute("Done");
	if (check == null)
		response.sendRedirect("Login.jsp");
	%>

	<!-- Nav Bar -->
	<nav class="navbar  navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Food Adda</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				
					<!--Home  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="index.jsp">Home</a></li>
						
					<!--User Data  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="Admin_UserCheck.jsp">User Data</a></li>
						
					<!--Add Food  -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="FoodAdd.jsp">Add Food</a></li>
						
					<!--List Food  -->
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="Admin_ListOfFood.jsp">Listed Food</a></li>
						
					<!--Ordered Food  -->
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="Admin_orders.jsp">Ordered Food</a></li>

				</ul>
				

				<form action="Logout.jsp">

					<button class="btn btn-outline-success mx-2" type="submit">
						Logout
						<%=check%></button>

				</form>
			</div>
		</div>
	</nav>

	<!-- End nav baar  -->



	<!-- Main content end  -->

	<div class="container img_style"
		style="background-image: url('image/foodAddForm1.jpg');">
		<div class="row">

			<div class="col-md-6 offset-md-5 mb-5 mt-5 p-4"
				style="background: white; border: solid 1px black;">



				<form action="FoodCheck" method="post" enctype="multipart/form-data">

					<!--Status check  -->
					<div
						class="container text-center fw-bolder fs-3 <%=status == "Updated Successfully" ? "successCheck" : "not_successCheck"%> ">
						<span><%=status == null ? "" : status%></span>
					</div>

					<h2 class="text-center ">Add Foods</h2>

					<!-- Name -->
					<div class="mb-3">
						<label for="nameFormControlInput1" class="form-label">
							Food Name </label> <input type="text" name="foodName"
							class="form-control" id="nameFormControlInput1">
					</div>

					<!-- Price -->
					<div class="mb-3">
						<label for="priceFormControlInput1" class="form-label">
							Price </label> <input type="text" name="foodPrice" class="form-control"
							id="priceFormControlInput1">
					</div>

					<!-- Category -->
					<div class="mb-3">
						<label for="categoryFormControlInput1" class="form-label">
							Category </label> <input type="text" name="foodCategory"
							class="form-control" id="categoryFormControlInput1">
					</div>

					<!-- Image -->
					<div class="mb-3">
						<label for="formFile" class="form-label"> Image </label> <input
							class="form-control" type="file" name="foodImage" id="formFile">
					</div>


					<!-- Description -->
					<div class="mb-3">
						<label for="foodFormControlTextarea1" class="form-label">Food
							Description</label>
						<textarea class="form-control" name="foodDesc"
							id="foodFormControlTextarea1" rows="3">
				</textarea>
					</div>

					<div class="d-grid gap-2 col-3 mx-auto">
						<button class="btn" style="background-color: #F47724;"
							type="submit">Button</button>
					</div>
				</form>
				.
			</div>
		</div>

	</div>

	<!-- Footer Start -->

	<div class="footer">
		<div class="flex-parent-element">
			<div class="flex-child-element magenta" style="border: none;">
				<h3>Keep Connected</h3>
				<br> <br> <img alt=""
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png"
					style="border-radius: 200px; width: 6%;"><br> <a
					href="#">Like Us On Facebook </a><br> <br> <img alt=""
					src="data:image/png;base64,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"
					style="border-radius: 200px; width: 6%;"><br> <a
					href="#"> Follow Us On Twitter</a><br> <br>
			</div>
			<div class="flex-child-element magenta" style="border: none;">
				<h3>Contact Information</h3>
				<br> <br> <b>Address :</b> Niva Building Nagar,Near Vidya
				Hospital,<br> Gaon,Ghatkopar(W) - 401045 <br> <br> <b>Mobile
					No : </b>1234567890 <br> <br> <b>Email Id : </b>Data06@gmail.com
			</div>
		</div>
	</div>


	<!-- Footer End -->



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>
</html>