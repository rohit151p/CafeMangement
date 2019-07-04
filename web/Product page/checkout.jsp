<%-- 
    Document   : checkout
    Created on : Nov 4, 2018, 7:33:48 PM
    Author     : Rohit
--%>

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
      <%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate") ;
         if(session.getAttribute("user")==null){
           out.print(" <script>function myFunction() { alert(\"Please Log-In First!\");}</script> "); 
         response.sendRedirect("../main.html");
          
         }
        String name1=(String) session.getAttribute("user");
        String idd = (String) session.getAttribute("id");
      
      %>
       <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
      <h5 class="my-0 mr-md-auto font-weight-normal">FOODLOOP,  <% out.print(name1);out.print(idd);%> </h5>
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
        <h2>Checkout form</h2>
        <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
      </div>

      <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            
          </h4>
            
            
            
            
            
            
          <ul class="list-group mb-3">
              <% 
                   Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement st =con.createStatement();
               
                
            int[] id;
            id = new int[10];
            String foodname=" " ;
            int[] qua;
            qua = new int[10];
             for(int j=1;j<7;j++){
           
          qua[j] = Integer.parseInt(request.getParameter("qua"+j));
          
           }
             if(qua[1]==0 && qua[2]==0 && qua[3]==0 && qua[4]==0 && qua[5]==0 && qua[6]==0){
             // response.sendRedirect("product_main.jsp");
             RequestDispatcher rd= request.getRequestDispatcher("product_main.jsp");
             rd.forward(request,response);
          }
             String name="Null";
             int price=0;
             int all=0;
            
            for(int j=1;j<7;j++){
                 
                if(qua[j]>0){
                   
                    
                     try{
                ResultSet rs = st.executeQuery("Select name,price from food where id=00"+j);
                while(rs.next()){
                    name = rs.getString(1);
                     price= rs.getInt(2);
                     foodname = foodname.concat(" , "+name+" * "+qua[j]);
                }}catch(Exception e){
                    response.sendRedirect("product_main.jsp");
                } int total=price*qua[j];
                
                all=all+total;
               
                  out.println(" <li class=\"list-group-item d-flex justify-content-between lh-condensed\"><div> <h6 class=\"my-0></h6><small class=\"text-muted\">"+name+"</small></div><span class=\"text-muted\">"+price+"*"+qua[j]+" = "+total+"</span></li>");
               
                }
               
            }
            out.println(" <li class=\"list-group-item d-flex justify-content-between\"><span>Total (Rs.)</span><strong>"+all+"</strong></li>");
              


            %>
           
            
            
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
        </div>
        

            
            <hr class="mb-4">
            
                    
          <%  
                  
                 
        
                
              
                double order = Math.random() * 100000 + 1;
                
                  ResultSet rs = st.executeQuery("select Orderno from cart");
                  while(rs.next()){
                  double order1=rs.getDouble(1);
                  if(order==order1){
                    order = Math.random() * 100000 + 1;
                  }
                  
                  
                  }
                  
        %>
        
        <form action="checkout" method="POST">  
            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Continue to check out">
            
            <input type="hidden" value="<%out.print(all);%>" name="price">
            <input type="hidden" value="<%out.print(foodname);%>" name="name">
            <input type="hidden" value="<%out.print(order);%>" name="order">
            
        
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
