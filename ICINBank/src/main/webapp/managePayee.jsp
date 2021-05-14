<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>managePayee</title>
<style>
h1{
	margin-top: 50px;
	margin-left: 45%;
	color: rgb(46, 111, 125);
}
h2{
margin-left: 40%;
color: rgb(46, 111, 125);
}
hr{
width: 35%;
}
[type=text], [type=password]{
	display: block;
	margin: 0 auto;
	width: 25%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}

[type=submit] {
	margin: 20px;
	margin-left: 47.5%;
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
select{
	display: block;
	margin: auto;
	margin-bottom: 20px;
	width: 25.5%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}
</style>
</head>
<body>
	<h1>Add Payee</h1>
	<%
	String username = session.getAttribute("username").toString();
	%>
	<%
		String msg = request.getParameter("msg");
		if("valid".equals(msg))
		{
		%>
		<h2>Payee Updated Successfully!</h2>
		<%
		}
		%>
		<%
		if("invalid".equals(msg))
		{
		%>
		<h1>Enter valid details</h1>
		<%
		}
		%>
		<br> 
		<form class = "form" action="managePayee" method = "post">
		<input type="hidden" name="username" value = "<%= username %>"><br> 
		<input type="text" name="accNum" placeholder="Account Number"><br>
		<input type="text" name="accNum1" placeholder="Re-Enter Account Number"><br>
		<select name = "type">
				<option value="primary"> Primary Account </option>
				<option value="savings"> Savings Account </option>
		</select>
		<input type="text" name="name" placeholder="Payee Name"><br>
		<input type="text" name="ifsc" placeholder="IFSC"><br>
		<input type="password" name="password" placeholder="Password" required><br> 
		<input type="submit" value="Add"><br>
		<hr>
		</form>
</body>
</html>