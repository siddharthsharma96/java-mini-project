<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	
	<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
  <title>Dashboard</title>
</head>

<body>
  <%
	response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");//http 1.1
	response.setHeader("Progma", "no-cache");//http1.0
	response.setHeader("Expires","0");//proxies
		if(session.getAttribute("username")== null){
			response.sendRedirect("login.jsp");}%>	
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="welcome.jsp" class="navbar-brand">Genx</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="welcome.jsp" class="nav-link">Dashboard</a>
          </li>
        </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown mr-3">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
              <i class="fas fa-user"></i> Welcome  ${username}
            </a>
   
          </li>
          <li class="nav-item">
            <a href="logout.jsp" class="nav-link">
              <i class="fas fa-user-times"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- HEADER -->
  <header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1>
            <i class="fas fa-users"></i> Users</h1>
        </div>
      </div>
    </div>
  </header>

 <%

String driverName = "com.mysql.jdbc.Driver";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

  <!-- POSTS -->
  <section id="posts" class="mt-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-header">
              <h4>Latest Data</h4>
            </div>
            <table class="table table-striped">
              <thead class="thead-dark">
                <tr>
                 
                  <th class="text-center">Username</th>
                  <th class="text-center">Email</th>
                  <th class="text-center">Salary</th>
                  <th class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
              <%
				try{ 
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
				statement=connection.createStatement();
				String sql ="SELECT * FROM genx.salary";
				
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
				%>
                <tr>
                 
                  <td class="text-center"><%=resultSet.getString("username") %></td>
				<td class="text-center"><%=resultSet.getString("email") %></td>
				<td class="text-center"><%=resultSet.getInt("salary") %></td>
                  <td class="text-center">
                  <a onclick='abc(<%=resultSet.getInt("id") %>)' data-id="<%=resultSet.getInt("id") %>" class="btn btn-danger px-4" data-toggle="modal" data-target="#deleteModal" >
                  <i class="fa fa-trash" aria-hidden="true"></i></a>
                    <a href="detail.jsp?id=<%=resultSet.getInt("id")%>" class="btn btn-primary ">
                    <i class="fa fa-pencil-square" aria-hidden="true"></i>Edit</a>
                  </td>
                </tr>
                <% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                             </tbody>
            </table>

           
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ACTIONS -->
  <section id="actions" class="py-4 mb-4 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="adduser.jsp" class="btn btn-warning btn-block" >
            <i class="fas fa-plus"></i> Add User
          </a>
        </div>
      </div>
    </div>
  </section>
  <!-- FOOTER -->
  <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="container">
      <div class="row">
        <div class="col">
          <p class="lead text-center">
            Copyright &copy;
            <span id="year"></span>
            Genx
          </p>
        </div>
      </div>
    </div>
  </footer>
 <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">Delete user</h5>
          <button class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <p>Are you sure you want to delete</p>
          </form>
        </div>
        <div class="modal-footer">
       <form  action="delete.jsp">
		<input id=delete type="hidden" name="delete" value=null>
		<input type="submit" value="delete"  class="btn btn-success" >
		</form>
        
          
        </div>
      </div>
    </div>
  </div>
  <script>
  	function abc(d){
  	    console.log('hello dlete',d)
  		document.getElementById('delete').value=d;
  	    console.log('executed')

  	}
  </script>
  
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>

</body>

</html>