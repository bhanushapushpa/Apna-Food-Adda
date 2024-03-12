<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String check1 = (String) session.getAttribute("Name");

	if (check1 == null)
		response.sendRedirect("Login.jsp");
	%>


	<!-- Nav Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Food Adda</a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="indexCustomer.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span
							class="badge bg-success">${ cart_list.size() } </span></a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="orders.jsp">Order</a></li>
				</ul>

				<form action="Logout.jsp">

					<button class="btn btn-outline-success mx-2" type="submit">
						Logout
						<%=check1%></button>

				</form>
			</div>
		</div>
	</nav>

</body>
</html>