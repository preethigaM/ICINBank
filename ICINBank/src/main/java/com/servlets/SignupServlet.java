package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public SignupServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = (String)(request.getParameter("firstname"));
		String lastname = (String)(request.getParameter("lastname"));
		String phone = (String)(request.getParameter("phone"));
		String email = (String)(request.getParameter("email"));
		String username = (String)(request.getParameter("username"));
		String password = (String)(request.getParameter("password"));
		String sql = "insert into icinbank.users(firstname, lastname, phone, email, username, password) values(?,?,?,?,?,?)";
		
		try
		{
			Connection con = Connector.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, firstname);
			st.setString(2, lastname);
			st.setString(3, phone);
			st.setString(4, email);
			st.setString(5, username);
			st.setString(6, password);
			st.executeUpdate();
			st.close();
			response.sendRedirect("signup.jsp?msg=valid");
		}
		catch(Exception e)
		{
			response.sendRedirect("signup.jsp?msg=invalid");
			System.out.print(e);
		}
	}

}
