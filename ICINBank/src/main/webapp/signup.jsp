<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>
	function showPassword()
	{
		var input = document.getElementById("password");
		if(input.type == "password")
		{
			input.type = "text";	
		}
		else
		{
			input.typ = "password";
		}
	}
</script>
<style>
	h1, label{
		color: rgb(46, 111, 125);
	}
	hr{
		width:45%;
	}
	[type=text], [type=password]{
		width: 20%;
		height:20px;
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

 button{
	background-color: rgb(79, 191, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div align="center">
		<h1>Sign Up</h1>
		<hr>
		<form action = "signup" method = "post">
			<label for="firstname">First Name</label><br>
			<input type = "text" name="firstname" required><br>
			<label for="lastname">Last Name</label><br>
			<input type="text" name="lastname" required><br>
			<label for="phone">Phone</label><br>
			<input type="text" name="phone" required><br>
			<label for="email">Your Email</label><br>
			<input type="text" name="email" required><br>
			<label for="username">Username</label><br>
			<input type="text" name="username" required><br>
			<label for="password">Password</label><br>
			<input type="password" id = "password" name="password" required><br>
			<input type="checkbox" name="show" onclick="showPassword()"> Show Password<br>
			<input type="submit" value = "Sign up!">
		</form>
		<%
		String msg = request.getParameter("msg");
		if("valid".equals(msg))
		{
		%>
		<h1>Successfully signed up</h1>
		<%}
		if("invalid".equals(msg))
		{
		%>
		<h1>Try again!</h1>
		<%} %>
		
		<a href = "/ICINBank/login.jsp"> <button type="button">Sign in</button></a>
	</div>
</body>
</html>