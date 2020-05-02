<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import ="java.sql.*" %>
    <%@ page import="java.util.*" %>
   <%@ include file="register.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<form action="#">

<% 
try {
       
        
		String connectionURL = "jdbc:mysql://localhost:3306/vote"; 
		
		Connection con=null;
	    
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		con = DriverManager.getConnection(connectionURL, "root", "");
 
		
		 String s1=request.getParameter("pupin");
		 String name=request.getParameter("name");
	        String d1=request.getParameter("dept");
	        String course=request.getParameter("Class");
	        String email=request.getParameter("emailid");
	        int roll=Integer.parseInt(request.getParameter("rollno"));
	        String year=request.getParameter("year");
	        String password=request.getParameter("password");
	        String confrmpassword=request.getParameter("confirm");
	    
	    String sql4="insert into register(Pupin_no, Name,Department, Course,Email_id,Roll_No ,Year,Password,Confirm) values (?,?,?,?,?,?,?,?,?)";
		 PreparedStatement ps=con.prepareStatement(sql4);
		 ps.setString(1,s1);
		 ps.setString(2,name);
		 ps.setString(3,d1);
		 ps.setString(4,course);
		 ps.setString(5,email);
		 ps.setInt(6,roll);
		 ps.setString(7,year);
		 ps.setString(8,password);
		 ps.setString(9,confrmpassword);
		 int i=ps.executeUpdate();
	    if (i > 0) {
	    %>
	      <% response.sendRedirect("login.html");%>
	<%     } 
	    else {
	  %>  
	      <% response.sendRedirect("register.html");%>
 <%      }
	}
	catch(Exception ex)
    {%>
	
		<script> alert("Something Went Wrong..");</script>
         
<%     }
%>








</form>
</body>
</html>