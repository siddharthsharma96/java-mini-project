<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%
	response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");//http 1.1
	response.setHeader("Progma", "no-cache");//http1.0
	response.setHeader("Expires","0");//proxies
		if(session.getAttribute("username")== null){
			response.sendRedirect("login.jsp");}%>
<%
String updateid = request.getParameter("updateid");
String updateusername=request.getParameter("updateusername");
String updateemail=request.getParameter("updateemail");
String updatesalary=request.getParameter("updatesalary");

if(updateid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(updateid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
String sql="Update genx.salary set id=?,email=? ,empname=?,salary=? where id="+updateid;
ps = con.prepareStatement(sql);
ps.setString(1,updateid);
ps.setString(2, updateemail);
ps.setString(3,updateusername );
ps.setString(4, updatesalary);

int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("welcome.jsp");
}
else
{
response.sendRedirect("detail.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);

}
}
%>