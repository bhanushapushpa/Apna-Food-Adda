<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="AdminConnection.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Food</title>
<link rel="stylesheet" href="CSS/Style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

<% 
String Id= request.getParameter("id");
try{
		String sql = "select * from addFood where id = '"+Id+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
		%>
	<!-- Main content start  -->

	<div class="container img_style"
		style="background-image: url('image/foodAddForm1.jpg');">
		<div class="row">

			<div class="col-md-6 offset-md-5 mb-5 mt-5 p-4"
				style="background: white; border: solid 1px black;">

				

				<form action="UpdateFood?id=<%= Id %>" method="post" enctype="multipart/form-data">

					<h2 class="text-center ">Edit Food</h2>

					<!-- Name -->
					<div class="mb-3">
						<label for="nameFormControlInput1" class="form-label">
							Food Name </label> <input type="text" name="foodName" value="<%=rs.getString("fname")%>"
							class="form-control" id="nameFormControlInput1">
					</div>

					<!-- Price -->
					<div class="mb-3">
						<label for="priceFormControlInput1" class="form-label">
							Price </label> <input type="text" name="foodPrice" value="<%=rs.getString("fprice")%>"
							class="form-control"
							id="priceFormControlInput1">
					</div>

					<!-- Category -->
					<div class="mb-3">
						<label for="categoryFormControlInput1" class="form-label">
							Category </label> <input type="text" name="foodCategory" value="<%=rs.getString("fcategory")%>"
							class="form-control" id="categoryFormControlInput1">
					</div>

					<!-- Image -->
					<div class="mb-3">
						<label for="formFile" class="form-label"> Image </label> <input 
							class="form-control" type="file" name="foodImage"  value="<%=rs.getString("fimg")%>" id="formFile"> 
					</div>


					<!-- Description -->
					<div class="mb-3">
						<label for="foodFormControlTextarea1" class="form-label">Food
							Description</label>
						<textarea class="form-control"  name="foodDesc"
							id="foodFormControlTextarea1" rows="3"><%=rs.getString("fdescription")%>
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
	<% 
	}
}
	catch(Exception e)
	{
		System.out.print(e);
	}%>
	<!-- Main content End  -->


</body>
</html>