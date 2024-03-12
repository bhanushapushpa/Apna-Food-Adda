
<%@page import="RegExp.Validate"%>
<%@page import="md5.securityData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="CommonJDBC.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	if(check) {
		response.sendRedirect("Login.jsp");
	} 
	else  {
		String checkCode,verifyOtp,checkPass;
		String sname, spass;
		sname = (String)session.getAttribute("pname1");
		checkPass =(String)session.getAttribute("pPassword1");
		
		verifyOtp =(String)session.getAttribute("code");

		checkCode = (String)(request.getParameter("otp1") + request.getParameter("otp2") + request.getParameter("otp3")
		+ request.getParameter("otp4") + request.getParameter("otp5") + request.getParameter("otp6"));

		if (verifyOtp.equals(checkCode)) {

			String semail;
			securityData sd = new securityData();
			
			spass = sd.encrypt(checkPass);
			semail = (String)session.getAttribute("pEmail1");

			String q = "insert into login(name,email,password) values('" + sname + "','" + semail + "','" + spass + "')";

			PreparedStatement ps1 = con.prepareStatement(q);

			int row = ps1.executeUpdate();
			if (row > 0) {
		session.setAttribute("Name", sname);
		response.sendRedirect("indexCustomer.jsp");
			} else {
		out.println("Sorry technical error");
			}
		}

		else {
			session.setAttribute("reg", "Wrong OTP");
			response.sendRedirect("OTP.jsp");
		}
		
	}
	%>

</body>
</html>