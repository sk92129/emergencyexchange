<%@ page import="java.io.*,java.util.*, java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Historical Alerts</title>
</head>
<body>

<%
	

// JDBC driver name and database URL
final String JDBC_DRIVER = "org.postgresql.Driver";  
final String DB_URL = "jdbc:postgresql://localhost:5432/mydb";

//  Database credentials
final String USER = "postgres";
final String PASS = "password";
StringBuffer sb = new StringBuffer();


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
   
   stmt = conn.createStatement();
   String sql = "select * from alert " +
                "order by sent";
   
   ResultSet rs = stmt.executeQuery(sql);
   while (rs.next()){
	   sb.append("<br>");
	   sb.append(" identifier:");
	   rs.getString(1);
	   
	   sb.append(" sender: ");
	   rs.getString(2);
	   
	   sb.append(" sent: ");
	   rs.getString(3);
	   
	   
   }
   
   
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
	Results:
	<%=sb.toString() %>

    End of Results
</body>
</html>