<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="CommonJDBC.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN CHECKING</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxie
%>

<% 
	String sname, spass;
	sname = request.getParameter("ename");
	spass = request.getParameter("epass");
	if(sname.equals("Admin") && spass.equals("admin@321")){
		session.setAttribute("Name",name);
		response.sendRedirect("index.jsp");
	}
	else if(check){			
			session.setAttribute("Name",name);
			session.setAttribute("auth",auth);
			response.sendRedirect("indexCustomer.jsp");
			
		}
			
		else
		{
			session.setAttribute("LoginCheck","Wrong Username or Password");
			response.sendRedirect("Login.jsp");	
		}
		%>
</body>
</html>