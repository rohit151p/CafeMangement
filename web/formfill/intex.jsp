
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <link href="signin.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </head>

  <body class="text-center">
      <form class="form-signin" action="formfill" method="post">
        <img class="mb-4" src="images.png" alt="" width="92" height="92">
      <h1 class="h3 mb-3 font-weight-normal">Please Fill up the form to Sign In</h1>
      <label for="CID"><b>College ID</label><br>
                <input type="int" name="cid" class="form-control" placeholder="Enter your College ID" required><br>
                <label for="name">Name</label><br>
                <input type="text" name="name" class="form-control" placeholder="Enter Your Name" required><br>
                
                <label for="email">Email ID</label><br>
                <input type="text" name="email" class="form-control" placeholder="Enter your email" required><br>
				
				<label for="dob">DOB</label><br>
                <input type="text" name="dob" class="form-control" placeholder="Enter your DOB" required><br>
				
                <label for="phone">Phone</label><br>
                <input type="long" name="phone" class="form-control" placeholder="Enter your phone no." required><br>
               
                
                <label for="password">Create Your Password</label><br>
                <input type="text" name="password" class="form-control" placeholder="Enter Your Password" required><br>
      
      
      <input class="btn btn-lg btn-primary btn-block" type="submit">
      </form>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 FoodLoop</p>
    
      <div id="sidebar1" >
            <ul>
            <li><a href="../main.html">Home</a></li>
            <li><a href="formfill/formfill.html">Fill Form</a></li>
            <li><a href="Search/search.html">Search</a></li>
            <li><a href="LoginPage/login.html">Log in</a></li>
            <li><a href="Search/search.html">Search</a></li>
            <li><a href="Feedback/feedback.html">Feedback</a></li>
        </ul>
        <div id="sidebar1-btn">
            <span></span>
             <span></span>
            <span></span>
        </div>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
                $('#sidebar1-btn').click(function(){
                    $('#sidebar1').toggleClass('visible');
                });
            });
        </script>
  </body>
</html>
