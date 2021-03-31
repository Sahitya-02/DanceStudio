<%@page import="java.sql.*" %>

<%

String lname=request.getParameter("lname");
String lmail=request.getParameter("lmail");
String lpswd=request.getParameter("lpswd");
String lpswd2=request.getParameter("lpswd2");

%>
<%
if(lpswd.equals(lpswd2)){
try{
      Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
      System.out.println("connection");
      PreparedStatement psmt=con.prepareStatement("insert into learner values(?,?,?,?)");
      psmt.setString(1,lname);
      psmt.setString(2,lmail);
      psmt.setString(3,lpswd);
      psmt.setString(4,lpswd2);
      int n=psmt.executeUpdate();
  
    if(n>0)
    {            
    
      response.sendRedirect("llogin.html");
    }
    else
    {
      out.println("check your details");
      response.sendRedirect("lregister.html");
    
    }
}
catch(Exception e)
{
  out.println(e);
}
}
else{
	out.println("password not matching");
	response.sendRedirect("lregister.html");
}
    %>