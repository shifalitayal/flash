import java.sql.*;
class Database{
	public void connect(){
	{
		try {

			String connectionURL = "jdbc:mysql://localhost:3306/vote"; 
			 
			Connection con=null;
		    
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			con = DriverManager.getConnection(connectionURL, "root", "");
	 
			if(!con.isClosed())
	
	        System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		}
		catch(Exception ex)
	    {
		
			
	         System.out.println("Unable to connect to database. "+ex.getMessage());
	    }

	}
}