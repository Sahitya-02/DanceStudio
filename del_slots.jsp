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
String cmail= request.getParameter("cmail");
String lmail = request.getParameter("lmail");

%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");  
System.out.println("Connection Established");


 PreparedStatement pstmt = con.prepareStatement("delete from confirmation where cmail=? and lmail=?");
 pstmt.setString(1,cmail);
 pstmt.setString(2,lmail);
 pstmt.executeUpdate();
 
 response.sendRedirect("adbooked.jsp");

%>
</body>
</html>