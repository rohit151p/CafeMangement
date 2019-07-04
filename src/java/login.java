import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet{
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
        
        String i = req.getParameter("password");
        String j= req.getParameter("username");
         PrintWriter out= res.getWriter();
        try{
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement st =con.createStatement();
                if(j.equals("admin") && i.equals("123")){
                        res.sendRedirect("../Client/main.jsp");
                        }
		ResultSet rs = st.executeQuery("select name from data where coerid="+j+" && PASSWORD="+i+";");
		String userName="";
		while(rs.next()) {
                    userName=rs.getString(1);
		HttpSession session = req.getSession();
                session.setAttribute("user",userName);
                session.setAttribute("id", j);
                        
			if(userName.equals("")){
                             
                             res.sendRedirect("../main.html");
                        }
                        else{
                            
                         
                            res.sendRedirect("..//Product page//product_main.jsp");
                         
                        }
		}
		st.close();
		con.close();}
        catch(Exception e){
            System.out.println(e);
        }
       
        
    }
}