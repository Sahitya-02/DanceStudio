<%@page import="java.sql.*" %>

<%
  String dtype=request.getParameter("dtype");
  String slot=request.getParameter("slot");
  String duration=request.getParameter("duration");
  String amt=request.getParameter("amt");
  String paytype=request.getParameter("paytype");
  String lmail=(String)session.getAttribute("lmail");
 
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    PreparedStatement psmt=con.prepareStatement("insert into booking values(?,?,?,?,?,?)");
    psmt.setString(1,lmail);
    psmt.setString(2,dtype);
    psmt.setString(3,slot);
    psmt.setString(4,duration);
    psmt.setString(5,amt);
    psmt.setString(6,paytype);
    int n=psmt.executeUpdate();
    if(n>0)
    {            
    
      response.sendRedirect("payment.jsp");
    }
    else
    {
      out.println("check your details");
      response.sendRedirect("learner.html");
    
    }

  }
  catch(Exception e){
	  System.out.println(e);
  }


%>