<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file= "adminHeader.jsp" %>
<%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
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
	a{
		text-decoration: none;
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
  
</style>
<html>
	<head>
		<title>cheque</title>	
	</head>
	<body>
		<h1 style = "margin: 30px 50px;">Cheque Book Requests</h1>
		<table id="table">
			<tr>
				<th>User Name</th>
				<th>Account</th>
				<th>Description</th>
				<th>Confirmed?</th>
				<th>Action</th>
			</tr>
			<%
				try{
					Connection con = Connector.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select username, accountType, description, status, id from request where status = 'Pending'");
					while(rs.next())
					{
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><a href = "confirm.jsp?msg= <%=rs.getString(5)%> ">Confirm</a></td>
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
	</body>
</html>