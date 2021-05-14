package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import com.connector.Connector;

public class Transfer extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String username = (String)(request.getParameter("username"));
		long millis=System.currentTimeMillis();  
	    java.sql.Date date=new java.sql.Date(millis);  
		String from = (String)(request.getParameter("from"));
		String to = (String)(request.getParameter("to"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String type = "";
		String balance1 = "null";
		try{
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select primaryBalance from icinbank.users where username = '"+username+"' and primaryNum = '"+from+"'");
			while(rs.next())
			{	
				type = "primary";
				balance1 = rs.getString(1);
				System.out.println(balance1);
			}
			if(balance1 == "null")
			{
				rs = st.executeQuery("select savingsBalance from icinbank.users where username = '"+username+"' and savingsNum = '"+from+"'");
				while(rs.next())
				{	
					type="savings";
					balance1 = rs.getString(1);
					System.out.println(balance1);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		int balance = Integer.parseInt(balance1);
		balance -= amount;
		if(balance<0)
		{
			response.sendRedirect("transfer.jsp?msg=insufficient");
		}
		else
		{
		String sql = "insert into icinbank.transaction(username, date, payeeAccNo, accountType, debit, credit, balance) values(?,?,?,?,?,?,?)";
		
		try
		{
			Connection con = Connector.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setDate(2, date);
			st.setString(3, to);
			st.setString(4, type);
			st.setInt(5, amount);
			st.setInt(6, 0);
			st.setInt(7, balance);
			st.executeUpdate();
			
			if(type.equals("primary"))
			st.executeUpdate("update users set primaryBalance = '"+balance+"' where username = '"+username+"'");
			if(type.equals("savings"))
				st.executeUpdate("update users set savingsBalance = '"+balance+"' where username = '"+username+"'");
			st.close();
			response.sendRedirect("transfer.jsp?msg=done");
		}
		catch(Exception e)
		{
			response.sendRedirect("transfer.jsp?msg=error");
			System.out.print(e);
		}
		}
	}
}
