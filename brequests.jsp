<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking requests</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(https://wallpapercave.com/wp/JvCoA3p.jpg);
	font-family: 'Josefin Sans', sans-serif;
    font-family: 'Jost', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
	background-repeat: no-repeat;
    background-size: cover;
}
h2{
	color:white;
	
}

.nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  left: 0;
  overflow: hidden;
  background:transparent;
  position: fixed;
  top: 0px;
  align:left;
 
}
.nav{
	overflow: hidden;
    border: 1px solid black;
    background-image: url(https://wallpapercave.com/wp/JvCoA3p.jpg);
}


.nav li {
  float: left;
    
}

.nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 16px 16px;
  text-decoration: none;
}

.nav li a:hover:not(.active) {
  background-color: #fff;
  color:black;
}

.nav .active {
  background-color: red;
}
#requests {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 70%;
}

#requests td, #requests th {
  border: 4px solid black;
  padding: 8px;
  color:black;
}

#requests tr:nth-child(even){background-color: #f2f2f2;}
#requests tr:nth-child(odd){background-color: #f2f2f2;}



#requests th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: red;
  color: white;
}


#submit{
	background-color: black;
	border: 2px solid black;
	border-radius: 4px;
	color: #fff;
	
	font-family: inherit;
	font-size: 16px;
	
	width: 100%;
}
#submit:hover{
	background-color: white;
	color: black;
}

</style>
</head>
<body>
<div class="nav">
		<ul>
		  <li><a href="choreo.html">HOME</a></li>
		  <li><a href="brequests.jsp" class="active">REQUESTS</a></li>
		  <li><a href="#">MY SLOTS</a></li>
		  
		  <li><a href="login.html">LOGOUT</a></li>
		</ul>
	</div>
	<table align="center" border=1 id="requests">
	<tr>
	<th>STUDENT EMAIL</th>
	<th>DANCE TYPE</th>
	<th>SLOT</th>
	<th>DURATION</th>
	<th>Accept/Ignore</th>
	</tr>
	<%
	Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    ResultSet rs=con.createStatement().executeQuery("select * from booking");
    
    
    while(rs.next()){
    %>
    <tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><a href="daccepts.jsp?email=<%=rs.getString("email")%>"><input type="submit" id="submit" value="Accept"></a></td>
    </tr>
    <% 
    }
    %>
	
	</table>
</body>
</html>