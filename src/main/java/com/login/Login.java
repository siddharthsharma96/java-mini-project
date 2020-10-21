package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("un");
		String pw=request.getParameter("pw");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String qry = "select * from genx.password where username='" + un + "' and password='" + pw + "'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Driver Class Loaded");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
			
			System.out.println("Connetion Establish with db server");
			
			pstmt=con.prepareStatement(qry);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				HttpSession session=request.getSession();
				session.setAttribute("username",un);
				
				response.sendRedirect("welcome.jsp");
			}else {
				response.sendRedirect("login.jsp");
			}
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs!=null)
			{
				try {
					rs.close();
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
				
			}
			if(pstmt!=null)
			{
				try {
					pstmt.close();
				
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
				
			}
			if(con!=null)
			{
				try {
					con.close();
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
				
			}
			System.out.println("Closed All Resources");
		}
		
	}
	

}