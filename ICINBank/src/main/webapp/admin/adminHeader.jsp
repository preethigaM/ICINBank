<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>home</title>
<style>
	.navbar{
		background-color: #f9f9f9;
		margin-left: 50px;
		margin-right: 50px;
	}
	.navbar button{
		font-size: 16px;  
  		border: none;
  		outline: none;
  		color: blue;
  		padding: 14px 16px;
 		background-color: #f9f9f9;
  		font-family: inherit;
	}
	
</style>
</head>

<body>
	<div class="navbar">
		<a id = "first" href = "adminHome.jsp"><button>ICIN Bank</button></a>
		<a href="userAccount.jsp"><button>User Account</button></a>
		<a href="cheque.jsp"><button>Cheque Book Request</button></a>
		<a href="../logout.jsp"><button>Logout</button></a>
	</div>
</body>
</html>