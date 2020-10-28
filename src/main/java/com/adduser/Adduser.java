package com.adduser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Adduser
 */
public class Adduser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String addemail=request.getParameter("addemail");
		String addusername=request.getParameter("addusername");
		String addsalary=request.getParameter("addsalary");
		String qry = "INSERT INTO genx.salary (empname,email,salary) VALUES(?, ?,?);";
		
		Connection con=null;
		PreparedStatement stmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Driver Class Loaded");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
			
			System.out.println("Connetion Establish with db server");
			
			stmt=con.prepareStatement(qry);
			System.out.println("Platform Created");
			stmt.setString(1, addusername);
			stmt.setString(2, addemail);
			stmt.setString(3, addsalary);
			
			
			int i=stmt.executeUpdate();
			System.out.println("Data Inserted");
			if (i > 0) { 
				
				
				response.sendRedirect("welcome.jsp");
			} 
			else { 
				response.sendRedirect("login.jsp"); 
				} 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
