<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

<%
String email = request.getParameter("email");
String cmail=(String)session.getAttribute("cmail");
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");  
System.out.println("Connection Established");
PreparedStatement pstmt=con.prepareStatement("select * from booking where email=?");
pstmt.setString(1,email);
ResultSet rs=pstmt.executeQuery();
rs.next();
String dtype=rs.getString("dtype");
String slot=rs.getString("slot");
String duration=rs.getString("duration");
pstmt=con.prepareStatement("insert into confirmation values(?,?,?,?,?) ");
pstmt.setString(1,cmail);
pstmt.setString(2,email);
pstmt.setString(3,dtype);
pstmt.setString(4,slot);
pstmt.setString(5,duration);
pstmt.executeUpdate();

 pstmt = con.prepareStatement("delete from booking where email=?");
 pstmt.setString(1,email);
 pstmt.executeUpdate();
 
 response.sendRedirect("brequests.jsp");

%>
</body>
</html>