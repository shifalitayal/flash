<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import ="java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/cast.css">
<script>
function myFunction()
{
	document.getElementById("logout").action="logout.jsp";
	
}

</script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<form action="castback.jsp">
<div class="color">
  <div class="heading">
<ul>
  <li ><a href="dashboard.jsp" name="home">Home</a></li>
     <li><a href="guidelines.jsp" name="guidelines">Guidelines</a></li>
  <li class="active">Cast Your Vote</a></li>
  <li><a href="contact.jsp" name="contact">Contact</a></li>
  
  
</ul>
</div>
   <div class="dropdown">
 <img src="icon.png" width="40" height="40"/>
    <button class="dropbtn"><b><%=session.getAttribute("myname") %></b>
      <i class="fas fa-angle-down"></i>
    </button>
    <div class="dropdown-content">
      <button class="button" id="logout" onclick="myFunction()">Logout</button>

 </div>
 </div>
</div>

<div class="voting">
  <div class="details">
      <h3>STUDENT  DETAILS</h3>
  </div>
  <div class="mydetails">
      
      <ul>
      <li>Dept :<select name="dept" required>
                  <option val=" ">Choose Dept</option>
                  <option val="DCSA ">DCSA</option>
                 
            </select>
      <li>Roll_No :<input type="text" name="roll"  class="text" required></li>
        <li>Class :<select name="class" required>
                  <option val=" ">Choose Class</option>
                  <option val="MCA ">MCA</option>
                  <option val="M.Sc">M.Sc</option>
                   <option val="P.hd">P.hd</option>
            </select>
      </li>    
      <li>Year :
      <select name="year" required>
                  <option val=" ">Choose Year</option>
                  <option val="Ist">Ist</option>
                  <option val="2nd">2nd</option>
                  <option val="3rd">3rd</option>
            </select>
      
      </li>
      <li>Session :
      <input type="text" name="mysession" id="sessn" class="text" required>
      </li>
      </ul>
  
  </div>
  </div>
  

 <div class="campus">
 <div class="vote"><h3>CAMPUS   VOTING</h3></div><br/>
 <div class="myvoting">
 <%! Connection con=null;
		Statement st=null;
		ResultSet rs,rs1,rs2,rs3,rs4=null;%>
  <% 
try {

		String connectionURL = "jdbc:mysql://localhost:3306/vote"; 
		 
		
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		con = DriverManager.getConnection(connectionURL, "root", "");
		 st=con.createStatement();
		String sql="SELECT * from president";
		
		
         rs =st.executeQuery(sql);
       
        
        %>
 <table cellspacing="3" id="campusdata">
    <tbody>
       <tr id="presi">
       <td id="heading"><i>President  :</i></td>
       
 <%       while(rs.next())
       { 
           %>
      	 <td ><%=rs.getString("Code") %></td>
      	  
      	 <td > <%=rs.getString("Name") %><input type="radio" value=" <%=rs.getString("Code") %>" name="presii" ></td>
     <%   
       }%>
         </tr>
         
		 <tr>
		 <td id="heading"><i>Vice- President :</i></td>
	<% 	 st=con.createStatement();
		 String sql1="SELECT * from vice_president";
		   rs1 =st.executeQuery(sql1);
		   %>
   <%        while(rs1.next())
         { 
          %>
          <td><%=rs1.getString("Code") %></td>
      	  
      	 <td> <%=rs1.getString("Name") %><input type="radio" value="<%=rs1.getString("Code") %>" name="vicee" ></td>
	       
        <%   
        }%>
       </tr>
        <tr>
       <td id="heading"><i>General-Secretary :</i></td>
       <% 	 st=con.createStatement();
		 String sql2="SELECT * from general_secretary";
		   rs2 =st.executeQuery(sql2);
		   %>
  <%       while(rs2.next())
         { 
          %>
          <td><%=rs2.getString("Code") %></td>
      	  
      	 <td > <%=rs2.getString("Name") %><input type="radio" value="<%=rs2.getString("Code") %>" name="generall" ></td>
	       
        <%   
        }%>
       </tr>
       <tr>
       <td id="heading"><i>Joint-Secretary :</i></td>
       <% 	 st=con.createStatement();
		 String sql3="SELECT * from joint_secretary";
		   rs3 =st.executeQuery(sql3);
		   %>
 <%         while(rs3.next())
         { 
          %>
          <td><%=rs3.getString("Code") %></td>
      	  
      	 <td> <%=rs3.getString("Name") %><input type="radio" value="<%=rs3.getString("Code") %>" name="jointt" ></td>
	       
        <%   
        }%>
       </tr>

       
       
   </tbody>
    </table>
    
 
 </div>
  
 </div>
<div class="student">
 <div class="drvote">
 <h3>DEPARTMENT   VOTING</h3>
 </div>
<div class="myvote">
  <table  id="studentdata">
   <tbody>
   <tr>
   <td id="heading"><i>Department - Representatives :</i></td>
   
   <%    
	String dept=(String)session.getAttribute("deptt");
     // out.println(dept);
		 String sql4="SELECT * from dr_vote where Department=?";
		 PreparedStatement ps=con.prepareStatement(sql4);
		 ps.setString(1,dept);
		   rs4 =ps.executeQuery();
		   
         while(rs4.next())
         { 
          %>
          
      	  
      	 <td> <%=rs4.getString("Name") %><input type="radio" value="<%=rs4.getString("Name") %>" name="radio3"></td>
	       
        <%   
        }%> 
   </tr>
          
<% }
  catch(Exception e)
{ 
    %>
     <%out.println(e.getMessage()); %>
    <script> alert("Something Went Wrong..");</script>
	 
	 <%}

%>
   
   </tbody>
  
  </table>
</div>
</div>
<div class="login">
 <input type="submit"  class='btn-login' id="do-login" value="SUBMIT YOUR RESPONSE" "  >
</div>


</form>
</body>
</html>