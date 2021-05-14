<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String username = request.getParameter("msg");
	try{
		Connection con = Connector.getCon();
		Statement st = con.createStatement();
		System.out.println(username);
		st.executeUpdate("update request set status = 'Confirmed' where id = '"+username+"'");
		response.sendRedirect("cheque.jsp?done");
	}
	catch(Exception e)
	{
		response.sendRedirect("cheque.jsp?error");
		System.out.println(e);
	}
	%>
</body>
</html>