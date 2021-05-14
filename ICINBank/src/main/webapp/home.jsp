<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connector.Connector" %>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Home</title>
<style type="text/css"> 

.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}
.row {
	margin: 0 -10px;
	top: 20px;
}
.card{
	margin-top: 50px;
	padding-top: 10px;
    background-color: #cff3fc;
	box-shadow: 5px 5px 5px 5px #aaaaaa;
	padding: 16px;
  	text-align: center;
}
.card1{
    background-color: #bff5d4;
	box-shadow: 5px 5px 5px 5px #aaaaaa;
	padding: 16px;
  	text-align: center;
}
.row1 button{
	margin-right: 100%;
	width: 25.4%;
	margin-bottom: 40px;
}
button{
	height: 30px;
	background-color: #f9f9f9;
}
.row2 button{
	margin-right: 100%;
	width: 25.4%;
	margin-bottom: 40px;
}
.col1 {
	width: 25.4%;
	margin-left: 26.5%;
	margin-top: -100px;
	margin-bottom: 50px;
}
.col1 button{
	width: 100%;
}
.col2{
	width: 25.4%;
	margin-left: 53.3%;
	margin-top: -100px;
	margin-bottom: 50px;
}
.col2 button{
	width: 100%;
}
</style>
</head>
<body>
<%String username = session.getAttribute("username").toString(); %>
	<h1>Hi, <%= username %>! Welcome to ICIN bank</h1>
	<div class="row">
		<div class="column">
			<div class="card">
				<h3>Primary Balance: <i class="fas fa-dollar-sign"></i>
				<%
					try{
						Connection con = Connector.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select primaryBalance from icinbank.users where username = '"+username+"'");
						while(rs.next())
						{
						%>
							<%=rs.getString(1) %>
						<%
						}
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
				%>
				</h3>
			</div>
		</div>
		<div class="column">
			<div class="card">
				<h3>Deposit</h3>
			</div>
		</div>
		<div class="column">
			<div class="card">
				<h3>Withdraw</h3>
			</div>
		</div>
	</div>
	<div class="row1">
		<a href="primaryBalance.jsp"><button style="width: 25.4%;">View Details</button></a>
	</div>
	<div class="col1">
		<a href="verification.jsp?msg=deposit"><button>Go To Deposit</button></a>
	</div>
	<div class="col2">
		<a href="verification.jsp?msg=withdraw"><button>Go To Withdraw</button></a>
	</div>
	<div class = "row">
		<div class="column">
			<div class="card1">
				<h3>Savings Balance: <i class="fas fa-dollar-sign"></i> 
				<%
					try{
						Connection con = Connector.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select savingsBalance from icinbank.users where username = '"+username+"'");
						while(rs.next())
						{
						%>
							<%=rs.getString(1) %>
						<%
						}
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
				%>
				</h3>
			</div>
		</div>
	</div>
	<div class="row2">
		<a href="savingsBalance.jsp"><button>View Details</button></a>
	</div>
</body>
</html>