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

public class VerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
			int flag = 0;
			try {
				Connection con = Connector.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where username='"+username+"' and password='"+password+"'");
				while(rs.next())
				{
					flag = 1;
					session.setAttribute("username", username);
					if(type.equals("deposit"))
					response.sendRedirect("deposit.jsp");
					else
						response.sendRedirect("withdraw.jsp");
				}
				if(flag == 0)
				{
					response.sendRedirect("verification.jsp?msg=false");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				response.sendRedirect("verification.jsp?msg=invalid");
			}
		}
}
