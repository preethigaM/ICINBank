<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
<%@ include file = "header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
h1{
	margin-top: 100px;
	margin-left: 43%;
	color: rgb(46, 111, 125);
}
h2{
margin-top:0px;
margin-left: 44%;
color: rgb(46, 111, 125);
}
hr{
width: 35%;
}
[type=text], [type=password]{
	display: block;
	margin: 20px auto 0px;
	width: 25%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}

[type=submit] {
	margin: 20px;
	margin-left: 47%;
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
select{
	display: block;
	margin: 20px auto;
	width: 25.5%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}
</style>
</head>
<body>
	<h1>Transfer Amount</h1>
		<br> 
		<%
		String msg = request.getParameter("msg");
		if("done".equals(msg))
		{
		%>
		<h2>Transaction Successful!</h2>
		<%
		}
		if("insufficient".equals(msg))
		{
		%>
		<h2>Insufficient Balance!</h2>
		<%
		}
		if("error".equals(msg))
		{
		%>
		<h1>Transaction Failed</h1>
		<%
		}
		%>
		<%String username = session.getAttribute("username").toString();%>
		<form class = "form" action="transfer" method = "post">
		<input type="text" name = "username" value = "<%=username%>">
		<select name = "from">
		<option selected disabled>Select From Account</option>
		
		<%
		try{
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select primaryNum, savingsNum from users where username = '"+username+"'");
			while(rs.next())
			{
		%>
			<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
			<option value="<%= rs.getString(2)%>"><%= rs.getString(2)%></option>
		<%
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>
		</select>
		<select name = "to">
		<option selected disabled>Select To Account</option>
			<%
		try{
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select accNum from payee where username = '"+username+"'");
			while(rs.next())
			{
		%>
			<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
		<%
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>
		</select>
		<input type="text" name = "amount" placeholder="Amount">
		<input type="password" name="password" placeholder="Password" required><br> 
		<input type="submit" value="Transfer"><br>
		<hr>
		</form>
		<%
			
		%>
</body>
</html>