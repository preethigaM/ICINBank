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

public class DepositServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String username = (String)(request.getParameter("username"));
		long millis=System.currentTimeMillis();  
	    java.sql.Date date=new java.sql.Date(millis);  
		String accNo = (String)(request.getParameter("accountNo"));
		String type = (String)(request.getParameter("type"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		String balance1="0";
		if(type.equals("primary"))
		{
			try{
				Connection con = Connector.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select primaryBalance from icinbank.users where username = '"+username+"'");
				while(rs.next())
				{	
					balance1 = rs.getString(1);
					System.out.println(balance1);
				}

			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		else if(type.equals("savings"))
		{
			try{
				Connection con = Connector.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select savingsBalance from icinbank.users where username = '"+username+"'");
				while(rs.next())
				{	
					balance1 = rs.getString(1);
					System.out.println(balance1);
				}

			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		
		int balance = Integer.parseInt(balance1);
		balance += amount;
		
		String sql = "insert into icinbank.transaction(username, date, payeeAccNo, accountType, debit, credit, balance) values(?,?,?,?,?,?,?)";
		
		try
		{
			Connection con = Connector.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setDate(2, date);
			st.setString(3, accNo);
			st.setString(4, type);
			st.setInt(5, 0);
			st.setInt(6, amount);
			st.setInt(7, balance);
			st.executeUpdate();
			if(type.equals("primary"))
			st.executeUpdate("update users set primaryBalance = '"+balance+"' where username = '"+username+"'");
			if(type.equals("savings"))
				st.executeUpdate("update users set savingsBalance = '"+balance+"' where username = '"+username+"'");
			st.close();
			response.sendRedirect("deposit.jsp?msg=done");
		}
		catch(Exception e)
		{
			response.sendRedirect("deposit.jsp?msg=error");
			System.out.print(e);
		}
	}
}
