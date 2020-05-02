<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="cast.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./css/cast.css">

</head>
<body>
<form action="#">


<%
 String dept=request.getParameter("dept");
String course=request.getParameter("class");
String year=request.getParameter("year");
int roll=Integer.parseInt(request.getParameter("roll"));
String id=request.getParameter("emailid");
String mysession=request.getParameter("mysession");
String presi=request.getParameter("presii");
String vice=request.getParameter("vicee");
String general=request.getParameter("generall");
String joint=request.getParameter("jointt");

String dr=request.getParameter("radio3");
String pupin;
if((String)session.getAttribute("puppin")!=null)
{
	 pupin=(String)session.getAttribute("puppin");
}
out.println(pupin);


try {
	 Connection con=null;
	String connectionURL = "jdbc:mysql://localhost:3306/vote"; 
	 
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	con = DriverManager.getConnection(connectionURL, "root", "");
	
	
	  String sql4="insert into castvote(Pupin_no,Department,Roll_No,Course ,Year,Session) values (?,?,?,?,?,?)";
		 PreparedStatement ps=con.prepareStatement(sql4);
		 ps.setString(1,pupin);
		 ps.setString(2,dept);
		 ps.setInt(3,roll);
		 ps.setString(4,course);
		 ps.setString(5,year);
		  ps.setString(6,mysession);
		 int i=ps.executeUpdate();
		 
		 String sql5="update president set Count=Count+1 where Code=?";
		 PreparedStatement ps1=con.prepareStatement(sql5);
		 ps1.setString(1,presi);
		 int i1=ps1.executeUpdate();
		 
		 String sql6="update vice_president set Count=Count+1 where Code=?";
		 PreparedStatement ps2=con.prepareStatement(sql6);
		 ps2.setString(1,vice);
		 int i2=ps2.executeUpdate();
		 
		 String sql7="update general_secretary set Count=Count+1 where Code=?";
		 PreparedStatement ps3=con.prepareStatement(sql7);
		 ps3.setString(1,general);
		 int i3=ps2.executeUpdate();
		 
		 String sql8="update joint_secretary set Count=Count+1 where Code=?";
		 PreparedStatement ps4=con.prepareStatement(sql8);
		 ps4.setString(1,joint);
		 int i4=ps4.executeUpdate();
		 
		 String sql9="update dr_vote set Count=Count+1 where Name=? and Department=?";
		 PreparedStatement ps5=con.prepareStatement(sql9);
		 ps5.setString(1,dr);
		 ps5.setString(2,(String)session.getAttribute("deptt"));
		 int i5=ps5.executeUpdate();
		 if(i>0 && i1>0 && i2>0 &&i3>0 && i4>0 && i5>0)
		 {
			 %>
			  <script>
			  alert("Your Response is saved Successfully");	
	          </script>
<% 	     }
		 else
		 {
			 %>
			  <script>
			  alert("Your Response is not Submitted");	
	          </script>
<%      }
	}
	catch(Exception ex)
    {%>
	
	
	   <%out.println(ex.getMessage()); %>
		<script> alert("Something Went Wrong..");</script>
		
		<% }
%>


</form>
</body>
</html>