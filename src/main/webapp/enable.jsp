<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");//http 1.1
response.setHeader("Progma", "no-cache");//http1.0
response.setHeader("Expires","0");//proxies
	if(session.getAttribute("username")== null){
		response.sendRedirect("login.jsp");}
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
Statement st=conn.createStatement();
int i=st.executeUpdate("update genx.salary set status=2 where id="+id);

response.sendRedirect("welcome.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>