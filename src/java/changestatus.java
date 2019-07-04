import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class changestatus extends HttpServlet{
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
      PrintWriter out= res.getWriter();
        try{
            String orderno=req.getParameter("orderno");
            String status=req.getParameter("status");
              
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
                Statement stmt=con.createStatement();
                stmt.executeUpdate("UPDATE cart SET status=? WHERE Orderno=?");
               
               
                stmt.close();
                con.close();
           // res.sendRedirect("../Client/main.jsp");
            }
            catch(Exception e){
                System.out.println(e);
                out.println("Error in DBMS connectivity");
            }
            
            
           
           
            
            
            
          
            
       
        }catch(Exception e){
            out.println("Error in INPUT");
        }
    }
}