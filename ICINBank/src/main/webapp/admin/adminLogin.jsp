<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="adminHeader.jsp" %>
<html>
	<head>
		<title>login</title>
		<style>
h1{
	color: rgb(46, 111, 125);
	margin: 30px auto 0px;
}

hr{
width: 35%;
}
[type=text], [type=password]{
	display: block;
	margin: 10px auto;
	width: 25%;
	height: 45px;
	font-size: 1em;
	text-align: center;
}

[type=submit] {
	margin: 20px auto 10px;
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
			
		</style>
	</head>
	
	<body>
	<div align="center">
		<h1>Please login</h1>
		<br> 
		<form action="../login" method = "post">
		<input type="text" name="username" placeholder="Username" required><br> 
		<input type="password" name="password" placeholder="Password" required><br> 
		<input type="checkbox" name="remember"> Remember Me<br> 
		<input type="submit" value="Sign in"><br>
		<hr>
		</form>
		
		<%
		String msg = request.getParameter("msg");
		if("false".equals(msg))
		{
		%>
		<h1>Incorrect Username or Password</h1>
		<%
		}
		%>
		<%
		if("invalid".equals(msg))
		{
		%>
		<h1>Something went wrong! Try Again!</h1>
		<%
		}
		%>
		</div>
	</body>
</html>