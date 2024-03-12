<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Orders</title>
<link rel="stylesheet" href="CSS/Style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>

<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	String auth = (String) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao();
		orders = orderDao.userOrdersAdmin(Integer.parseInt(auth));
	}
		ArrayList<Product> cart_list = (ArrayList<Product>) session.getAttribute("cart-list");
		if (cart_list != null) {
			request.setAttribute("cart_list", cart_list);
		}
		
		%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); // Proxie
	%>
	<!-- Check Login -->
	<%
	String check = (String) session.getAttribute("Name");
	
	/* if (!check.equalsIgnoreCase("Admin"))
		response.sendRedirect("Login.jsp"); */
		if (check == null)
			response.sendRedirect("Login.jsp");
	%>

	<!-- Nav Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>

					<!--User Data  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="Admin_UserCheck.jsp">User Data</a></li>

					<!--Add Food  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="FoodAdd.jsp">Add Food</a></li>

					<!--List Food  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="Admin_ListOfFood.jsp">Listed Food</a></li>

					<!--Ordered Food  -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="Admin_orders.jsp">Ordered Food</a></li>

				</ul>

				<form action="Logout.jsp">

					<button class="btn btn-outline-success mx-2" type="submit">
						Logout
						<%=check%></button>

				</form>
			</div>
		</div>
	</nav>

		
<!-- Main Contain -->
<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
<!--End main contain  -->

</body>
</html>