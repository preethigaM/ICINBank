package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

public class RequestChequeBook extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		//String username = request.getAttribute("username").toString();
		System.out.println(request.getAttribute("username"));
		String username = request.getParameter("username");
		String accountType = request.getParameter("accountType");
		String description = request.getParameter("description");
		String status = "Pending";
		String sql = "Insert into icinbank.request (username, accountType, description, status) values (?,?,?,?)";
		try {
			Connection con = Connector.getCon();
			PreparedStatement st = con.prepareStatement(sql); 
			st.setString(1, username);
			st.setString(2,accountType);
			st.setString(3, description);
			st.setString(4, status);
			st.executeUpdate();
			st.close();
			response.sendRedirect("requestNewChequeBook.jsp?msg=done");
		}
		catch(Exception e)
		{
			response.sendRedirect("requestNewChequeBook.jsp?msg=error");
			System.out.println(e);
		}
	}
}
