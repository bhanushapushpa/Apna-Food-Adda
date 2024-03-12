<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="AdminConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nothing</title>
</head>
<body>
<% 
String Id= request.getParameter("id");
{

	try{
		String sql = "delete from addFood where id = '"+Id+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		int row = ps.executeUpdate();
		if(row > 0){
			response.sendRedirect("Admin_ListOfFood.jsp?delet=Deleted");
		}
		
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
	
}

%>
</body>
</html>