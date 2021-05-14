package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

public class EditUsersServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String primaryBalance = request.getParameter("primaryBalance");
		String savingsBalance = request.getParameter("savingsBalance");
		String enable;
		String action = request.getParameter("action");
		if(action.equals("Enable"))
		{
			enable = "Enabled";
		}
		else
		{
			enable = "Disabled";
		}
		
		try {
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			st.executeUpdate("update users set primaryBalance = '"+primaryBalance+"', savingsBalance = '"+savingsBalance+"', enabled = '"+enable+"' where username = '"+username+"'");
			response.sendRedirect("admin/userAccount.jsp?msg=done");
		}
		catch(Exception e)
		{
			response.sendRedirect("admin/userAccount.jsp?msg=error");
			System.out.println(e);
		}
	}
}
