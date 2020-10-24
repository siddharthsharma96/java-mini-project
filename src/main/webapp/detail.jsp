<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");//http 1.1
	response.setHeader("Progma", "no-cache");//http1.0
	response.setHeader("Expires","0");//proxies
		if(session.getAttribute("username")== null){
			response.sendRedirect("login.jsp");}
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=7011630679");
statement=connection.createStatement();
String sql ="select * from genx.salary where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
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
  <title>edit</title>
</head>

<body>
  
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
  <header id="main-header" class="py-2 bg-primary text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1>
           </h1>
        </div>
      </div>
    </div>
  </header>

  <!-- ACTIONS -->
  <section id="actions" class="py-4 mb-4 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="welcome.jsp" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
          </a>
        </div>
        
        
      </div>
    </div>
  </section>

  <!-- DETAILS -->
  <section id="details">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-header">
              <h4>Edit Post</h4>
            </div>
            <div class="card-body">
              <form method="post" action="update-process.jsp">
              <div class="form-group">
                  
                  <input type="hidden" class="form-control" name="updateid" value="<%=resultSet.getString("id") %>">
                </div>
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" name="updateusername" value="<%=resultSet.getString("username") %>">
                </div>
                <div class="form-group">
                  <label for="email">Email</label>
                  <input type="email" class="form-control" name="updateemail" value="<%=resultSet.getString("email") %>">
                </div>
                <div class="form-group">
                  <label for="salary">Salary</label>
                  <input type="text" class="form-control" name="updatesalary" value="<%=resultSet.getString("salary") %>">
                </div> 
                <div class="col-md-3">
                <input type="submit" value="submit" class="btn btn-success btn-block">
          
        </div>  
              </form>
              <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
            </div>
          </div>
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
	<div class="modal fade" id="addUserModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">Delete User</h5>
          <button class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <p>Do you really want to delete the user</p>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger" data-dismiss="modal">Delete user</button>
        </div>
      </div>
    </div>
  </div>



  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    CKEDITOR.replace('editor1');
  </script>
</body>

</html>