<%-- 
    Document   : checkout
    Created on : Nov 4, 2018, 7:33:48 PM
    Author     : Rohit
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
      
      
  </head>

  <body class="bg-light">
      <%! Double Orderno=0.0; %>
            <%!   String Foodname="";%>
             <%!  int price=0; %>
      <% 
    
            
            String id = (String) session.getAttribute("id");
            Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery(" Select Orderno,Foodname,price from cart where cid='"+id+"'; ");
                while(rs.next()){
                 Orderno=rs.getDouble(1);
                Foodname=rs.getString(2);
               price=rs.getInt(3);
                
                }
      %> 
       <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
      <h5 class="my-0 mr-md-auto font-weight-normal">FOODLOOP</h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="#">What's New</a>
        <a class="p-2 text-dark" href="#">Orders</a>
        <a class="p-2 text-dark" href="../../about us/main.html">About us</a>
        <a class="p-2 text-dark" href="#">My Profile</a>
      </nav>
      <form action="logout" method="logout">
      <input type="submit" value="Log-Out" name="logout" class="btn btn-outline-primary">
      </form>
    </div>

    <div class="container">
      <div class="py-5 text-center">
          <h1>FoodLoop</h1>
        <h2>Congratulations</h2>
        <p class="lead"><b>YOUR ORDER IS Successful</b></p>
      </div>

      <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <div class="col-md-4 order-md-2 mb-4">
          <h1 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Order Details</span>
            
          </h1>
            
            
            
            
            
            
          
            
            
          </ul>

          
        </div>
        

            
            <hr class="mb-4">
            
                    
          <%  
                
         
              
                  
        %>
        
        <form action="checkout">  
            <h2> Order No. : <% out.println(Orderno);%></h2>
            <h2> Id : <% out.println(id);%></h2>
            <h2> Total Price : <% out.println(price);%></h2>
            <h2> Items : <% out.println(Foodname);%></h2>
            
            <a href="product_main.jsp" class="btn btn-primary btn-lg btn-block">Order More</a>
           
            
        
        </form>
        
      </div>
      </div>
      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2018 FoodLoop</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    

   
  </body>
</html>
