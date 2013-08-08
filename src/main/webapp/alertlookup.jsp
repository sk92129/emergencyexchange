<%@ page import="java.io.*,java.util.*, java.sql.*" %>
<%@ page language="java" contentType="text/xml; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">






<?xml version = "1.0" encoding = "UTF-8"?>

<%
	String id = request.getParameter("id");
	
//JDBC driver name and database URL
final String JDBC_DRIVER = "org.postgresql.Driver";  
final String DB_URL = "jdbc:postgresql://localhost:5432/mydb";

//Database credentials
final String USER = "postgres";
final String PASS = "password";
StringBuffer sb = new StringBuffer();


Connection conn = null;
Statement stmt = null;
boolean ok=false;
int count = 0;
String senderName;
String sentTime;
try{
//STEP 2: Register JDBC driver
Class.forName(JDBC_DRIVER);

conn = DriverManager.getConnection(DB_URL, USER, PASS);




stmt = conn.createStatement();
String sql = "select * from alert " +
             "where identifier = '" + id + "'";

ResultSet rs = stmt.executeQuery(sql);
if (rs.next()){
	    //id = rs.getString(1);
	   //sb.append(" sender: ");
	   senderName = (rs.getString(2));
	   
	   //sb.append(" sent: ");
	   sentTime = (rs.getString(3));
	  count++; 
	   
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

<alert xmlns = "urn:oasis:names:tc:emergency:cap:1.2">

  <identifier><%=id%>></identifier> 

  <sender><%=senderName %>></sender> 

  <sent><%=sentTime %>></sent>

  <status>Actual</status> 

  <msgType>Update</msgType>

  <scope>Public</scope>

  <references>trinet@caltech.edu,TRI13970876.1,2003-06-11T20:30:00-07:00</references>

  <info>

    <category>Geo</category>

    <event>Earthquake</event>   

    <urgency>Past</urgency>   

    <severity>Minor</severity>   

    <certainty>Observed</certainty>

    <senderName>Southern California Seismic Network (TriNet) operated by Caltech and USGS</senderName>

    <headline>EQ 3.4 Imperial County CA</headline>

    <description>A minor earthquake measuring 3.4 on the Richter scale occurred near Brawley, California at 8:30 PM Pacific Daylight Time on Wednesday, June 11, 2003. (This event has now been reviewed by a seismologist)</description>

    <web>http://www.trinet.org/scsn/scsn.html</web>

    <parameter>

      <valueName>EventID</valueName>

      <value>13970876</value>

    </parameter>

    <parameter>

      <valueName>Version</valueName>

      <value>1</value>

    </parameter>

    <parameter>

      <valueName>Magnitude</valueName>

      <value>3.4 Ml</value>

    </parameter>

    <parameter>

      <valueName>Depth</valueName>

      <value>11.8 mi.</value>

    </parameter>

    <parameter>

      <valueName>Quality</valueName>

      <value>Excellent</value>

    </parameter>

    <area>       

      <areaDesc>1 mi. WSW of Brawley, CA; 11 mi. N of El Centro, CA; 30 mi. E of OCOTILLO (quarry); 1 mi. N of the Imperial Fault</areaDesc>

      <circle>32.9525,-115.5527 0</circle>  

    </area>

  </info>

</alert>
