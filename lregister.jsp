<%@page import="java.sql.*" %>
<%
String name=request.getParameter("lname");
String mail=request.getParameter("lmail");
String pswd=request.getParameter("lpswd");
String pswd2=request.getParameter("lpswd2");
%>
<%
try{
      Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
      System.out.println("connection");
      PreparedStatement psmt=con.prepareStatement("insert into learner values(?,?,?,?)");
    psmt.setString(1,name);
    psmt.setString(2,mail);
    psmt.setString(3,pswd);
    psmt.setString(4,pswd2);
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
    %>