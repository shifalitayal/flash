<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ include file="login.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String s= request.getParameter("loginmethod");
   if(s.equals("students"))
   {%>
	  <% response.sendRedirect("student.html") ;
   }
   else if(s.equals("admin"))
   {%>
	   <%
	   response.sendRedirect("admin.html");
   }%>


</body>
</html>