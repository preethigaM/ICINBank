package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

public class ConfirmRequest extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String username = request.getParameter("username");
			Connection con = Connector.getCon();
			Statement st = con.createStatement();
			st.executeUpdate("update request status = Confirm where username = '"+username+"''");
			response.sendRedirect("cheque.jsp?done");
		}
		catch(Exception e)
		{
			response.sendRedirect("cheque.jsp?error");
			System.out.println(e);
		}
	}
}
