<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP</title>
  <link rel="stylesheet" type="text/css" href="Style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<section class="wrapper">
		<div class="container">
			<div class="col-sm-8 offset-sm-2 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3 text-center">
				
				<form class="rounded bg-white shadow p-5 mt-5" action="RegisterCheck.jsp">
					<h3 class="text-dark fw-bolder fs-4 mb-2">Two Step Verification</h3>

					<div class="fw-normal text-muted mb-4">
						Enter the verification code we sent to 
					</div>  
					<p style="color:red;"><% 
					String check=(String)session.getAttribute("code1");
					out.print(check+" "+session.getAttribute("reg"));
					
					%></p>
					
					
                   
					<div class="otp_input text-start mb-2">
                        <label for="digit">Type your 6 digit security code</label>
						<div class="d-flex align-items-center justify-content-between mt-2">
                            <input type="text" class="form-control" maxlength="1" name="otp1" placeholder="">
                            <input type="text" class="form-control" maxlength="1" name="otp2" placeholder="">
                            <input type="text" class="form-control" maxlength="1" name="otp3" placeholder="" >
                            <input type="text" class="form-control" maxlength="1" name="otp4" placeholder="">
                            <input type="text" class="form-control" maxlength="1" name="otp5" placeholder="">
                            <input type="text" class="form-control" maxlength="1" name="otp6" placeholder="">
                        </div> 
					</div>  

					<button type="submit" class="btn btn-primary submit_btn my-4">Submit</button> 

                    <div class="fw-normal text-muted mb-2">
						Didn’t get the code ? <a href="#" class="text-primary fw-bold text-decoration-none">Resend</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%
	String code1,name1,pass1,email1;
    
     //code1 = ;
     name1 = (String)session.getAttribute("pname");
     pass1 = (String)session.getAttribute("pPassword");
     email1 = (String)session.getAttribute("pEmail");
	 session.setAttribute("code", (String)session.getAttribute("code1"));
	 session.setAttribute("pname1", name1);
	 session.setAttribute("pPassword1", pass1);
	 session.setAttribute("pEmail1", email1);
	%>
	
</body>
</html>