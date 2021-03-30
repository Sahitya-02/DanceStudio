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
String cmail=request.getParameter("cmail");
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver class loaded");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("delete from choreo where cmail=?");
pstmt.setString(1, cmail);
pstmt.executeUpdate();
response.sendRedirect("cdetails.jsp");

%>
</body>
</html>