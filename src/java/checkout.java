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
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checkout extends HttpServlet{
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
      
        try{
              HttpSession session = req.getSession();
            
            String id = (String) session.getAttribute("id");
           
            int price = Integer.parseInt(req.getParameter("price"));
           String name = req.getParameter("name");
           double Order_no = Double.parseDouble(req.getParameter("order"));
            
            
            
            PrintWriter out= res.getWriter();
            
                
               
               
                int status=0;
               java.util.Date date=new java.util.Date();
            
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            
           
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
                PreparedStatement st =con.prepareStatement("insert into cart values (?,?,?,?,?,?)");
                st.setString(1,id);
                st.setDouble(2, Order_no);
                st.setString(3, name);
                st.setInt(4, price);
                st.setInt(5, status);
                st.setDate(6,sqlDate);
                int count  = st.executeUpdate();
                out.println("Your Order Is Succesfull and Order no is "+Order_no+" And no of row affected is "+count+" And you Ordered this on  "+sqlDate);
              //  req.setAttribute(id,"id");
                req.setAttribute(Double.toString(Order_no),"Order_no");
              //  req.setAttribute(name,"name");
             //   req.setAttribute(Integer.toString(price),"price");
              //  req.setAttribute(Integer.toString(status),"status");
                
                
                
                
                RequestDispatcher rd=req.getRequestDispatcher("congrats.jsp");
                rd.forward(req, res);
                st.close();
                con.close();}
            catch(Exception e){
                System.out.println(e);
            }
            
            
        }
        catch(Exception ex){
            PrintWriter out= res.getWriter();
           HttpSession session = req.getSession();
            
            String id = (String) session.getAttribute("id");
            int price = Integer.parseInt(req.getParameter("price"));
           String name = req.getParameter("name");
           double Order_no = Double.parseDouble(req.getParameter("order"));
               int status=0;
            java.util.Date date=new java.util.Date();
            
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            out.println("fail   "+sqlDate+"  "+id+"  "+name+"  "+status+"   "+price);
            
        }
       
        
    }
}