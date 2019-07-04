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

    <title>Admin</title>

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
        
      
      %>
      
      
     <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
     <a class="btn my-0 mr-md-auto font-weight-normal" href="main.jsp">FOODLOOP ,  Admin</a>
      <nav class="my-2 my-md-0 mr-md-3">
          <a class="p-2 text-dark" href="complete.jsp">Completed Orders</a>
        <a class="p-2 text-dark" href="search.jsp">Search by ID</a>
        <a class="p-2 text-dark" href="../../about us/main.html">About us</a>
        
      </nav>
	   <a class="btn btn-outline-primary" href="../Product page/product_main.jsp">Log-Out</a>
           
     
      
    </div>
      <form action="search.jsp" method="post">
 <center> <b>Enter Id no. : </b>
                       <input type="integer" name="cid">
  <input type="submit" class="btn btn-outline-primary" name="go">
  
  </center>
      </form>
   

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          
          <h2>Current Orders</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
                
                
            
            
              <thead>
                <tr>
                  <th>S.No</th>
                  <th>Order No.</th>
                  <th>Food Items</th>
                  <th>Total Price</th>
                  <th>Status</th>
                  <th>Student Id</th>
                  <th>Change Status</th>
                  <th>Change </th>
                </tr>
              </thead>
              <tbody>
                
                  
                  <% int sno=1;String s="";
                  java.util.Date date=new java.util.Date();
            
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                   Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement st =con.createStatement();
                                 try{
                ResultSet rs = st.executeQuery("Select Orderno,FoodName,price,status,cid  from cart where  STATUS<2 ");
                               while(rs.next()){
                                   double orderno=rs.getDouble(1);
                                   String name=rs.getString(2);
                                   int price=rs.getInt(3);
                                   int status=rs.getInt(4);
                                   int uni=(int) orderno;
                                   String cid = rs.getString(5);
            
                                   if(status==0)
                                   { s="Order Received";}
                                   if(status==1)
                                   { s="Processing Your Order";}
                                   if(status==2)
                                   { s="Order Completed";}
                                   
                                   out.println(" <form action=\" main \" method=\"get\" > <tr><td>"+sno+"</td> <td><textarea name=orderno >"+orderno+"</textarea></td> "
                                           + "<td>"+name+"</td><td>Rs."+price+"</td><td>"+s+"</td>"
                                                   + "<td>"+cid+"</td><td><select class=\"form-control\" id=\"sel1\" name=status>"
                                                           + "<option value=\"0\">Ordered</option>"
                                                           + "<option value=\"1\">Processing</option><option value=\"2\"0>"
                                                           + "Completed</option></select></td><td><input type=\"submit\""
                                                           + " class=\"btn btn-outline-primary\"></form></td></tr>");
                                   sno++ ;
                               }
                                 
                                 }catch(Exception e){
                                     response.sendRedirect("Google.com");
                                 }
                
            %>
                  
                  
              </tbody>
            </table>
            <input type="hidden" value="<% --sno;out.print(sno);%>" name="s">
            </form>
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

