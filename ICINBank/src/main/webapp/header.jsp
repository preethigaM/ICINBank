<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<style type="text/css">
.navbar {
  overflow: hidden;
  background-color: #f9f9f9;
  padding: 5px;
  margin-bottom: 50px;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color: #f9f9f9;
  font-family: inherit;
  margin: 0;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
<div class="navbar">
<a href="home.jsp">Home</a>
<div class="dropdown">
	<button class="dropbtn">Accounts 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
		<a href="#">Operative Accounts</a>
		<a href="#">Deposit Accounts</a>
		<a href="#">Loan Accounts</a>
	</div>
</div>
<div class="dropdown">
	<button class="dropbtn">Transfer 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
		<a href="transfer.jsp">Within ICIN</a>
		<a href="transfer.jsp">NEFT Transfer</a>
		<a href="#">IMPS Transfer</a>
		<a href="managePayee.jsp">Manage Payee</a>
	</div>
</div>
<div class="dropdown">
	<button class="dropbtn">Request 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
		<a href="requestNewChequeBook.jsp">Request New Cheque Book</a>
	</div>
</div>
<div class="dropdown">
	<button class="dropbtn">Me<i class="fa fa-caret-down"></i></button>
	<div class="dropdown-content">
	<a href="profile.jsp">Profile</a>
	</div>
</div>
<a href="logout.jsp">Logout</a>
</div>
</body>
</html>