<%@ page import="java.io.*,java.util.*, java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Add Alert Confirmation</title>
</head>
<body>

<%
/*
   Enumeration paramNames = request.getParameterNames();

   while(paramNames.hasMoreElements()) {
      String paramName = (String)paramNames.nextElement();
      out.print("<tr><td>" + paramName + "</td>\n");
      String paramValue = request.getParameter(paramName);
      out.println("<td> " + paramValue + "</td></tr>\n");
   }
*/ 
	String sender = request.getParameter("senderName");
   
   
   // JDBC driver name and database URL
   final String JDBC_DRIVER = "org.postgresql.Driver";  
   final String DB_URL = "jdbc:postgresql://localhost:5432/mydb";

   //  Database credentials
   final String USER = "postgres";
   final String PASS = "password";
   
   
   Connection conn = null;
   Statement stmt = null;
   boolean ok=false;
   try{
      //STEP 2: Register JDBC driver
      Class.forName(JDBC_DRIVER);

      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      
      
      String identifier = UUID.randomUUID().toString().substring(0, 29);
      
      java.util.Date utilDate = new java.util.Date(System.currentTimeMillis());
      
      java.sql.Date date=new java.sql.Date(utilDate.getTime());
      Timestamp timestamp = new Timestamp(date.getTime());
      
      
      String sql = "INSERT INTO alert (identifier, sender, sent) " +
                   "VALUES (?, ?, ?)";
      
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setString(1, identifier);
      ps.setString(2, sender);
      ps.setTimestamp(3, timestamp);
      ps.executeUpdate();
		ok = true;
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try

   
   
%>


	<% 
		if (ok) {
			
	%>
		Successfully added
		<br>
		<a href="alertform.jsp" >Add More</a><br>
		<a href="alertquery.jsp" > View All Alerts</a>
		<%  } else {%>
		
			Failed to add <br>
			Click the back button to go back and re-fix the add.
		<%
		}
		%>

</body>
</html>