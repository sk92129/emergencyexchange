<%@ page import="java.io.*,java.util.*, java.sql.*, lionsteins.*" %>
<%@ page contentType="text/xml" %>

<jsp:useBean id="alert" class="lionsteins.AlertBean" />

<%

   AlertBean alertBean = new AlertBean();


%>
<alert xmlns = "urn:oasis:names:tc:emergency:cap:1.2">

  <identifier><%=alertBean.getId()%>></identifier> 

  <sender><%=alertBean.getSenderName() %>></sender> 

  <sent><%=alertBean.getSentTime() %>></sent>

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
