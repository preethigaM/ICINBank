<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<html>
	<head>
		<title>create</title>
	</head>
	<style>
		h1{
		margin: 100px 0px 40px 200px;
		color: rgb(46, 111, 125);
	}
	form{
		margin: 0px 0px 40px 200px;
		color: rgb(46, 111, 125);
	}
	label{
		font-size: 1.5rem;
		margin-bottom: 10px;
	}
	select, option{
		margin: 10px 0px 20px;
		width: 460px;
		height: 40px;
	}
	textarea{
		padding: 10px;
		margin: 10px 0 20px;
	}
	[type=submit] {
	background-color: rgb(79, 141, 201);
	color: white;
	padding: 9px 25px;
	border-radius: 4px;
	cursor: pointer;
}
	</style>
	<body>
	<%String username = session.getAttribute("username").toString(); 
	%>
		<h1>Request New Cheque Book</h1>
		<form action = "request" method="post">
			<input type="hidden" name="username"value= "<%= username %>">
			<label for="accountType">Pick an account:</label><br>
			<select name = "accountType">
				<option value="primary"> Primary </option>
				<option value="savings"> Savings </option>
			</select>
			<br>
			<label for="description">Description</label><br>
			<textarea name="description" rows="5" cols="60"></textarea><br>
			
			<%
			request.setAttribute("username", username);%>
			<input type="submit" value="Submit Request">
		</form>
		
	</body>
</html>