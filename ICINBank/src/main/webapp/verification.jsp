<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
h1{
	margin-top: 100px;
	margin-left: 45%;
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

</style>
</head>
<body>
	<h1>Verify User</h1>
	<%String msg = request.getParameter("msg");
	String username = session.getAttribute("username").toString();
	%>
		<br> 
		<form class = "form" action="verification" method = "post">
		<input type="hidden" name = "type" value = "<%=msg %>"><br>
		<input type="text" name="username" value = "<%= username %>" placeholder="<%= username %>"><br> 
		<input type="password" name="password" placeholder="Password" required><br> 
		<input type="submit" value="Verify"><br>
		<hr>
		</form>
</body>
</html>