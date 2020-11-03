<%@ page import="java.sql.*" %>  
<%  
	String name=request.getParameter("val"); 
	String driverName = "com.mysql.jdbc.Driver";
	if(name==null||name.trim().equals("")){
		try{ 
			Class.forName(driverName);  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");  
			PreparedStatement ps=con.prepareStatement("SELECT * FROM genx.salary where status!=3");  
			ResultSet rs=ps.executeQuery();  
			  
			if(!rs.isBeforeFirst()) {      
			 	out.println("<p>No Record Found!</p>");   
			}else{  
				out.print("<table class='table table-striped'><thead class='thead-dark'><tr ><th class='text-center'>Username</th><th class='text-center'>Email</th><th class='text-center'>Salary</th><th class='text-center'>Actions</th><th></th></tr></thead><tbody>");  
				while(rs.next()){  
				out.print("<tr  ><td class='text-center'>"+rs.getString("empname")+"</td><td class='text-center'>"+rs.getString("email")+"</td><td class='text-center'>"+rs.getInt("salary")+"</td><td class='text-center'><a onclick='abc("+rs.getInt("id")+")' data-id="+rs.getInt("id")+" class='btn btn-danger text-white px-4 mr-3' data-toggle='modal'	data-target='#deleteModal'><i class='fa fa-trash' aria-hidden='true'></i></a><a href='detail.jsp?id="+rs.getInt("id")+"' class=' btn btn-primary '>Edit</a></td><td><button onclick='loadDoc("+rs.getInt("id")+")' type='button' id='"+rs.getInt("id")+"' data-toggle='button' aria-pressed='false' autocomplete='off' class='btn btn-primary '>Draft</button></td></tr>");  
				}   
				out.print("</tbody></table>");  
			}
			con.close();  
		}catch(Exception e){
			out.print(e);
		}
	}else{  
		try{ 
			Class.forName(driverName);  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");  
			PreparedStatement ps=con.prepareStatement("select * from genx.salary where status!=3 and ( empname like '"+name+"%' or email like '"+name+"%' or salary like '"+name+"%') ");  
			ResultSet rs=ps.executeQuery();  
			  
			if(!rs.isBeforeFirst()) {      
			 out.println("<p>No Record Found!</p>");   
			}else{  
				out.print("<table class='table table-striped'><thead class='thead-dark'><tr ><th class='text-center'>Username</th><th class='text-center'>Email</th><th class='text-center'>Salary</th><th class='text-center'>Actions</th><th></th></tr></thead><tbody>");  
				while(rs.next()){  
				out.print("<tr  ><td class='text-center'>"+rs.getString("empname")+"</td><td class='text-center'>"+rs.getString("email")+"</td><td class='text-center'>"+rs.getInt("salary")+"</td><td class='text-center'><a onclick='abc("+rs.getInt("id")+")' data-id="+rs.getInt("id")+" class='btn btn-danger text-white px-4 mr-3' data-toggle='modal'	data-target='#deleteModal'><i class='fa fa-trash' aria-hidden='true'></i></a><a href='detail.jsp?id="+rs.getInt("id")+"' class=' btn btn-primary '>Edit</a></td><td><button onclick='loadDoc("+rs.getInt("id")+")' type='button' id='"+rs.getInt("id")+"' data-toggle='button' aria-pressed='false' autocomplete='off' class='btn btn-primary '>Draft</button></td></tr>");  
				}  
				out.print("</tbody></table>");  
			}//end of else for rs.isBeforeFirst  
			con.close();  
		}catch(Exception e){
			out.print(e);
		}  
	}//end of else  
%>  
