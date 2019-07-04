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

public class formfill extends HttpServlet{
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
        try{
            int coerid = Integer.parseInt(req.getParameter("cid"));
            String name=req.getParameter("name");
            String email=req.getParameter("email");
            /*SimpleDateFormat date1 = new SimpleDateFormat("mm/dd/yyyy");
            java.sql.Date date = (Date) date1.parse(req.getParameter("dob"));*/
           String date=req.getParameter("date");
            
            long phone =Long.parseLong(req.getParameter("phone"));
            String pass= req.getParameter("password");
            PrintWriter out= res.getWriter();
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
                PreparedStatement st =con.prepareStatement("insert into data values (?,?,?,?,?,?)");
                st.setInt(1, coerid);
                st.setString(2, name);
                st.setString(3,email);
                st.setString(4,date);
                st.setLong(5, phone);
                st.setString(6, pass);
                int count  = st.executeUpdate();
                out.println(count);
                res.sendRedirect("../main.html");
                st.close();
                con.close();}
            catch(Exception e){
                out.print("Error in DBMS Connectivity....");
            }
            
            
        }
        catch(Exception ex){
            Logger.getLogger(formfill.class.getName()).log(Level.SEVERE, null,ex);
        }
       
        
    }
}