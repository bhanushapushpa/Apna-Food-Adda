<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Area</title>
<link rel="stylesheet" href="CSS/Style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
	
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>

<%
ArrayList<Product> cart= (ArrayList<Product>) session.getAttribute("cart_list");
int total = 0;
%>

<!--Nav Bar  -->
<%@include file="NavBar.jsp" %>

<!--Main Part  -->
	<div class="container">
		<div class="d-flex py-3">
		<%
		if(cart != null)
		{
			for(Product p: cart)
			{
				 total = (p.getPrice()*p.getQuantity())+total;
			}
			%>
			<h3>Total price  : ₹<%= total %></h3>
			<%
		}
		else{
			%>
			
			<h3>Cart is Empty.</h3>
			<%
		}
		%>
			
			<a class="btn btn-primary mx-3" href="cart-check-out">Check out</a>
			</div>
			<table class="table table-loght">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Buy now</th>
						<th scope="col">Cancel</th>
					</tr>
				</thead>
				<tbody>
				<% 
				if(cart != null){
				for(Product p: cart)
				{
					%>
					<tr>
					<td><%= p.getName() %></td>
					<td><%= p.getCategory() %></td>
					<td><%= p.getPrice()*p.getQuantity() %></td>
					<td>
						<form action="buy-now" method="post" class="form-inline">
							<input type="hidden" name="id" value=<%= p.getId() %> class="form-input">
							<div class="form-group d-flex justify-content-between ">
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=p.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control " value=<%=p.getQuantity()%> readonly>
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=p.getId()%>"><i
									class="fas fa-plus-square"></i></a>
									<button type="submit" class="btn btn-primary btn-sm">Buy</button>
							</div>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=p.getId()%>">Remove</a></td>
				</tr>
				
				<%
				}
				}
				%>
				
					
				</tbody>
			</table>

		</div>

	
</body>
</html>