<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="dashboard.jsp" %>
     <%@ include file="cast.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="#">
<%session.removeAttribute("pupin"); 
session.removeAttribute("myname");
session.removeAttribute("deptt");
response.sendRedirect("login.html");
%>
</form>
</body>
</html>