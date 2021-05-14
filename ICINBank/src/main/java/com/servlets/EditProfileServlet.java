package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

public class EditProfileServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		//String username = request.getParameter("username");
		try {
			Connection con = Connector.getCon();
			Statement st =  con.createStatement(); 
			st.executeUpdate("update users set firstname ='"+firstname+"', lastname='"+lastname+"' ,phone = '"+phone+"' ,email='"+email+"'");
			response.sendRedirect("profile.jsp?msg=done");
		}
		catch(Exception e)
		{
			response.sendRedirect("profile.jsp?msg=error");
			System.out.println(e);
		}
	}
}
