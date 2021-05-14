<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
<%@ include file = "adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserAccount</title>
<style>
	#table{
		margin-left: 50px;
		border-collapse: collapse;
  		width: 93%;
	}
	input, select{
  		border: 0;
  		background-color: rgba(239, 240, 237,0.8);
  	}
	 #table td, #table th{
	 	
		border: 2px solid #ddd;
		padding: 8px;
	}
	#table td{
		background-color: rgba(239, 240, 237,0.8);
	}
	#table tr:hover {background-color: #ddd;
	border: 0;
	}
	#table th {
  	padding-top: 12px;
  	padding-bottom: 12px;
  	text-align: left;
  	background-color: white;
  	color: black;
  	}
  	.change{
  		backgrounf-color: blue;
  	}
</style>
</head>
<body>
	<h1 style = "margin: 30px 50px;">User Account Page</h1>
	<form action = "../editUser" method = "post">
	<table id="table">
		<tr>
			<th>User Name</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>PrimaryAccount</th>
			<th>Savings Account</th>
			<th>Enabled</th>
			<th>Action</th>
			<th>Update</th>
		</tr>
		<%
			try{
				Connection con = Connector.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select username, firstname, lastname, email, phone, primaryBalance, savingsBalance, enabled, action from icinbank.users");
				while(rs.next())
				{
		%>
				<tr>
					<td><%= rs.getString(1) %>
					<input type="hidden" name = "username" value= "<%= rs.getString(1) %>"></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><input style="color:blue;" type = "text" name = "primaryBalance" value="<%= rs.getString(6) %>"></td>
					<td><input style="color:blue;" type = "text" name = "savingsBalance" value="<%= rs.getString(7) %>"></td>
					<td style="color:blue;"><%= rs.getString(8) %></td>
					<td><select style="color:blue;" name = "action">
					<option value="Enable">Enable</option>
					<option value="Disable">Disable</option>
					</select>
					</td>
					<td><input type="submit" value = "Update"></td>
				</tr>
		
		<%
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>

		</table>
		</form>
</body>
</html>