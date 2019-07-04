<%-- 
    Document   : Orders
    Created on : Nov 9, 2018, 1:13:19 PM
    Author     : Rohit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="dashboard.css" rel="stylesheet">
  </head>

  <body>
      
      <%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate") ;
         if(session.getAttribute("user")==null){
           out.print(" <script>function myFunction() { alert(\"Please Log-In First!\");}</script> "); 
         response.sendRedirect("../main.html");
          
         }
        String name1=(String) session.getAttribute("user");
        String id=(String) session.getAttribute("id");
      
      %>
      
      
     <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
      <h5 class="my-0 mr-md-auto font-weight-normal">FOODLOOP ,  <% out.print(name1);%></h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="#">What's New</a>
        <a class="p-2 text-dark" href="#">Orders</a>
        <a class="p-2 text-dark" href="../../about us/main.html">About us</a>
        
      </nav>
	   <a class="btn btn-outline-primary" href="../Product page/product_main.jsp">Home</a>
      <form action="logout">
      <input type="submit" value="Log-Out" name="logout" class="btn btn-outline-primary">
      </form>
    </div>

   

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          
          <h2>My Orders</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
                
                
            
            
              <thead>
                <tr>
                  <th>S.No</th>
                  <th>Order No.</th>
                  <th>Food Items</th>
                  <th>Total Price</th>
                  <th>Status</th>
                  <th>Date Ordered</th>
                </tr>
              </thead>
              <tbody>
                
                  
                  <% int sno=1;String s="";
                   Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement st =con.createStatement();
                                 try{
                ResultSet rs = st.executeQuery("Select Orderno,FoodName,price,status,ordertime  from cart where cid="+id);
                               while(rs.next()){
                                   double orderno=rs.getDouble(1);
                                   String name=rs.getString(2);
                                   int price=rs.getInt(3);
                                   int status=rs.getInt(4);
                                   java.util.Date date=new java.util.Date();
            
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                                    sqlDate = rs.getDate(5);
            
                                   if(status==0)
                                   { s="Order Received";}
                                   if(status==1)
                                   { s="Processing Your Order";}
                                   if(status==2)
                                   { s="Order Completed";}
                                   
                                   out.println("  <tr><td>"+sno+"</td> <td>"+orderno+"</td> <td>"+name+"</td><td>Rs."+price+"</td><td>"+s+"</td><td>"+sqlDate+"</td></tr> ");
                                   sno++ ;
                               }
                                 
                                 }catch(Exception e){
                                     response.sendRedirect("Google.com");
                                 }
                
            %>
                  
                  
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#007bff',
            borderWidth: 4,
            pointBackgroundColor: '#007bff'
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
      });
    </script>
  </body>
</html>

