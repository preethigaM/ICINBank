<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
<%@ include file = "header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>savingsBalance</title>
<style>
#table{
		margin-left: 50px;
		border-collapse: collapse;
  		width: 93%;
	}
#table td, #table th{
	 	
		border: 2px solid #ddd;
		padding: 8px;
	}
	#table td{
		background-color: rgba(239, 240, 237,0.8);
		text-align: center;s
	}
	#table tr:hover {background-color: #ddd;
	border: 0;
	}
	#table th {
  	padding-top: 12px;
  	padding-bottom: 12px;
  	text-align: center;
  	background-color: white;
  	color: black;
  	}
  	#change1{
  		color: red;
  	}
  	#change2{
  		color: green;
  	}
</style>
</head>
<body>
	<h1>Savings Balance Details</h1>
	<table id="table">
		<tr>
			<th>Date</th>
			<th>Account Number</th>
			<th>Debit</th>
			<th>Credit</th>
			<th>Balance</th>
		</tr>
		<%
		try{
			String username = session.getAttribute("username").toString();
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select date, payeeAccNo, debit, credit, balance from transaction where username = '"+username+"'"+" and accountType = 'Savings'");
			while(rs.next())
			{
		%>
		<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td id="change1"><%= rs.getString(3) %></td>
					<td id="change2"><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
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