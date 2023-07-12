<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
<%

String uname =request.getParameter("uname");
String feedback = request.getParameter("feedback");



try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor?useSSL=false","root","0212");
	PreparedStatement pst = con.prepareStatement("insert into feedback values(?,?)");
	pst.setString(1, uname);
	pst.setString(2, feedback);
	
	
	int count=pst.executeUpdate();
	if(count>0)
	{
		out.println("<h1>Insertted successfully.........</h1>");
	}
	else
	{
		 %> <jsp:forward page="user.jsp"/><%
		out.println("<h1>Insertion Failed...............</h1>");
	}
	
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>