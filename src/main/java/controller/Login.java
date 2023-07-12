package controller;

import java.io.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDao;
import model.User;


@SuppressWarnings("serial")
@WebServlet("/login")
public class Login extends HttpServlet {
	
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		ServletContext context=getServletContext(); 
		String driver=context.getInitParameter("Driver");
		
		String uname=request.getParameter("uname");
		String passw=request.getParameter("passw");
		
		User u=new User(uname, passw);

		try {
			if(UserDao.loginUser(u,uname,passw))
			{
				
			       
				HttpSession session=request.getSession();  
				 session.setAttribute("uname",uname);  
			       session.setAttribute("passw",passw);  
			       request.setAttribute("uname", uname);
			       request.getRequestDispatcher("user.jsp").forward(request, response);
		           //response.sendRedirect("user.jsp");
			       
			}
		
			
			
			
			
			
			
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor?useSSL=false","root","0212");
				PreparedStatement pst = con.prepareStatement("select * from doctor where uname=? and pass=?");
				pst.setString(1, uname);
				pst.setString(2, passw);
				
			    ResultSet rs =pst.executeQuery();
			    
			    if(rs.next())
			    {
			    	HttpSession session1=request.getSession();  
				       session1.setAttribute("uname",uname);  
				       session1.setAttribute("upass",passw); 
			           response.sendRedirect("admin.jsp");
			    }
			    else
			    {
			    	RequestDispatcher dispatcher=request.getRequestDispatcher("doctorLogin.jsp");
					dispatcher.include(request,response);
					out.print("<br/><br/><br/><center><h1>Invalid Credentials. Try Again...</h1></center>");

					
					out.println("                                ");
					
					
			    }
				con.close();
				out.close();
				rs.close();
			
			/*catch(Exception e)
			{
				out.println(e);
			}*/
			
			
			
			
			
			
			
			
			
			
			
			/*if(uname.equals("admin")&& passw.equals("abc123"))
			{
				HttpSession session1=request.getSession();  
			       session1.setAttribute("uname",uname);  
			       session1.setAttribute("upass",passw); 
		           response.sendRedirect("admin.jsp");
		           
		     
			}
			else
			{
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.include(request,response);
				out.print("<br/><br/><br/><p style='color:'red''>sorry re-enter username password</p>");
			}*/
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
