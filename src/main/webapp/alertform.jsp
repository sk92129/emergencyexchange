<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Alert Form</title>
</head>
<body>


<form action="alertadd.jsp" method="POST">
Sender Name: <input type="text" name="senderName">
<br>
Sender ID: <input type="text" name="senderId">

<br />
Status:
<select name="status">
<option value="none">None</option>

<option value="actual">Actual</option>
<option value="predicted">Predicted</option>
<option value="false">False</option>

</select>
<br>
Message Type:
<select name="messageType">
<option value="none">None</option>

<option value="update">Update</option>
<option value="new">New</option>
<option value="delete">Delete</option>

</select>



<br>

Location (lat lon): <input type="text" name="area-geometry" >

<br>

Area Description: <input type="text" name="area-description" >

<br>


<input type="submit" value="Submit" />
</form>

</body>
</html>