<%@page import="md5.securityData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String name,password,type1=null,auth = null;
 String passCheck="";
securityData secure = new securityData();
boolean check=false;


name = request.getParameter("ename");
password = request.getParameter("epass");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");

PreparedStatement ps = con.prepareStatement("select * from login");

ResultSet rs = ps.executeQuery();

while(rs.next()){
	passCheck = secure.decrypt(rs.getString("password"))    ;
	if(rs.getString("name").equals(name) && passCheck.equals(password)){
		check=true;
		auth = rs.getString("id");
		break;
	}
}


%>

</body>
</html>