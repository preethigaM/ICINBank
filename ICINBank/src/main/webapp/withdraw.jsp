<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.connector.Connector"%>
<%@ page import = "java.sql.*"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>withdraw</title>
<style>
h1{
	margin-top: 50px;
	margin-left: 42%;
	color: rgb(46, 111, 125);
}
h2{
margin-left: 43%;
color: rgb(46, 111, 125);
}
[type=text], [type=password]{
	display: block;
	margin: 0 auto;
	width: 25%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}
select{
	display: block;
	margin: 20px auto;
	width: 25.5%;
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

</style>
</head>
<body>
<%String username = session.getAttribute("username").toString(); %>
	<h1>Withdraw Amount</h1>
	<%
		String msg = request.getParameter("msg");
		if("done".equals(msg))
		{
		%>
		<h2>Withdraw Successful!</h2>
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
		<h1>Withdraw Failed</h1>
		<%
		}
		%>
	<form action = "withdraw" method = "post">
		<input type="hidden" name="username" value="<%= username %>">
		<input type = "text" name="amount" placeholder="Enter Amount" required>
		<select name = "type">
			<option value="primary">Primary Account</option>
			<option value="savings">Savings Account</option>
		</select>
		<input type="text" name="accountNo" placeholder = "Enter Account Number" required>
		<input type= "submit" value="Withdraw">
	</form>
</body>
</html>