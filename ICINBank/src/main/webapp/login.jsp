<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c: set var="contextPath" value="${pageContext.request.contextPath}"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
h1{
	margin-top: 100px;
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
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}

 button{
	margin: 20px 5px;
	background-color: rgb(79, 191, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="main" align=center>
		<h1>Please sign in</h1>
		<br> 
		<form class = "form" action="login" method = "post">
		<input type="text" name="username" placeholder="Username" required><br> 
		<input type="password" name="password" placeholder="Password" required><br> 
		<input type="checkbox" name="remember"> Remember Me<br> 
		<input type="submit" value="Sign in"><br>
		<hr>
		<a href = "/ICINBank/signup.jsp"> <button type="button">Sign up</button></a>
		<a class = "admin" href = "/ICINBank/admin/adminLogin.jsp"> <button type="button">AdminSign in</button></a>
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