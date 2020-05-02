<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*" %>
    
      <%@ page import="java.lang.*" %>
    
    <%@ include file="student.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student back</title>
</head>
<body>


<%

String pupinn=request.getParameter("pupin");
String name=request.getParameter("name");
String dept=request.getParameter("Dept");
String pass=request.getParameter("password");
out.println(request.getParameter("pupin"));

session.setAttribute("myname", name);
session.setAttribute("puppin", pupinn);
session.setAttribute("deptt", dept);

try{
	
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	String connectionURL = "jdbc:mysql://localhost:3306/vote"; 
	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	con = DriverManager.getConnection(connectionURL, "root", "");
	String sql="SELECT * from register where Pupin_no=?";
	
	 ps=con.prepareStatement(sql);
	ps.setString(1,pupinn);
	
     rs=ps.executeQuery();
    
     String name1="",Dept="",pas="";
     while(rs.next())
	{
     name1=rs.getString("Name");
	
	 Dept=rs.getString("Department");
	 pas=rs.getString("Password");
    }
	
	
	if(!name.equals(name1))
	{ %>
 		   <%  out.println("hiiiiiii");
 		
  	}
	else if(!dept.equals(Dept))
	{%>
	   <%out.println("hiiiiiii");

		
	}
	else if(!pass.equals(pas))
	{%>
			   <%out.println("hiiiiiii");

	}
	else
	{  %>
	
      <%       
      out.println("hiiiiiii hhhhhhh");
	
     }%>
	
<% }
catch(Exception ex)
{ 
   %>
   <%out.println(ex.getMessage()); %>
   


<% }	


%>

</body>
</html>