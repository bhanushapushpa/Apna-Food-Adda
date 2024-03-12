<%@page import="RegExp.Validate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="mail.EmailSender"%>
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sname, spass,rpass,validateReg;

	sname = request.getParameter("ename");
	spass = request.getParameter("epass");
	rpass = request.getParameter("rpass");
	String userEmail = request.getParameter("eEmail"); // Replace with the user's email
	validateReg = Validate.emailRegex(sname,userEmail,spass,rpass);
	Random rs = new Random();
	String verificationCode = String.format("%06d", rs.nextInt(999999)); // Generate a unique code for each user
	
	if(validateReg=="Valid"){

	try {
		EmailSender.sendVerificationEmail(userEmail, verificationCode);
		session.setAttribute("code1", verificationCode);
		session.setAttribute("pname", sname);
		session.setAttribute("pPassword", spass);
		session.setAttribute("pEmail", userEmail);		
		response.sendRedirect("OTP.jsp");		
		//out.println("Verification email sent successfully.");
		//session.setParameter("Success","Verification email sent successfully.");
		
	} catch (MessagingException e) {
		out.println("Error sending verification email: " + e.getMessage());
		// response.sendRedirect("index.jsp");
	}
	}
	else{
		session.setAttribute("validName", validateReg);		
		response.sendRedirect("Register.jsp");
	}
	%>

</body>
</html>