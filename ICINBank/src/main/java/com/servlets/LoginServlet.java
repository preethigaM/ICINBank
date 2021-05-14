package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connector.Connector;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * public void init() throws ServletException { try {
	 * Class.forName("com.mysql.cj.jdbc.Driver"); } catch (ClassNotFoundException e)
	 * { e.printStackTrace(); } }
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		if("admin".equals(username) && "admin".equals(password))
		{
			session.setAttribute("username", username);
			response.sendRedirect("/ICINBank/admin/adminHome.jsp");
		}
		else
		{
			int flag = 0;
			try {
				Connection con = Connector.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where username='"+username+"' and password='"+password+"'");
				while(rs.next())
				{
					flag = 1;
					session.setAttribute("username", username);
					//session.setAttribute(password, rs)
					response.sendRedirect("home.jsp");
				}
				if(flag == 0)
				{
					response.sendRedirect("login.jsp?msg=false");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				response.sendRedirect("login.jsp?msg=invalid");
			}
		}
	}
}
