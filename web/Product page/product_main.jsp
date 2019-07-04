<%-- 
    Document   : food
    Created on : Nov 4, 2018, 10:58:08 AM
    Author     : Rohit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>FoodLoop Items</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
      
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
      
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  </head>

  <body>

      <%
          response.setHeader("Cache-Control","no-cache,no-store,must-revalidate") ;
         if(session.getAttribute("user")==null){
           out.print(" <script>function myFunction() { alert(\"Please Log-In First!\");}</script> "); 
         response.sendRedirect("../main.html");
          
         }
        String name=(String) session.getAttribute("user");
        String id=(String) session.getAttribute("id");
              
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement st =con.createStatement();
	%>
      
      
      
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
      <h5 class="my-0 mr-md-auto font-weight-normal">Welcome to FOODLOOP,  <% out.print(name);out.print(id);%></h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark"  href="#">My Account</a>
        <a class="p-2 text-dark" href="History.jsp">My Orders</a>
        <a class="p-2 text-dark" href="../about us/main.html">About Us</a>
        <a class="p-2 text-dark" href="#">Pricing</a>
      </nav>
      <form action="logout">
      <input type="submit" value="Log-Out" name="logout" class="btn btn-outline-primary">
      </form>
    </div>

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">FoodItems</h1>
      <p class="lead">Select your Favourite Food Items at the Best Price.</p>
    </div>

      
      
      <h3 class="display-4">Menu #1 : Fast Food</h3>
    <div class="container">
        
        
      <div class="card-deck mb-3 text-center">
        
          
          <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Samosa</h4>
          </div>
          <div class="card-body">
            <img src="KellyJaes1.jpg">
              <li>Weight : 100grams</li>
              <div class="form-group">
                  
                
                
                <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=001");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select rating from food where id=001");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Rating : "+qua+"/5");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
                
                
                <form action="checkout.jsp">
                 <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua1">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select>
                 <br>
</div>
              <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value=" Order for Rs.10" name="ord1">
          </div>
        </div>
          
                  
          <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Patties</h4>
          </div>
          <div class="card-body">
        <img src="veg-patties-620.jpg">
              <li>Weight : 10grams</li>
               
               <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=002");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select rating from food where id=002");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Rating : "+qua+"/5");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
                
                
               <div class="form-group">
  <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua2">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select><br>
</div>
            
              <input type="Submit" class="btn btn-lg btn-block btn-outline-primary" name="ord2" value="Order for Rs.10">
          </div>
              
        </div>
          
          
          
          
          
          
           <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Samosa</h4>
          </div>
           <div class="form-group">
               <br>
         <img src="280px-Samosachutney.jpg">
               <li>Weight : 10grams</li>
                
                <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=003");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select avg(rating) from food where id=003");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("<b>Rating : "+qua+"/5</b>");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
                <br>
  <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua3">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select><br>
</div>
            <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Order for Rs.10" name="ord3">
          </div>
        </div>
          </div>     
        
        
        
        
        
        <h3 class="display-4">Menu #2 : Category</h3>
            <div class="container">
        
      <div class="card-deck mb-3 text-center">
        
          
          <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Chole Bature</h4>
          </div>
          <div class="card-body">
            <img src="chole_bhature_pakwan_520_070815033739.jpg">
               <li>Weight : 10grams</li>
             
                <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=004");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select rating from food where id=004");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Rating : "+qua+"/5");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
  <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua4">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select><br>
            <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Order for Rs.45">
          </div>
        </div>
          
          
        
          <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Cold Drinks</h4>
          </div>
          <div class="card-body">
              <img src="cold-drink-bottles-1181028.jpg">
             <li>Weight : 400ml</li>
              
              <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=005");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select rating from food where id=005");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Rating : "+qua+"/5");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
  <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua5">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select><br>
            <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Order for Rs.40">
          </div>
        </div>
          
           <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Pastries</h4>
          </div>
          <div class="card-body">
             <img src="Pastries.jfif">
             <li>Weight : 10grams</li>
             
              <%try{
                ResultSet rs = st.executeQuery("Select qua from food where id=006");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Remaining : "+qua);
                }
                rs = st.executeQuery("Select rating from food where id=006");
                while(rs.next()){
                    int qua = rs.getInt(1);
                    out.println("Rating : "+qua+"/5");
                }}
                catch(Exception e){
                    out.print("Remaining : 0<br>");
                    out.print("Rating : 0/5<br>");
                }
                
                
                %>
  <label for="sel1"><b>Select Quantity:</b></label>
  <select class="form-control" id="sel1" name="qua6">
    <option>0</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
  </select>
  <br>
            <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Order for Rs.25">
          </div>
        </div>
          </div>  
                
          <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Order" name="ord4">
</form>   
                
                
                 
                                        
        
        
        
        
      <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
          <div class="col-12 col-md">
            <img class="mb-2" src="../../assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
            <small class="d-block mb-3 text-muted">&copy; 2018</small>
          </div>
         
         
          <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Team</a></li>
              <li><a class="text-muted" href="#">Locations</a></li>
              <li><a class="text-muted" href="#">Privacy</a></li>
              <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
      </footer>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>

