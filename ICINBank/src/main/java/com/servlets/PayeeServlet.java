package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PayeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)(request.getParameter("username"));
		String accNo = (String)(request.getParameter("accNum"));
		String accNo1 = (String)(request.getParameter("accNum1"));
		String type = (String)(request.getParameter("type"));
		String name = (String)(request.getParameter("name"));
		String ifsc = (String)(request.getParameter("ifsc"));
		String password = (String)(request.getParameter("password"));
		
		String sql = "insert into icinbank.payee(username, accNum, type, payeeName, ifsc) values(?,?,?,?,?)";
		
		try
		{
			Connection con = Connector.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			Statement st1 = con.createStatement();
			ResultSet rs = st1.executeQuery("select * from users where username='"+username+"' and password='"+password+"'");
			int flag = 0;
			while(rs.next())
			{
				flag = 1;
			}
			if(flag == 0 && accNo.equals(accNo1))
				response.sendRedirect("managePayee.jsp?msg=invalid");
			else
			{
				st.setString(1, username);
				st.setString(2, accNo);
				st.setString(3, type);
				st.setString(4, name);
				st.setString(5, ifsc);
				st.executeUpdate();
				st.close();
				response.sendRedirect("managePayee.jsp?msg=valid");
			}
		}
		catch(Exception e)
		{
			response.sendRedirect("managePayee.jsp?msg=error");
			System.out.print(e);
		}
	}

}
