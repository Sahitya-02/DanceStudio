<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String lmail=request.getParameter("lmail");
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver class loaded");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
System.out.println("connection established");
PreparedStatement pstmt=con.prepareStatement("delete from learner where lmail=?");
pstmt.setString(1, lmail);
pstmt.executeUpdate();
response.sendRedirect("ldetails.jsp");
%>
</body>
</html>