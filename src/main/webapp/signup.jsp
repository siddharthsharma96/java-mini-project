<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <title>Sign-up</title>
</head>

<body>
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="index.html" class="navbar-brand">Genx</a>
    </div>
  </nav>

  <!-- HEADER -->
  <header id="main-header" class="py-2 mb-4 bg-primary text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1 data-aos="zoom-in-up" data-aos-duration="3000">
            <i class="fas fa-user"></i> Genx Admin</h1>
        </div>
      </div>
    </div>
  </header>

 

  <!-- LOGIN -->
  <section id="login" class="mb-3">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <div class="card">
            <div class="card-header">
              <h4 data-aos="fade-right" data-aos-duration="2000">Account Sign-up</h4>
               
            </div>
            <div class="card-body">
              <form action="Signup" method="post" >
                <div class="form-group">
                  <label for="email" data-aos="zoom-in-up" data-aos-easing="linear" data-aos-duration="2000">Username</label>
                  <input data-aos="fade-up" data-aos-duration="1500" type="text" class="form-control" name="email" placeholder="Username" minlength=4 required>
                </div>
                <div class="form-group">
                  <label data-aos="zoom-in-up" data-aos-easing="linear" data-aos-duration="2000">Password</label>
                  <input data-aos="fade-up" data-aos-duration="1500" type="password" class="form-control" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required>
                </div>
                <div class="form-group">
                  <label data-aos="zoom-in-up" data-aos-easing="linear" data-aos-duration="2000">Conform Password</label>
                  <input data-aos="fade-up" data-aos-duration="1500" type="password" class="form-control" name="cnfpassword" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required>
                </div>
                <input data-aos="fade-left" data-aos-duration="1000" type="submit" value="Submit" class="btn btn-primary px-5" >
                <input data-aos="fade-right" data-aos-duration="1000"  type="reset" value="Reset" class="btn btn-primary px-5" /><br>
                <p class="mt-1">Already registered!! <a href="login.jsp">Login Here</a><p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <footer id="main-footer" class="bg-dark text-white mt-5 p-3">
    <div class="container ">
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

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>
</body>

</html>
 