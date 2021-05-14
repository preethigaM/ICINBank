package com.connector;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	public static Connection getCon()
	
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/icinbank","root","Preethi4*s");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
	}
}
