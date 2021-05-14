<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connector.Connector" %>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	h1{
		margin: 20px 150px;
		color: rgb(46, 111, 125);
	}
	hr{
		margin: 20px 150px;
		width: 30%;
	}
	form {
		margin: 10px 150px;
		color: rgb(46, 111, 125);
		width:40%;
	}
	[type=text], [type=password]{
		padding: 5px;
		margin-bottom: 15px;
	}
	[type=submit] {
	margin: 20px;
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
	#main{
		float: right;
		width: 80%;
	}
	table{
		margin: 20px 150px; 
	}
	th{
		padding-top: 10px;
    	background-color: rgba(46, 111, 125, 0.7);
		padding: 16px;
  		text-align: center;
  		border-radius: 4px;
	}
	td{
		padding: 10px;
		text-align: center;
	}
</style>
<title>profile</title>
</head>
<body>
<div class="main">
	<h1>My Profile</h1>
	<hr align=left>
	<%
		try{
			String username = session.getAttribute("username").toString();
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select * from icinbank.users where username = '"+username+"'");
			while(rs.next())
			{
	%>
	
	<form action = "editProfile" method = "post">
	
		<label for="firstName">First Name</label><br>
		<input type="text" name = "firstname" value = <%= rs.getString(2) %>><br>
		
		<label for="lastName">Last Name</label><br>
		<input type = "text" name="lastname" value=<%= rs.getString(3) %>><br>
		
		<label for="phone">Phone</label><br>
		<input type="text" name="phone" value=<%= rs.getString(4) %>><br>
		
		<label for="mail">Your Email</label><br>
		<input type="text" name = "email" value=<%= rs.getString(5) %>><br>
		
		<label for=username>Username</label><br>
		<input type="text" name = "username" value=<%= rs.getString(6) %>><br>
		
		<input type="submit" value = "Update Profile">
	</form>
	</div>
	<div style="margin-left:40%;padding:1px 16px;margin-top: -450px">
	<h1>Your Account Information</h1>
	<hr align = "left" style="width: 55%">
	<table>
		<tr>
			<th>Primary Account Number</th>
			<th>Savings Account Number</th>
		</tr>
		<tr>
			<td><%= rs.getString(8) %></td>
			<td><%= rs.getString(9) %></td>
		</tr>
	</table>
	</div>
	<%
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
</body>
</html>